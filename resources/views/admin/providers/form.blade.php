<div class="mb-3">
  <label class="form-label" for="FaqQuestion">Provider Name<span class="text-danger">*</span></label>
  <div class="input-group input-group-merge">

   <input type="text"
           name="user_login"
           class="form-control @error('user_login') is-invalid @enderror"
           id="ProviderName"
           placeholder="Enter Name"
           value="{{old('user_login', isset($user->user_login) ? $user->user_login:'')}}"
           required />
  </div>
</div>

<div class="mb-3">
  <label class="form-label" for="FaqQuestion">Provider Email<span class="text-danger">*</span></label>
  <div class="input-group input-group-merge">

   <input type="email"
           name="user_email"
           class="form-control @error('user_email') is-invalid @enderror"
           id="ProviderEmail"
           placeholder="Enter Email"
           value="{{old('user_email', isset($user->user_email) ? $user->user_email:'')}}"
           required />
  </div>
</div>


<div class="mb-3">
  <label class="form-label" for="FaqQuestion">Provider Phone Number<span class="text-danger">*</span></label>
  <div class="input-group input-group-merge">

   <input type="text"
           name="user_phonenumber"
           class="form-control @error('user_phonenumber') is-invalid @enderror"
           id="ProviderPhone"
           placeholder="Enter Phone Number"
           value="{{old('user_phonenumber', isset($user->user_phonenumber) ? $user->user_phonenumber:'')}}"
           required />
  </div>
</div>


<div class="mb-3">
  <label class="form-label" for="FaqQuestion">Provider Address<span class="text-danger">*</span></label>
  <div class="input-group input-group-merge">
 <input type="text"
           name="user_address"
           class="form-control @error('user_address') is-invalid @enderror"
           id="ProviderPhone"
           placeholder="Enter User Address"
           value="{{old('user_address', isset($user->user_address) ? $user->user_address:'')}}"
            />
 {{-- <textarea rows="4" name="user_address" class="form-control no-resize Editor" placeholder="Address">{{old('user_address') ?? ($user->user_address ?? '') }}</textarea>--}}
  </div>
</div>


<div class="mb-3">
  <label class="form-label" for="FaqQuestion">Provider PIN Code<span class="text-danger">*</span></label>
  <div class="input-group input-group-merge">

   <input type="text"
           name="user_pincode"
           class="form-control @error('user_pincode') is-invalid @enderror"
           id="ProviderPin"
           placeholder="Enter PIN"
           value="{{old('user_pincode', isset($user->user_pincode) ? $user->user_pincode:'')}}"
           required />
  </div>
</div>

<div class="mb-3" id="Menu2Container">
  <label class="form-label" for="level">Provider Service Categories<span class="text-danger">*</span></label>
  <div class="input-group input-group-merge">

  <select class="form-control show-tick" name="category_id[]" multiple>
                  <option value="" Disabled> Please Select Option </option>
                  @if ($categories->count() > 0)
                  @foreach ($categories as $category)
                  @if ((!empty($user->categories) && $user->categories->contains($category->id))|| collect(old('category_id'))->contains($category->id))
                  <option value="{{ $category->id }}" selected=""> {{ $category->category_name }} </option>
                  @else
                  <option value="{{ $category->id }}"> {{ $category->category_name }} </option>
                  @endif
                  @endforeach
                  @endif
               </select>
  </div>
</div>

<div class="mb-3" id="Menu2Container">
  <label class="form-label" for="level">Provider Service Pincodes<span class="text-danger">*</span></label>
  <div class="input-group input-group-merge">

  <select class="form-control show-tick" name="pincode_id[]" multiple>
                  <option value="" Disabled> Please Select Option </option>
                  @if ($pincodes->count() > 0)
                  @foreach ($pincodes as $pincode)
                  @if ((!empty($user->pincodes) && $user->pincodes->contains($pincode->id))|| collect(old('pincode_id'))->contains($pincode->id))
                  <option value="{{ $pincode->id }}" selected=""> {{ $pincode->pincode }} </option>
                  @else
                  <option value="{{ $pincode->id }}"> {{ $pincode->pincode }} </option>
                  @endif
                  @endforeach
                  @endif
               </select>
  </div>
</div>


<div class="mb-3" id="Menu2Container">
  <label class="form-label" for="level">Provider Services<span class="text-danger">*</span></label>
  <div class="input-group input-group-merge">

  <select class="form-control show-tick" name="service_id[]" multiple>
                  <option value="" Disabled> Please Select Option </option>
                  @if ($services->count() > 0)
                  @foreach ($services as $service)
                  @if ((!empty($user->services) && $user->services->contains($service->id))|| collect(old('service_id'))->contains($service->id))
                  <option value="{{ $service->id }}" selected=""> {{ $service->name }} </option>
                  @else
                  <option value="{{ $service->id }}"> {{ $service->name }} </option>
                  @endif
                  @endforeach
                  @endif
               </select>
  </div>
</div>


<div class="mb-3">
  <label class="form-label" for="FaqQuestion">Password<span class="text-danger">*</span></label>
  <div class="input-group input-group-merge">

  <input type="password"
               name="user_pass"
               class="form-control @error('user_pass') is-invalid @enderror"
               id="user_pass"
               placeholder="Enter user_pass"
               />
  </div>
</div>

<div class="mb-3">
  <label class="form-label" for="FaqQuestion">Confirm Password<span class="text-danger">*</span></label>
  <div class="input-group input-group-merge">

  <input type="password"
               name="con_pass"
               class="form-control @error('con_pass') is-invalid @enderror"
               id="con_pass"
               placeholder="Enter con_pass"
               />
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
<a class="btn btn-dark" href="{{ route('provider.index') }}">Cancel</a>





@include('admin.common.scripts')




