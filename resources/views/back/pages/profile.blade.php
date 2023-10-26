@extends('back.layouts.pages-layout')
@section('pageTitle', isset($pageTitle) ? $pageTitle : 'profile')
@section('content')

@livewire('author-profile-header')
  <hr>
  <div class="row">
    <div class="card">
        <div class="card-header">
          <ul class="nav nav-tabs card-header-tabs" data-bs-toggle="tabs">
            <li class="nav-item">
              <a href="#tabs-details" class="nav-link active" data-bs-toggle="tab">Personal Details</a>
            </li>
            <li class="nav-item">
              <a href="#tabs-password" class="nav-link" data-bs-toggle="tab">Change Password</a>
            </li>
          </ul>
        </div>
        <div class="card-body">
          <div class="tab-content">
            <div class="tab-pane active show" id="tabs-details">
              <div>
                @livewire('author-personal-details')
              </div>
            </div>
            <div class="tab-pane" id="tabs-password">
              <div>
                @livewire('author-change-password-form')
              </div>
            </div>
          </div>
        </div>
      </div>
  </div>

@endsection
@push('scripts')

  <script>
    $('#changeAuthorPictureFile').ijaboCropTool({
          preview : '',
          setRatio:1,
          allowedExtensions: ['jpg', 'jpeg','png'],
          buttonsText:['CROP','QUIT'],
          buttonsColor:['#30bf7d','#ee5155', -15],
          processUrl:'{{ route("author.change-profile-picture") }}',
          withCSRF:['_token','{{ csrf_token() }}'],
          onSuccess:function(message, element, status){
             //alert(message);
              Livewire.emit('updateAuthorProfileHeader');
              Livewire.emit('updateTopHeader');
              toastr.success(message);
          },
          onError:function(message, element, status){
            //alert(message);
            toastr.error(message);
          }
    });
  </script>
  
@endpush