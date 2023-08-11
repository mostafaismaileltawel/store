<x-front-layout>
    <div class="account-login section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
                    <form class="card login-form" action="{{ route('two-factor.login') }}" method="post">
                        @csrf
                        <div class="card-body">
                            <div class="title">
                                <h3>2fa code</h3>
                                <p>you must enter 2fa code</p>
                            </div>


                            @if ($errors->has('code'))
                                <div class="alert alert-danger">
                                    {{ $errors->first('code') }}
                                </div>
                            @endif
                            @if ($errors->has('recovery_code'))
                                <div class="alert alert-danger">
                                    {{ $errors->first('recovery_code') }}
                                </div>
                            @endif

                            <div class="form-group input-group">
                                <label for="reg-fn">code</label>
                                <input class="form-control" type="text" name="code" id="reg-code">
                            </div>
                            <div class="form-group input-group">
                                <label for="reg-fn">recovery code</label>
                                <input class="form-control" type="text" name="recovery_code" id="reg-recovery_code">
                            </div>

                            <div class="button">
                                <button class="btn" type="submit">submit</button>
                            </div>

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</x-front-layout>
