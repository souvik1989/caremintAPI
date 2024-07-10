<div class="mb-3">
  <label class="form-label" for="FaqQuestion">Service Name<span class="text-danger">*</span></label>
  <div class="input-group input-group-merge">

   <input type="text"
           name="name"
           class="form-control @error('name') is-invalid @enderror"
           id="UserName"
           placeholder="Enter Name"
           value="{{old('name', isset($service->name) ? $service->name:'')}}"
           required />
  </div>
</div>

<div class="mb-3">
  <label class="form-label" for="FaqQuestion">Service Price<span class="text-danger">*</span></label>
  <div class="input-group input-group-merge">

   <input type="text"
           name="price"
           class="form-control @error('price') is-invalid @enderror"
           id="UserEmail"
           placeholder="Enter Price"
           value="{{old('price', isset($service->price) ? $service->price:'')}}"
           required />
  </div>
</div>





<div class="mb-3">
  <label class="form-label" for="FaqQuestion">Description<span class="text-danger">*</span></label>
  <div class="input-group input-group-merge">

  <textarea rows="4" name="description" class="form-control no-resize Editor" placeholder="Description">{{old('description') ?? ($service->description ?? '') }}</textarea>
  </div>
</div>






<div class="mb-3">
    <div class="row">
      <div class="col-md-7">
        <label for="ServiceImage" class="form-label">
           Image
        </label>
        <input type="file" name="img" accept="image/*" id="ProfileImage" onchange="showSelectedImage(this)" class="form-control @error('img') is-invalid @enderror" />
      </div>

      <div class="col-md-5">
          <img src="{{ isset($service->img) ? config("app.url").Storage::url($service->img) : asset('adminAssets/img/default-image.png') }}"
           id="SelectedImg"
           class="w-px-100 h-px-100 rounded-circle"
           title="Service Image"
           alt="Service_image">
      </div>
    </div>
  </div>




<button type="submit" class="btn btn-primary">{{isset($service) ? 'Update' : 'Create'}}</button>
<a class="btn btn-dark" href="{{ route('service.index') }}">Cancel</a>





@include('admin.common.scripts')




