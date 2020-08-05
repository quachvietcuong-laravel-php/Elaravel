<?php

namespace App\Imports;

use App\Category_Product;
use Maatwebsite\Excel\Concerns\ToModel;

class ExcelImports implements ToModel
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        return new Category_Product([
            'name' => $row[0],
            'slug' => $row[1],
            'description' => $row[2],
            'status'=> $row[3],
        ]);
    }
}
