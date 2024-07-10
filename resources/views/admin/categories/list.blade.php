@extends('admin.layout.adminMasterLayout')

@section('title', 'Categories List')

@section('content')

<div class="content-wrapper">



  <div>
    <a href="{{ route('category.create') }}" class="btn btn-primary font-weight-bold mb-3">+ Add New Category</a>
  </div>

  <div class="row">
    <div class="col-lg-12 grid-margin stretch-card">
      <div class="card">
        <div class="card-body">
          <h3 class="card-title">List of Categories</h3>
          <hr>

          <div class="table-responsive">
            <table class="table table-striped FAQ_LIST <?php echo count($categories)?'dataTable':'';?>">
              <thead>
                <tr>
                 <th>Image</th>
                  <th>Name</th>
                  <th>Created On</th>
                  <th>Action</th>
                </tr>
              </thead>

              <tbody>
                  @forelse($categories as $category)

                    <tr data-index="{{ $category->id }}" >
                    <td class="py-1">
                    <!--<img src="{{  (isset($category->img) AND Storage::disk('local')->exists($category->img)) ? config("app.url").Storage::url($category->img) : asset('adminAssets/img/default-image.png') }}" alt="img" class="w-px-100 rounded" />-->
                    <img src="{{ $category->img ? $category->img : asset('adminAssets/img/default-image.png') }}" alt="img" class="w-px-100 rounded" />

                      </td>
                      <td class="py-1">
                        {{  $category->category_name ?? '--' }}
                      </td>
                     
                      



                 

                      <td class="py-1">
                                      {{ \Carbon\Carbon::parse($category->created_at)->format('d/m/Y')}}
                                  </td>
                      <td class="py-1">
                        <a href="{{ route('category.edit', $category) }}" class="btn btn-info btn-sm">
                          <i class='bx bx-edit-alt' ></i> Edit
                        </a>

                        
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
