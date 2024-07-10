<div class="mb-3">
  <label class="form-label" for="FaqQuestion">Category Name<span class="text-danger">*</span></label>
  <div class="input-group input-group-merge">

   <input type="text"
           name="category_name"
           class="form-control @error('category_name') is-invalid @enderror"
           id="UserName"
           placeholder="Enter Name"
           value="{{old('category_name', isset($category->category_name) ? $category->category_name:'')}}"
           required />
  </div>
</div>



<div class="mb-3">
    <div class="row">
      <div class="col-md-7">
        <label for="categoryImage" class="form-label">
           Image
        </label>
        <input type="file" name="img" accept="image/*" id="ProfileImage" onchange="showSelectedImage(this)" class="form-control @error('img') is-invalid @enderror" />
      </div>

      <div class="col-md-5">
          <img src="{{ $category->img ? $category->img : asset('adminAssets/img/default-image.png') }}" 
           id="SelectedImg"
           class="w-px-100 h-px-100 rounded-circle"
           title="category Image"
           alt="category_image">
      </div>
    </div>
  </div>




<button type="submit" class="btn btn-primary">{{isset($category) ? 'Update' : 'Create'}}</button>
<a class="btn btn-dark" href="{{ route('category.index') }}">Cancel</a>





@include('admin.common.scripts')




