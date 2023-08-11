<x-front-layout title='2fa authintcate'>
    <div class="account-login section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
                    <form class="card login-form" action="{{ route('two-factor.enable') }}" method="post">
                        @csrf
                        <div class="card-body">
                            <div class="title">
                                <h3>2fa auth </h3>
                                <p>You can enable 2fa auth</p>

                            </div>
                            @if (session('status') == 'two-factor-authentication-enabled')
                                <div class="mb-4 font-medium text-sm">
                                    Please finish configuring two factor authentication below.
                                </div>
                            @endif
                            <div class="button">
                                @if (!$user->two_factor_secret)
                                    <button class="btn" type="submit">Enable</button>
                                @else
                                    <div class='p-4'>
                                        {!! $user->twoFactorQrCodeSvg() !!}
                                    </div>
                                    <div>
                                        <h3>recovery code </h3>
                                        <ul>
                                            @foreach ($user->recoveryCodes() as $code)
                                                <li>{{ $code }}</li>
                                            @endforeach
                                            <ul>



                            </div>
                            @method('delete')
                            <button class="btn" type="submit">Disable</button>
                            @endif
                        </div>

                </div>
                </form>
            </div>
        </div>
    </div>
    </div>
</x-front-layout>
