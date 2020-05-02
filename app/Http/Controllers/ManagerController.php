<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use App\Order;
use App\Payment;
use App\Checkout;
use App\Order_Details;
use App\Total_Product_Details;
use App\Coupon;
use PDF;

class ManagerController extends Controller
{
    //
    public function getPrintOrder($order_id){
        $pdf = \App::make('dompdf.wrapper');
        $pdf->loadHTML($this->print_order_convert($order_id));
        return $pdf->stream();
    }

    public function print_order_convert($order_id){
        return $order_id;
    }

    public function getAllManageOrder(){
    	$order = Order::orderBy('created_at' , 'DESC')->where('status' , '=' , 0)->paginate(10);
    	return view('admin.manager.all' , compact('order'));
    }

    public function getDetailsManageOrder($id){
    	$orderDetails   = Order_Details::where('order_id' , '=' , $id)->get();
    	$order          = Order::where('id' , '=' , $id)->first();
    	return view('admin.manager.details' , compact('orderDetails' , 'order'));
    }

    public function postDetailsManageOrder(Request $request){
        $check_cancel = Payment::where('id' , $request->order_payment_id)->first();
        if ($check_cancel->status == 1) {
           if($request->checked_order_del){
                $order = Order::where('id' , $request->order_id)->update(['status' => 3]);
                $orderDetails = Order_Details::where('order_id' , $request->order_id)->update(['status' => 3]);
                $payment      = Payment::where('id' , $request->order_payment_id)->update(['status' => 2]);

                //update coupon
                $orderCoupon  = Order::where('id' , $request->order_id)->first();
                $coupon       = Coupon::where('id' , $orderCoupon->coupon_id)->first();
                if ($coupon) {
                    $couponTime   = $coupon->time;
                    $couponTotal  = $couponTime + 1;
                    $couponUpdate = Coupon::where('id' , $orderCoupon->coupon_id)->update(['time' =>  $couponTotal]);
                }
                return Redirect::to('admin/manager/all/sending')->with('Success' , 'Hủy đơn hàng thành công');
                // echo "<pre>";
                // print_r($coupon);
                // echo '</pre>';
            }else{
                return Redirect::to('admin/manager/all/sending')->withErrors('Khách hàng đã yêu cầu hủy đơn');
            }
        }elseif ($check_cancel->status == 0){
            if($request->checked_order_del){
                $order = Order::where('id' , $request->order_id)->update(['status' => 3]);
                $orderDetails = Order_Details::where('order_id' , $request->order_id)->update(['status' => 3]);

                //update coupon
                $orderCoupon  = Order::where('id' , $request->order_id)->first();
                $coupon       = Coupon::where('id' , $orderCoupon->coupon_id)->first();
                if ($coupon) {
                    $couponTime   = $coupon->time;
                    $couponTotal  = $couponTime + 1;
                    $couponUpdate = Coupon::where('id' , $orderCoupon->coupon_id)->update(['time' =>  $couponTotal]);
                }
                return Redirect::to('admin/manager/all/sending')->with('Success' , 'Hủy đơn hàng thành công');
                // echo "<pre>";
                // print_r($coupon);
                // echo '</pre>';
            }elseif($request->checked_order_ok) {
               for ($i = 0; $i < $request->count ; $i++) {
                    if ($orderDetails = Order_Details::where('order_id' , $request->order_id)->where('product_id' , $request->input("product_id_".$i))
                        ->where('size_details_id' , $request->input("size_details_id_".$i))
                        ->where('size_color_id' , $request->input("color_details_id_".$i))
                        ->where('status' , 2)->first()) {
                        return Redirect::to('admin/manager/all/sending')->withErrors('Bạn đã check hoàn tất trong chi tiết đơn hàng rồi');
                    }else{
                        $product_sold = Total_Product_Details::where('product_id' , $request->input("product_id_".$i))
                        ->where('size_details_id' , $request->input("size_details_id_".$i))
                        ->where('color_details_id' , $request->input("color_details_id_".$i))->first();
                        if ($product_sold) {
                            if ($request->input("qty_".$i) > $product_sold->total) {
                                return Redirect::to('admin/manager/all/sending') ->withErrors('Số lượng khách đặt vượt quá số lượng hiện có'); 
                            }else{
                                $sold = $request->input("qty_".$i);
                                $product_sold->sold = $product_sold->sold + $sold;
                                if ($product_sold->old < $sold) {
                                    $product_sold->total = $product_sold->total - $sold;
                                }else{
                                    $product_sold->old   = $product_sold->old - $sold;
                                    $product_sold->total = $product_sold->total - $sold;
                                }
                                // echo "<pre>";
                                // print_r($product_sold);
                                // echo '</pre>';

                                $product_sold->save();
                                $orderDetails = Order_Details::where('order_id' , $request->order_id)->where('product_id' , $request->input("product_id_".$i))
                                ->where('size_details_id' , $request->input("size_details_id_".$i))
                                ->where('size_color_id' , $request->input("color_details_id_".$i))->update(['status' => 2]);

                                return Redirect::to('admin/manager/all/sending') ->with('Success' , 'Hoàn tất đơn hàng thành công'); 
                            }     
                        }else{
                            return Redirect::to('admin/manager/all/sending') ->withErrors('Số lượng sản phẩm không tồn tại vui lòng kiểm tra lại'); 
                        }
                    }
                }
            }     
        }
    }

