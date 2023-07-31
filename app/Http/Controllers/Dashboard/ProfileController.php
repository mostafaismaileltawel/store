<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Models\Profile;
use Illuminate\Http\Request;
use Illuminate\Validation;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use Symfony\Component\Intl\Countries;
use Symfony\Component\Intl\Languages;
class ProfileController extends Controller
{
    public function edit(){
        $user=Auth::user();
        return view('dashboard.profile.edit',['user'=>$user,
    'countries'=>Countries::getNames('en'),
    'locales'=>Languages::getNames('en')
    ]);
    }
 public function saveUpdate(Request $request){
$request->validate([
    'first_name'=>['required','string','max:255'],
    'last_name'=>['required','string','max:255'],
    'birthday'=>['nullable','date','before:today'],
    'gender'=>['in:male,female'],
    'country'=>['required','string','size:2'],
    'locale'=>['required','string','size:2']
]);
   
$user = Auth::user();
// dd($user);
$user->profile->fill( $request->all())->save();

  return Redirect::route('profile.edit')->with('success','profile update');

 }

//     public function update(Request $request){
    //$request->validate([
        //         'first_name'=>['required','string','max:255'],
        //         'last_name'=>['required','string','max:255'],
        //         'birthday'=>['nullable','date','before:today'],
        //         'gender'=>['in:male,female'],
        //         'country'=>['required','string','size:2'],
        //         'locale'=>['required','string','size:2']
        
        
        //  ]);
//         $user = Auth::user();
//         //or because request return object of user 
//         // $user=$request->user();


// $user->profile->fill( $request->all())->save();

//          /*or
//         //  $profile = $user->profile;
//         // if($profile->first_name){
//         //     $profile->update($request->all());
//         // }else{
//         //     $user->profile()->create($request->all());
//         //     //or
//         //     // $request->merge(['user_id'=>$user->id]);
//         //     // Profile::create($request->all());
//         // }*/
//         return Redirect::route('profile.edit')->with('success','profile update');

//     }
// public function update(Request $request){
//       $request->validate([
//         'first_name'=>['required','string','max:255'],
//         'last_name'=>['required','string','max:255'],
//         'birthday'=>['nullable','date','before:today'],
//         'gender'=>['in:male,female'],
//         'country'=>['required','string','size:2'],
//        'locale'=>['required','string','size:2']


 
//          ]);
//     $user = Auth::user();
//     dd($user);
     
//     //  $user->profile->fill( $request->all())->dd();

//     //   return Redirect::route('profile.edit')->with('success','profile update');

// }
}
