<?php

namespace App\Rules;

use Illuminate\Contracts\Validation\Rule;

class Filter implements Rule
{

    protected $value2;
    /**
     * Create a new rule instance.
     *
     * @return void
     */
    public function __construct($value2)
    {
    //    $this->value2= strtolower($value2); لو هرجع قيمة واحدة
    $this->value2= $value2;   

}

    /**
     * Determine if the validation rule passes.
     *
     * @param  string  $attribute
     * @param  mixed  $value
     * @return bool
     */
    public function passes($attribute, $value)
    {
            //    if(strtolower($value)=='laravel'){
    //     return false;
    //    }
    //    return true;
    // 
    //another solve for clean code
    // return !(strtolower($value)== 'laravel'); الحل هذا لو عاوز اخلي الكلمة ثابته 
     //another solve for clean code
    // return !(strtolower($value)==(strtolower($this->value2)));  //  هنا هبعت انا الكلمة ال عاوزها ولو هرجع قيمه واحده
    return !(in_array(strtolower($value), $this->value2));


}

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message()
    {
        return 'not allowed';
    }
}
