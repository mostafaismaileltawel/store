<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class CheckUserType
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    // public function handle(Request $request, Closure $next )
    // {
    //     $user = $request->user();
    //     if(!$user){
    //         return redirect()->route('login');
    //     }
    //     if($user->type == 'user'){
    //         return abort(403);
    //     }
    //     return $next($request);
    // }another solution by send array clad $types and i will defined type of user in dashboard fill
    public function handle(Request $request, Closure $next,...$types )
    {
        $user = $request->user();
        if(!$user){
            return redirect()->route('login');
        }
        if(!in_array($user->type,$types)){
            return abort(403);
        }
        return $next($request);
    }
}
