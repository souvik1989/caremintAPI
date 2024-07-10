<div class="mb-3">
  <label class="form-label" for="FaqQuestion">Category Name<span class="text-danger">*</span></label>
  <div class="input-group input-group-merge">

 

                                                <select class="form-control status__ids" name="order_status" id="status"
                                                    data-id="{{ $order->id }}">
                                                    <option value="" {{isset($order->order_status) &&
                                                        $order->order_status == "" ? 'selected' : '' }} >
                                                        Yet to accept</option>
                                                    <option value="accepted" {{isset($order->order_status) &&
                                                        $order->order_status == 'accepted' ? 'selected' : '' }} >
                                                        Accepted</option>
                                                    <option value="completed" {{isset($order->order_status) &&
                                                        $order->order_status == 'completed' ? 'selected' : '' }} >
                                                        Completed</option>
                                                    <option value="cancelled" {{isset($order->order_status) &&
                                                        $order->order_status == 'cancelled' ? 'selected' : '' }}>
                                                        Cancelled</option>

                                                </select>
                                               
  </div>
</div>
<div class="hidden_div" id="hidden"  >
<div class="mb-3">
  <label class="form-label" for="FaqQuestion">Description<span class="text-danger">*</span></label>
  <div class="input-group input-group-merge">

  <textarea rows="4" name="description" class="form-control no-resize Editor" placeholder="Order Description">{{old('description') ?? ($order->description ?? '') }}</textarea>
  </div>
</div>


<div class="mb-3">
    <div class="row">
      <div class="col-md-7">
        <label for="categoryImage" class="form-label">
           Image
        </label>
        <input type="file" name="image" accept="image/*" id="ProfileImage" onchange="showSelectedImage(this)" class="form-control @error('image') is-invalid @enderror" />
      </div>

      <div class="col-md-5">
          <img src="{{ isset($order->image) ? config("app.url").Storage::url($order->image) : asset('adminAssets/img/default-image.png') }}"
           id="SelectedImg"
           class="w-px-100 h-px-100 rounded-circle"
           title="order Image"
           alt="order_image">
      </div>
    </div>
  </div>

                                                    </div>


<button type="submit" class="btn btn-primary">{{isset($order) ? 'Update' : 'Create'}}</button>
<a class="btn btn-dark" href="{{ route('order.index') }}">Cancel</a>


<script>
    
$(document).ready(function () {
  //$('.hidden_div').hide();
            $('.status__ids').on('change', function () {
                var status = $(this).val();
                //alert(status)
                if(status !=='completed'){
                  $('.hidden_div').slideUp();
                }else{
                  $('.hidden_div').slideDown();
                }
                
            });
            });
</script>


@include('admin.common.scripts')




