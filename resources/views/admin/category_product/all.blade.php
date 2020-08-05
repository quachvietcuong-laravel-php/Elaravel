@extends('admin.layouts.admin_layout')

@section('content')

<div class="table-agile-info">
  	<div class="panel panel-default">
	    <div class="panel-heading">
	     	Danh sách danh mục sản phẩm
	    </div>
	    <div class="row w3-res-tb">
	  		<div class="col-sm-3">
		        <div class="input-group">
		          	<input type="text" class="input-sm form-control" placeholder="Search">
		          	<span class="input-group-btn">
		            	<button class="btn btn-sm btn-default" type="button">Go!</button>
		          	</span>
		        </div>
	      	</div>
	    </div>
	    <?php alert($errors , session('Success')) ?>
		
	    <div class="table-responsive">
	      	<table class="table table-striped b-t b-light">
	        	<thead>
		          	<tr>
		            	<th>ID</th>
			            <th>Tên danh mục</th>
			            <th>Hiển thị</th>
			            <th>Mô tả</th>
			            <th style="width:30px;"></th>
		          	</tr>
	        	</thead>
		        <tbody>
		        	@foreach($cateProduct as $cateP)
			          	<tr>
				            <td>{{ $cateP->id }}</td>
				            <td>{{ $cateP->name }}</td>
				            <td>
				            	@if(checkLevel(1))
				            		<span class="text-ellipsis">
					            		@if($cateP->status == 1)
					            			<a <?php echo checkLevel(1);?> href="{{URL::to('admin/category-product/all')}}"><span class="fa-thumb-styling fa fa-thumbs-up"></span></a> 
					            		@else
					            			<a <?php echo checkLevel(1);?> href="{{URL::to('admin/category-product/all')}}"><span class="fa-thumb-styling fa fa-thumbs-down"></span></a> 
					            		@endif
					            	</span>
				            	@else
					            	<span class="text-ellipsis">
					            		@if($cateP->status == 1)
					            			<a href="{{URL::to('admin/category-product/all/unactive/' . $cateP->id)}}"><span class="fa-thumb-styling fa fa-thumbs-up"></span></a> 
					            		@else
					            			<a href="{{URL::to('admin/category-product/all/active/' . $cateP->id)}}"><span class="fa-thumb-styling fa fa-thumbs-down"></span></a> 
					            		@endif
					            	</span>
				            	@endif
				            </td>
				            <td><span class="text-ellipsis">{{ $cateP->description }}</span></td>

				            <td>
				            	@if(checkLevel(1))
				            		<a <?php echo checkLevel(1);?> href="{{URL::to('admin/category-product/all')}}" class="active" ui-toggle-class="">
					              		<i class="fa fa-pencil-square-o text-success text-active">Sửa</i>
					              	</a>
				            	@else
					              	<a href="{{URL::to('admin/category-product/edit/' . $cateP->id)}}" class="active" ui-toggle-class="">
					              		<i class="fa fa-pencil-square-o text-success text-active">Sửa</i>
					              	</a>
				              	@endif

				              	@if(checkLevel(2))
				              		<a <?php echo checkLevel(2);?> href="{{URL::to('admin/category-product/all')}}" class="active" ui-toggle-class="">
					              		<i class="fa fa-times text-danger text">Xóa</i>
					              	</a>
				              	@else				              	
					              	<a onclick="return confirm('Bạn có chắc là muốn xóa không?')" href="{{URL::to('admin/category-product/delete/' . $cateP->id)}}" class="active" ui-toggle-class="">
					              		<i class="fa fa-times text-danger text">Xóa</i>
					              	</a>
				              	@endif
				            </td>
			          	</tr>
		          	@endforeach	            
		        </tbody>
	      	</table>
	      	<br>
	      	<form action="{{ route('import-csv') }}" method="POST" enctype="multipart/form-data">
	      		@csrf
	      		<input type="file" name="file" accept=".xlsx"><br>
	      		<input type="submit" value="Import Excel" name="import_csv" class="btn btn-warning">
	      	</form>
	      	<br>
	      	<form action="{{ route('export-csv') }}" method="POST">
	      		@csrf
	      		<input type="submit" value="Export Excel" name="export_csv" class="btn btn-success">
	      	</form>
	    </div>

	    <footer class="panel-footer">
	      	<div class="row">
		        <div class="col-sm-5 text-center">
		          	<small class="text-muted inline m-t-sm m-b-sm">Tổng: {{ $cateProduct->total() }} danh mục</small>
		        </div>
		        <div class="col-sm-7 text-right text-center-xs">                
		          	{{ $cateProduct->links() }}
	    		</div>
	      	</div>
    	</footer>
  	</div>
</div>

@endsection