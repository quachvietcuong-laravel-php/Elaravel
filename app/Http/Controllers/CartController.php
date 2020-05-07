<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Str;
use App\Product;
use App\Category_Product;
use App\Brand_Product;
use App\Coupon;
use App\Color_Details;
use App\Size_Details;
use Cart;
use Session;

class CartController extends Controller
{
    //
    public function postCartAdd(Request $request){
    	$quanlity  = $request->qty;
        echo $color     = $request->color;
        echo $size      = $request->size;

    	$pCart     = Product::where('id' , '=' , $request->product_id)->first();
        $colorName = Color_Details::where('product_id' , $pCart->id)->where('id' , $color)->first();
        $SizeName  = Size_Details::where('product_id' , $pCart->id)->where('id' , $size)->first();

        // echo "<pre>";
        // print_r($colorName);
        // echo "</pre>";

    	$cartItem['id']   = $pCart->id;
    	$cartItem['qty']  = $quanlity;
    	$cartItem['name'] = $pCart->name;

    	if ($pCart->sale_price != 0) {
    		$cartItem['price'] = $pCart->sale_price;
    	}else{
    		$cartItem['price'] = $pCart->unit_price;
    	}

    	$cartItem['weight']    = 123;
    	$cartItem['options']['image'] = $pCart->image;
        $cartItem['options']['color'] = $color;
        $cartItem['options']['size']  = $size;
        $cartItem['options']['color_name'] = $colorName->color->name;
        $cartItem['options']['size_name']  = $SizeName->name;

    	Cart::add($cartItem);

        // echo "<pre>";
        // print_r($cartItem);
        // echo "</pre>";

    	return Redirect::to('/cart-show');
    }

    public function getCartShow(){
    	return view('pages.cart.cart_add');
    }

    public function getCartDeleteOne($rowId){
    	Cart::remove($rowId);
        if (count(Cart::content()) == 0) {
            Session::forget('cou');
        }
    	return Redirect::to('/cart-show')->with('Success' , 'Xóa sản phẩm thành công');
    }

    public function postCartUpdate(Request $request){
    	if ($request->delete) {
            Cart::destroy();
            if(Session::get('checkout_id')){
                Session::forget('checkout_id');
            }
            if(Session::get('cou')){
                Session::forget('cou');
            }
            return Redirect::to('/cart-show')->with('Success' , 'Xóa tất cả sản phẩm thành công');
        }elseif($request->update_all){
            for ($i = 0; $i < $request->count; $i++) { 
                $rowId = $request->input("rowId" . $i);
                $qty   = $request->input("qty" . $i);
                Cart::update($rowId , $qty);
            }
            return Redirect::to('/cart-show')->with('Success' , 'Cập nhật số lượng sản phẩm thành công');
            // echo "<pre>";
            // print_r(Cart::content());
            // echo "</pre>";
        }elseif($request->delete_chose){
            $checked = $request->input('checked' , []);
            if ($checked) {
                foreach ($checked as $idCk) {
                    Cart::remove($idCk);
                    if (count(Cart::content()) == 0) {
                        Session::forget('cou');
                    }
                }
                return Redirect::to('/cart-show')->with('Success' , 'Xóa các sản phẩm đã chọn thành công');
            }else{
                return Redirect::to('/cart-show')->withErrors('Bạn chưa chọn sản phẩm');
            }
        }
    }

    public function postCheckCoupon(Request $request){
        $this->validate($request , 
            [
                'code'  =>  'required',
            ] , 
            [
                'code.required' =>  'Bạn chưa nhập mã khuyến mãi'
            ]
        );
        if($coupon = Coupon::where('code' , $request->code)->first()){
            if ($coupon->where('time' , '<>' , 0)) {
                $end = strtotime($coupon->end);
                $now = $request->now;
                if ($now <= $end) {
                    $cou[] = array(
                        'id'        =>  $coupon->id,
                        'name'      =>  $coupon->name,
                        'code'      =>  $coupon->code,
                        'time'      =>  $coupon->time,
                        'number'    =>  $coupon->number,
                        'condition' =>  $coupon->condition
                    );
                    Session::put('cou' , $cou);

                    // echo "<pre>";
                    // print_r(Session::get('cou'));
                    // echo "</pre>";
                    return Redirect::to('/cart-show')->with('Success' , 'Thêm mã giảm giá thành công');
                }else{
                    return Redirect::to('/cart-show')->withErrors('Mã giảm giá đã hết hạn sử dụng');
                }
            }else{
                return Redirect::to('/cart-show')->withErrors('Mã giảm giá đã hết');
            }
        }else{
            return Redirect::to('/cart-show')->withErrors('Mã giảm giá không đúng');
        }
    }

    public function getDeleteCoupon(){
        if (Session::get('cou')) {
            Session::forget('cou');
            return Redirect::to('/cart-show')->with('Success' , 'Xóa mã khuyến mãi thành công');
        }
    }
}
