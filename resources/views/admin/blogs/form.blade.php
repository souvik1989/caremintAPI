<div class="mb-3">
  <label class="form-label" for="FaqQuestion">Blog Name<span class="text-danger">*</span></label>
  <div class="input-group input-group-merge">

   <input type="text"
           name="title"
           class="form-control @error('title') is-invalid @enderror"
           id="ProviderName"
           placeholder="Enter Name"
           value="{{old('title', isset($blog->title) ? $blog->title:'')}}"
           required />
  </div>
</div>

<div class="mb-3">
  <label class="form-label" for="FaqQuestion">Blog Author<span class="text-danger">*</span></label>
  <div class="input-group input-group-merge">

   <input type="author"
           name="author"
           class="form-control @error('author') is-invalid @enderror"
           id="ProviderEmail"
           placeholder="Enter Author Name"
           value="{{old('author', isset($user->author) ? $user->author:'')}}"
           required />
  </div>
</div>


<div class="mb-3">
  <label class="form-label" for="FaqQuestion">Read Title<span class="text-danger">*</span></label>
  <div class="input-group input-group-merge">

   <input type="text"
           name="read_title"
           class="form-control @error('read_title') is-invalid @enderror"
           id="ProviderPhone"
           placeholder="Enter Read Title"
           value="{{old('read_title', isset($blog->read_title) ? $blog->read_title:'')}}"
           required />
  </div>
</div>


<div class="mb-3">
  <label class="form-label" for="FaqQuestion">Blog Description<span class="text-danger">*</span></label>
  <div class="input-group input-group-merge">

  <textarea rows="4" name="description" class="form-control no-resize Editor" placeholder="Blog Description">{{old('description') ?? ($blog->description ?? '') }}</textarea>
  </div>
</div>













<div class="mb-3">
    <div class="row">
      <div class="col-md-7">
        <label for="ProfileImage" class="form-label">
          Blog Image
        </label>
        <input type="file" name="img" accept="image/*" id="ProfileImage" onchange="showSelectedImage(this)" class="form-control @error('img') is-invalid @enderror" />
      </div>

      <div class="col-md-5">
          <img src="{{ isset($blog->img) ? config("app.url").Storage::url($blog->img) : asset('adminAssets/img/default-image.png') }}"
           id="SelectedImg"
           class="w-px-100 h-px-100 rounded-circle"
           title="Blog Image"
           alt="Blog Image">
      </div>
    </div>
  </div> 




<button type="submit" class="btn btn-primary">{{isset($blog) ? 'Update' : 'Create'}}</button>
<a class="btn btn-dark" href="{{ route('blog.index') }}">Cancel</a>





@include('admin.common.scripts')




