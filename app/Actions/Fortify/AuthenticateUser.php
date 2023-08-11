<?php
namespace App\Actions\Fortify;
use App\Models\Admin;
use Illuminate\Support\Facades\Hash;

class AuthenticateUser
{
    public function authinticate($request)
    {
       $username = $request->post(config('fortify.username'));
       $password = $request->post('password');

       $user = Admin::where('username','=',$username)
       ->Orwhere('phone_number','=',$username)
       ->Orwhere('email','=',$username)
       ->first();
        //    if($user && H)
        if($user && Hash::check($password, $user->password)) 
        {
           return $user ;
        }      
     return false;

    }
}
