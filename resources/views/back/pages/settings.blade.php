@extends('back.layouts.pages-layout')
@section('pageTitle', isset($pageTitle) ? $pageTitle : 'home')
@section('content')

<div class="row align-items-center">
    <div class="col">
        <h2 class="page-title">
            Settings
        </h2>
    </div>
</div>

<div class="card">
    <div class="card-header">
      <ul class="nav nav-tabs card-header-tabs" data-bs-toggle="tabs" role="tablist">
        <li class="nav-item" role="presentation">
          <a href="#tabs-home-14" class="nav-link active" data-bs-toggle="tab" aria-selected="true" role="tab">General settings</a>
        </li>
        <li class="nav-item" role="presentation">
          <a href="#tabs-profile-14" class="nav-link" data-bs-toggle="tab" aria-selected="false" tabindex="-1" role="tab">Logo & Favicon</a>
        </li>
        <li class="nav-item" role="presentation">
          <a href="#tabs-activity-14" class="nav-link" data-bs-toggle="tab" aria-selected="false" tabindex="-1" role="tab">Social Media</a>
        </li>
      </ul>
    </div>
    <div class="card-body">
      <div class="tab-content">
        <div class="tab-pane fade active show" id="tabs-home-14" role="tabpanel">
          <div>
            @livewire('author-general-setting')
          </div>
        </div>
        <div class="tab-pane fade" id="tabs-profile-14" role="tabpanel">
          <div>
            <div class="row">
              <div class="col-md-6">
                <h3>Set blog logo</h3>
                <div class="mb-2" style="max-width: 200px">
                  <img src="" alt="" class="img-thumbnail" id="logo-image-preview" data-ijabo-default-img="{{ \App\Models\Setting::find(1)->blog_logo }}">
                </div>
                <form action="{{ route('author.change-blog-logo') }}" method="post" id="changeBlogLogoForm">
                  @csrf
                  <div class="mb-2">
                    <input type="file" name="blog_logo" class="form-control">
                  </div>
                  <button class="btn btn-primary">Change logo</button>
                </form>
              </div>
              <div class="col-md-6"> 
                <h3>Set blog favicon</h3>
                <div class="mb-2" style="max-width: 100px">
                  <img src="" id="favicon-image-preview" class="img-thumbnail" data-ijabo-default-img="{{ \App\Models\Setting::find(1)->blog_favicon }}">
                </div>
                <form action="{{ route('author.change-blog-favicon') }}" method="post" id="changeBlogFaviconForm">
                  @csrf
                  <div class="mb-2">
                    <input type="file" name="blog_favicon" class="form-control">
                  </div>
                  <button class="btn btn-primary">Change favicon</button>
                </form>
              </div>
            </div>
          </div>
        </div>
        <div class="tab-pane fade" id="tabs-activity-14" role="tabpanel">
          <div>
            @livewire('author-blog-social-media-form')
          </div>
        </div>
      </div>
    </div>
  </div>

@endsection

@push('scripts')
<script>
  $('input[name="blog_logo"]').ijaboViewer({
    preview:'#logo-image-preview',
    imageShape:'rectangular',
    allowedExtensions:['jpg','jpeg','png'],
    onErrorShape:function(message,element){
      alert(message);
    },
    onInvalidType:function(message,element){
      alert(message);
    },
    onSuccess:function(message,element){

    }
  });

  $('input[name="blog_favicon"]').ijaboViewer({
    preview:'#favicon-image-preview',
    imageShape:'square',
    allowedExtensions:['ico'],
    onErrorShape:function(message, element){
      alert(message);
    },
    onInvalidType:function(message, element){
      alert(message);
    },
    onSuccess:function(message, element){

    }
  });

  $('#changeBlogLogoForm').submit(function(e){
    e.preventDefault();
    var form = this;
    $.ajax({
      url:$(form).attr('action'),
      method:$(form).attr('method'),
      data:new FormData(form),
      processData:false,
      dataType:'json',
      contentType:false,
      beforeSend:function(){},
      success:function(data){
        toastr.remove();
        if(data.status == 1){
          toastr.success(data.msg);
          $(form)[0].reset();
          Livewire.emit('updateTopHeader');
        }else{
          toastr.error(data.msg);
        }
      }
    });
 })

 $('#changeBlogFaviconForm').submit(function(e){
  e.preventDefault();
  var form = this;
  $.ajax({
      url:$(form).attr('action'),
      method:$(form).attr('method'),
      data:new FormData(form),
      processData:false,
      dataType:'json',
      contentType:false,
      beforeSend:function(){},
      success:function(data){
        toastr.remove();
        if(data.status == 1){
          toastr.success(data.msg);
          $(form)[0].reset();
          Livewire.emit('updateTopHeader');
        }else{
          toastr.error(data.msg);
        }
      }
  })
 })

</script>
@endpush