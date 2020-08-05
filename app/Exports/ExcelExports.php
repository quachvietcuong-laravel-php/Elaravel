<?php

namespace App\Exports;

use App\Category_Product;
use Maatwebsite\Excel\Concerns\FromCollection;

class ExcelExports implements FromCollection
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return Category_Product::all();
    }
}
