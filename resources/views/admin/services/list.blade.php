@extends('admin.layout.adminMasterLayout')

@section('title', 'Service List')

@section('content')

<div class="content-wrapper">



  <div>
    <a href="{{ route('service.create') }}" class="btn btn-primary font-weight-bold mb-3">+ Add New Service</a>
  </div>

  <div class="row">
    <div class="col-lg-12 grid-margin stretch-card">
      <div class="card">
        <div class="card-body">
          <h3 class="card-title">List of Services</h3>
          <hr>

          <div class="table-responsive">
            <table class="table table-striped FAQ_LIST <?php echo count($services)?'dataTable':'';?>">
              <thead>
                <tr>
                 <th>Image</th>
                  <th>Name</th>
                  <th>Price</th>
                  <!-- <th>Description</th> -->
                 
                  <th>Created On</th>
                  <th>Action</th>
                </tr>
              </thead>

              <tbody>
                  @forelse($services as $service)

                    <tr data-index="{{ $service->id }}" >
                    <td class="py-1">
                    <img src="{{  (isset($service->img) AND Storage::disk('local')->exists($service->img)) ? config("app.url").Storage::url($service->img) : asset('adminAssets/img/default-image.png') }}" alt="img" class="w-px-100 rounded" />
                      </td>
                      <td class="py-1">
                        {{  $service->name ?? '--' }}
                      </td>
                      <!-- <td class="py-1">
                        {{  $service->name }}
                      </td> -->
                      <td class="py-1">
                        {{  $service->price }}
                      </td>



                 

                      <td class="py-1">
                                      {{ \Carbon\Carbon::parse($service->created_at)->format('d/m/Y')}}
                                  </td>
                      <td class="py-1">
                        <a href="{{ route('service.edit', $service) }}" class="btn btn-info btn-sm">
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
