@extends('admin.layout.adminMasterLayout')

@section('title', "Edit User")

@section('content')



<div class="row">
  <div class="col-xl-12">
    <div class="card mb-4">
      <div class="card-header d-flex justify-content-between align-items-center">
        <h5 class="mb-0">Edit User-{{ $user->name }}</h5>
      </div>
      <div id="output"></div>
      <div class="card-body">
         <form class="forms-sample"
               action="{{route('user.update', $user)}}"
               method="POST"
               autocomplete="off"
               enctype="multipart/form-data">
            @csrf
            @method('PATCH')

            @include('admin.users.form')

        </form>
      </div>
    </div>
  </div>
</div>

@endsection
