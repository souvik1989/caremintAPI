@extends('admin.layout.adminMasterLayout')

@section('title', 'Franchise Category List')

@section('content')

<div class="content-wrapper">

  {{-- @include('admin.homepageManager.faq.text.edit') --}}

  <div>
    <a href="{{ route('provider.create') }}" class="btn btn-primary font-weight-bold mb-3">+ Add New Franchise/Provider</a>
  </div>

  <div class="row">
    <div class="col-lg-12 grid-margin stretch-card">
      <div class="card">
        <div class="card-body">
          <h3 class="card-title">Provider/Franchise</h3>
          <hr>

          <div class="table-responsive">
            <table class="table table-striped FAQ_LIST <?php echo count($users)?'dataTable':'';?>">
              <thead>
                <tr>
                <!-- <th>Image</th> -->
                  <th>Name</th>
                  <th>Email</th>
                  <th>Role</th>
                  <th>Status</th>
                  <th>Created On</th>
                  <th>Action</th>
                </tr>
              </thead>

              <tbody>
                  @forelse($users as $user)

                    <tr data-index="{{ $user->id }}" >
                       

                      <td>
                        {{  $user->user_login }}
                      </td>

                      <td>
                                  
                      {{  $user->user_email }}
                                </td>
                                <td>
                                  
                                  {{  $user->role->name }}
                                            </td>

                                            <td>
                         <div class="dropdown action-label">
                          <a class="btn @if(isset($user->user_status) && ($user->user_status==1)) btn-primary @else btn-danger @endif  dropdown-toggle btn-sm text-white" data-bs-toggle="dropdown" aria-expanded="false">

                            <?=(isset($user->user_status) && $user->user_status==1)?'<i class="fa fa-dot-circle-o text-success"></i> Active':'<i class="fa fa-dot-circle-o text-danger"></i> Inactive';?>

                            <span class="caret"></span>
                            </a>
                            <div class="dropdown-menu">
                              <form action="{{route('user.status', $user->id)}}"
                                  method="POST"
                                  >
                                  @csrf
                                  @method('PUT')
                                   <button type="submit"
                                        class="dropdown-item status-btn btn-sm"
                                        style="cursor: pointer;">

                                    {!! ($user->user_status==1)? "<i class='fa fa-dot-circle-o text-danger'></i> Inactive":"<i class='fa fa-dot-circle-o text-success'></i> Active" !!}
                                  </button>
                              </form>
                            </div>
                        </div>
                      </td>

                                <td>
                                      {{ \Carbon\Carbon::parse($user->created_at)->format('d/m/Y')}}
                                  </td>


                      <td>
                        <a href="{{ route('provider.edit', $user) }}" class="btn btn-info btn-sm">
                          <i class='bx bx-edit-alt' ></i> Edit
                        </a>

                        <!-- <div class="d-inline-block">
                           <form action="{{route('provider.destroy', $user->id)}}"
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
                          </div> -->
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
