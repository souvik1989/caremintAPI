<div class="mb-3">
  <label class="form-label" for="FaqQuestion">User Name<span class="text-danger">*</span></label>
  <div class="input-group input-group-merge">

   <input type="text"
           name="user_login"
           class="form-control @error('user_login') is-invalid @enderror"
           id="UserName"
           placeholder="Enter Name"
           value="{{old('user_login', isset($user->user_login) ? $user->user_login:'')}}"
           required />
  </div>
</div>

<div class="mb-3">
  <label class="form-label" for="FaqQuestion">User Email<span class="text-danger">*</span></label>
  <div class="input-group input-group-merge">

   <input type="email"
           name="user_email"
           class="form-control @error('user_email') is-invalid @enderror"
           id="UserEmail"
           placeholder="Enter Email"
           value="{{old('user_email', isset($user->user_email) ? $user->user_email:'')}}"
           required />
  </div>
</div>


<div class="mb-3">
  <label class="form-label" for="FaqQuestion">User Phone Number<span class="text-danger">*</span></label>
  <div class="input-group input-group-merge">

   <input type="text"
           name="user_phonenumber"
           class="form-control @error('user_phonenumber') is-invalid @enderror"
           id="UserPhone"
           placeholder="Enter Phone Number"
           value="{{old('user_phonenumber', isset($user->user_phonenumber) ? $user->user_phonenumber:'')}}"
           required />
  </div>
</div>


<div class="mb-3">
  <label class="form-label" for="FaqQuestion">User Address<span class="text-danger">*</span></label>
  <div class="input-group input-group-merge">

  <textarea rows="4" name="user_address" class="form-control no-resize Editor" placeholder="Address">{{old('user_address') ?? ($user->user_address ?? '') }}</textarea>
  </div>
</div>


<div class="mb-3">
  <label class="form-label" for="FaqQuestion">User PIN Code<span class="text-danger">*</span></label>
  <div class="input-group input-group-merge">

   <input type="text"
           name="user_pincode"
           class="form-control @error('user_pincode') is-invalid @enderror"
           id="UserPin"
           placeholder="Enter PIN"
           value="{{old('user_pincode', isset($user->user_pincode) ? $user->user_pincode:'')}}"
           required />
  </div>
</div>




<!-- <div class="mb-3">
    <div class="row">
      <div class="col-md-7">
        <label for="ProfileImage" class="form-label">
          Banner Image
        </label>
        <input type="file" name="banner_image" accept="image/*" id="ProfileImage" onchange="showSelectedImage(this)" class="form-control @error('banner_image') is-invalid @enderror" />
      </div>

      <div class="col-md-5">
          <img src="{{ isset($category->banner_image) ? config("app.url").Storage::url($category->banner_image) : asset('adminAssets/img/default-image.png') }}"
           id="SelectedImg"
           class="w-px-100 h-px-100 rounded-circle"
           title="Banner Image"
           alt="Banner_image">
      </div>
    </div>
  </div> -->




<button type="submit" class="btn btn-primary">{{isset($user) ? 'Update' : 'Create'}}</button>
<a class="btn btn-dark" href="{{ route('user.index') }}">Cancel</a>





@include('admin.common.scripts')




