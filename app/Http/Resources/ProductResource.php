<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ProductResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'name' => $this->name,
            'slug' => $this->slug,
            'description' => $this->description,
            'price' => [
                'normal'=>$this->price,
                'compare' => $this->compare_price
            ],
            'image' => $this->image_url,
            'category' => [
                'id' => $this->category->id,
                'name' => $this->category->name,
            ],
            'store' => [
                'id' => $this->store->id,
                'name' => $this->store->name
            ],

        ];
    }
}
