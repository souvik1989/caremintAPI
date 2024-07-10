@extends('admin.layout.adminMasterLayout')

@section('title', 'Order List')

@section('content')

<div class="content-wrapper">



  <!-- <div>
    <a href="{{ route('pincode.create') }}" class="btn btn-primary font-weight-bold mb-3">+ Add New Pincode</a>
  </div> -->

  <div class="row">
    <div class="col-lg-12 grid-margin stretch-card">
      <div class="card">
        <div class="card-body">
          <h3 class="card-title">List of Orders</h3>
          <hr>

          <div class="table-responsive">
            <table class="table table-striped FAQ_LIST <?php echo count($orders)?'dataTable':'';?>">
              <thead>
                <tr>
                 <th>Serial No.</th>
                  <th>Service Name</th>
                  <th>Franchise Name</th>
                  <th>Business User Name</th>
                  <th>Order Name</th>
                  <th>Order Price</th>
                  <th>Order Status</th>
                  <th>Order Date</th>
                  <th>Order Time</th>
                  <th>Action</th>
                </tr>
              </thead>

              <tbody>
                @php
                $i=0;
                @endphp
                  @forelse($orders as $order)

                    <tr data-index="{{ $order->id }}" >
                    <td class="py-1">
                        {{  ++$i }}
                      </td>
                      <td class="py-1">
                        {{  $order->service->name ?? '--' }}
                      </td>
                      <td class="py-1">
                        {{  $order->provider->user_login ?? '--' }}
                      </td>
                      <td class="py-1">
                        {{  ucfirst($order->user->user_firstname) ?? '--' }}
                      </td>
                       <td class="py-1">
                        {{  ucfirst($order->name) ?? '--' }}
                      </td>
                      <td class="py-1">
                        {{  $order->order_price ?? '--' }}
                      </td>
                      <td class="py-1">
                       
                        @if($order->order_status == null)
                        {{'Yet to accept Order'}}
                        @else
                        {{ucfirst($order->order_status)}}
                        @endif
                      </td>
                      <td class="py-1">
                      {{ \Carbon\Carbon::parse($order->order_date)->format('d/m/Y')}} 
                      </td>
                      <td class="py-1">
                        {{  $order->order_time ?? '--' }}
                      </td>
                      <td class="py-1">
                        <a href="{{ route('order.edit', $order) }}" class="btn btn-info btn-sm">
                          <i class='bx bx-edit-alt' ></i> Edit Order Status
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
<script>
   $(document).ready(function () {
            $('.status__ids').on('change', function () {
                var status = $(this).val();
                //alert("status")
                var id = $(this).data('id');
                var url='{{route('order.status')}}';
                //$("#state-dd").html('');
                console.log(status)
                console.log(id)
                $.ajax({
                    headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                    url: url,

                    type: "POST",
                    data: {
                        status: status,
                        id:id
                    },

                    success: function (data) {
                        console.log(data)
                        if (data.status == 200) {

                        iziToast.success({
                            title: 'Success',
                            message: data.message,
                            position:'topCenter'
                        })
                    }else{
                        iziToast.error({
                            title: 'Error',
                            message: data.message,
                            position:'topCenter'
                        });
                    }
                    }
               });
            });
</script>


@include('admin.common.deleteConfirm')


@endsection
