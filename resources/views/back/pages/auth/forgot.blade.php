@extends('back.layouts.auth-layout')
@section('pageTitle', isset($pageTitle) ? $pageTitle : 'login')
@section('content')

<div class="page page-center">
    <div class="container container-tight py-4">
      <div class="text-center mb-4">
        <a href="." class="navbar-brand navbar-brand-autodark"><img src="{{ \App\Models\Setting::find(1)->blog_logo }}" height="36" alt=""></a>
      </div>
        @livewire('author-forgot-form')
      <div class="text-center text-muted mt-3">
        Forget it, <a href="{{ route('author.login') }}">Login</a> to the sign in screen.
      </div>
    </div>
</div>

@endsection