    public function getCancelManageOrder($id , $idPayment){
        $order        = Order::where('id' , '=' , $id)->update(['status' => 3]);
        $orderDetails = Order_Details::where('order_id' , $id)->update(['status' => 3]);
        $payment      = Payment::where('id' , '=' , $idPayment)->update(['status' => 2]);

        //update coupon
        $orderCoupon  = Order::where('id' , $id)->first();
        $coupon       = Coupon::where('id' , $orderCoupon->coupon_id)->first();
        if ($coupon) {
            $couponTime   = $coupon->time;
            $couponTotal  = $couponTime + 1;
            $couponUpdate = Coupon::where('id' , $orderCoupon->coupon_id)->update(['time' =>  $couponTotal]);
        }

        return Redirect::to('admin/manager/all')->with('Success' , 'Hủy đơn hàng thành công');     
    }

    public function postSendingProductManageOrder(Request $request){
        $order        = Order::where('id' , $request->id)->update(['status' => 1]);
        $orderDetails = Order_Details::where('order_id' , $request->id)->update(['status' => 1]);
        return Redirect::to('admin/manager/all')->with('Success' , 'Gửi hàng thành công'); 
    }

    public function getAllSendingProductManageOrder(){
        $order = Order::orderBy('created_at' , 'ASC')->where('status' , '=' , 1)->paginate(10);
        return view('admin.manager.sending' , compact('order'));
    }

    public function postCheckedProductManageOrder(Request $request){
        $checked = Order_Details::where('order_id' , $request->id)->where('status' , 2)->get();
        // echo "<pre>";
        // print_r($checked);
        // echo "</pre>";
        if (count($checked) == 0) {
            return Redirect::to('admin/manager/all/sending')->withErrors('Bạn chưa hoàn tất đơn hàng');        
        }else{
            $order = Order::where('id' , $request->id)->update(['status' => 2]);
            return Redirect::to('admin/manager/all/sending')->with('Success' , 'Đã giao hàng thành công và đã nhận tiền');
        }    
    }

    public function getAllCheckedProductManageOrder(){
        $order = Order::orderBy('created_at' , 'DESC')->where('status' , '=' , 2)->paginate(10);
        return view('admin.manager.checked' , compact('order'));
    }

    public function getAllCancelProductManageOrder(){
        $order = Order::orderBy('created_at' , 'DESC')->where('status' , '=' , 3)->paginate(10);
        return view('admin.manager.cancel' , compact('order'));
    }
}
