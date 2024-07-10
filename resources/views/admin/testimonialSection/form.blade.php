
<div class="mb-3">
  <label class="form-label" for="Name">Name <span class="text-danger">*</span></label>
  <div class="input-group input-group-merge">

    <input type="text" 
           name="name" 
           class="form-control @error('name') is-invalid @enderror"
           id="Name" 
           placeholder="Enter Name" 
           value="{{old('name', isset($testimonial->name) ? $testimonial->name:'')}}" 
           required />
  </div>
</div>




<div class="mb-3">
  <div class="row">
    <div class="col-md-7">
      <label for="ProfileImage" class="form-label">
        Image
      </label>
      <input type="file" name="img" accept="image/*" id="ProfileImage" onchange="showSelectedImage(this)" class="form-control @error('img') is-invalid @enderror" />
    </div>

    <div class="col-md-5">
        <img src="{{ isset($testimonial->img) ? $testimonial->img : asset('adminAssets/img/default-image.png') }}"
         id="SelectedImge"
         class="w-px-100 h-px-100 rounded-circle"
         title="Testimonial Image"
         alt="testimonial_image" data-src="{{ isset($testimonial->img) ? $testimonial->img : asset('adminAssets/img/default-image.png') }}">
    </div>
  </div>
</div>


<div class="mb-3">
  <div class="row">
    <div class="col-md-7">
      <label for="Video">
        Video <span class="text-danger">(Max Video Size: <b>5MB</b>)</span>
      </label>
      <input type="file"
             name="video"
             accept="video/mp4"
             id="video"
             onchange="showSelectedVideo(this)"
             class="form-control mb-4 @error('video') is-invalid @enderror" />
    </div>

    <div class="col-md-5">
      <video id="SelectedVideo" width="200" height="200" controls>
        <source src="{{ isset($testimonial->video) ? $testimonial->video : '' }}" type="video/mp4">
        Your browser does not support the video tag.
      </video>
    </div>
  </div>
</div>

<div class="mb-3">
  <label class="form-label" for="TestimonialContent">Testimonial <span class="text-danger">*</span></label>
  <div class="input-group input-group-merge">
    
    <textarea class="nicEdit form-control @error('des') is-invalid @enderror" name="des" id="TestimonialContent" rows="8">{{old('des', isset($testimonial->des) ? $testimonial->des:'')}}</textarea>
  </div>
</div>





<button type="submit" class="btn btn-primary">{{isset($testimonial) ? 'Update' : 'Create'}}</button>
<a class="btn btn-dark" href="{{ route('testimonial.index') }}">Cancel</a>






@include('admin.common.scripts')




