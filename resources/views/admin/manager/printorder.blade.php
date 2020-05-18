<style> 
body{
    font-family: DejaVu Sans;
}
center, h2{
    font-size: 25px;
    font-weight: bold;
}
center, span{
    font-size: 20px;
    font-weight: bold;
}
h4{
    margin-left:50px;
}
.title{
    margin-left:50px;
    font-size: 18px;
}
.title span{
    font-size: 16px;
    font-weight: none;
}
.table-details{
    border-collapse: collapse;
    text-align: center;
}
.table-details td, th{
    border: 1px solid black;
    padding: 10px;
}
.table-details th{
    height: 50px;
}
</style>

    <center>
    <h2>Công ty TNHH một thành viên RSL</h2>
    <span>Độc lập - Tự do - Hạnh phúc</span>
    </center>
    <h4>Mã đơn hàng: {{ $order_pdf->id }} - Ngày đặt hàng: {{ date('d-m-Y' , strtotime($order_pdf->created_at)) }}</h4>
    <p class="title">- Thông tin người đặt hàng:</p>

    <table class="table-details" align="center">
    <thead>
        <tr>
            <th>Tên khách hàng</th>
            <th>Số điện thoại</th>
            <th>Email</th>
            <th>Địa chỉ giao hàng</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>{{ $order_pdf->customers->name }}</td>
            <td>{{ $order_pdf->checkout->phone }}</td>
            <td>{{ $order_pdf->customers->email }}</td>
            <td>{{ $order_pdf->checkout->address }}</td>
        </tr>
    </tbody>
    </table>
    <p class="title">- Thông tin đơn hàng:</p>
    <table class="table-details" align="center">
    <thead>
        <tr>
            <th>Tên sản phẩm</th>
            <th>Màu</th>
            <th>kích cỡ</th>
            <th>Số lượng</th>
            <th>Đơn giá</th>
            <th>Thành tiền</th>
        </tr>
    </thead>
    <tbody>
        @foreach($orderDetailsPDF as $odt)
            <tr>
                <td>{{ $odt->product_name }}</td>
                <td>{{ $odt->color_details->color->name }}</td>
                <td>{{ $odt->size_details->name }}</td>
                <td>{{ $odt->product_sale_quantity }}</td>
                <td>{{ number_format($odt->product_price) }} đ</td>
                <td>{{ $totalPrice = number_format($odt->product_sale_quantity * $odt->product_price) }} đ</td>
            </tr>
        @endforeach
            <tr>
                <td colspan="6">--------------------------------------------------------------</td>
            </tr>
            <tr>
                <td colspan="3">{{ $couponPDFname.$couponPDFsale }}</td>
                <td rowspan="2" colspan="3">Số tiền cần thanh toán: {{ $order_pdf->total . ' đ' }}</td>
            </tr>
            <tr>
                <td colspan="3">Số tiền giảm:
                    @if($order_pdf->coupon_id != 0)
                        @if($couponPDF->condition == 1)
                            <?php
                                $totalAfter       = str_replace(',', '' , $order_pdf->total);
                                $totalPriceFormat = str_replace(',', '' , $totalPrice);
                            ?>
                            {{ number_format($totalPriceFormat - $totalAfter) . ' đ' }}
                        @else
                            {{ number_format($couponPDF->number) . ' đ' }}
                        @endif
                    @else
                        0 đ
                    @endif
                </td>
            </tr>
            </tbody>
            </table>
            <div style="margin-top:20px;">
                <p style="margin-left:450px;">Ngày.....tháng.....năm 20....</p>
            </div>
            <div>
                <div style="float: left;margin-left:75px;">
                    <span>Người lập phiếu</span>
                    <p style="margin-left:22px;font-size:13px;">(Ký và ghi rõ họ tên)</p>
                </div>
                <div style="float: right;margin-right:75px;">
                    <span>Người nhận</span>
                    <p style="font-size:13px;">(Ký và ghi rõ họ tên)</p>
                </div>
            </div>