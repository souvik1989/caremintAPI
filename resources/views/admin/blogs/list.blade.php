@extends('admin.layout.adminMasterLayout')

@section('title', 'Blog List')

@section('content')

<div class="content-wrapper">

  {{-- @include('admin.homepageManager.faq.text.edit') --}}

  <div>
    <a href="{{ route('blog.create') }}" class="btn btn-primary font-weight-bold mb-3">+ Add New Blog</a>
  </div>

  <div class="row">
    <div class="col-lg-12 grid-margin stretch-card">
      <div class="card">
        <div class="card-body">
          <h3 class="card-title"> 
            
          </h3>
          <hr>

          <div class="table-responsive">
            <table class="table table-striped FAQ_LIST <?php echo count($blogs)?'dataTable':'';?>">
              <thead>
                <tr>
                <th>Image</th>
                  <th>Name</th>
                  <th>Author</th>
                  <th>Read Title</th>
                  <th>Blog Date</th>
                  <th>Action</th>
                </tr>
              </thead>

              <tbody>
                  @forelse($blogs as $blog)

                    <tr data-index="{{ $blog->id }}" >
                    <td class="py-1">
                        <img src="{{  isset($blog->img) ? config("app.url").Storage::url($blog->img) : asset('adminAssets/img/default-image.png') }}" alt="blog_image" class="w-px-50 h-px-50 rounded-circle"/>
                      </td>
                      

                      <td>
                        {{  $blog->title }}
                      </td>

                      <td>
                                  
                      {{  $blog->author }}
                                </td>
                                <td>
                                  
                                  {{  $blog->read_title }}
                                            </td>

                                   

                                <td>
                                      {{ \Carbon\Carbon::parse($blog->created_at)->format('d/m/Y')}}
                                  </td>


                      <td>
                        <a href="{{ route('blog.edit', $blog) }}" class="btn btn-info btn-sm">
                          <i class='bx bx-edit-alt' ></i> Edit
                        </a>

                        <div class="d-inline-block">
                           <form action="{{route('blog.destroy', $blog->id)}}"
                              method="POST"
                              >
                              @csrf
                              @method('DELETE')
                               <button type="submit"
                                    class="btn btn-danger btn-sm Delete"
                                    style="cursor: pointer;">

                                <i class='bx bxs-trash'></i> Delete
                              </button>
                          </form>
                          </div>
                      </td>
                    </tr>
                 @empty
                  <td colspan="6" class="text-center">Nothing is Listed Yet</td>
                @endforelse

              </tbody>
            </table>

         
          </div>
        </div>
      </div>
    </div>
  </div>


</div>



@include('admin.common.deleteConfirm')


@endsection
