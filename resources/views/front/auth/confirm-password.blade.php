<x-front-layout>
   
<div class="account-login section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
                    <form class="card login-form" action="{{route('password.confirm')}}" method="post">
                    @csrf
                        <div class="card-body">
                            <div class="title">
                                <h3>Confirm password</h3>
                            </div>


                            @if($errors->has('password'))
                            <div class="alert alert-danger">
                                {{ $errors->first('password')}}
                                </div>
                            @endif

                            <div class="form-group input-group">
                                <label for="reg-fn">Password</label>
                                <input class="form-control" type="password" name="password" id="reg-pass" required>
                            </div>


                            <div class="button">
                                <button class="btn" type="submit">Confirm</button>
                            </div>

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</x-front-layout>
