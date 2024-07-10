@extends('admin.layout.adminMasterLayout')

@section('title', 'Timeslot List')

@section('content')

<div class="content-wrapper">



  <div>
    <a href="{{ route('timeslot.create') }}" class="btn btn-primary font-weight-bold mb-3">+ Add New Timeslot</a>
  </div>

  <div class="row">
    <div class="col-lg-12 grid-margin stretch-card">
      <div class="card">
        <div class="card-body">
          <h3 class="card-title">List of Timeslots</h3>
          <hr>

          <div class="table-responsive">
            <table class="table table-striped FAQ_LIST <?php echo count($timeslots)?'dataTable':'';?>">
              <thead>
                <tr>
                 <th>Serial No.</th>
                  <th>Slot</th>
                  <th>Created On</th>
                  <th>Action</th>
                </tr>
              </thead>

              <tbody>
                @php
                $i=0;
                @endphp
                  @forelse($timeslots as $pincode)

                    <tr data-index="{{ $pincode->id }}" >
                    <td class="py-1">
                        {{  ++$i }}
                      </td>
                      <td class="py-1">
                        {{  $pincode->slots ?? '--' }}
                      </td>
                     
                      



                 

                      <td class="py-1">
                                      {{ \Carbon\Carbon::parse($pincode->created_at)->format('d/m/Y')}}
                                  </td>
                      <td class="py-1">
                        <a href="{{ route('timeslot.edit', $pincode) }}" class="btn btn-info btn-sm">
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
