<div class="mb-3">
  <label class="form-label" for="FaqQuestion">Pincode<span class="text-danger">*</span></label>
  <div class="input-group input-group-merge">

   <input type="text"
           name="pincode"
           class="form-control @error('pincode') is-invalid @enderror"
           id="UserName"
           placeholder="Enter Pincode"
           value="{{old('pincode', isset($pincode->pincode) ? $pincode->pincode:'')}}"
           required />
  </div>
</div>





<button type="submit" class="btn btn-primary">{{isset($pincode) ? 'Update' : 'Create'}}</button>
<a class="btn btn-dark" href="{{ route('pincode.index') }}">Cancel</a>





@include('admin.common.scripts')




