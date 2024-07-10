<div class="mb-3">
  <label class="form-label" for="FaqQuestion">Slot<span class="text-danger">*</span></label>
  <div class="input-group input-group-merge">

   <input type="text"
           name="slot"
           class="form-control @error('slot') is-invalid @enderror"
           id="UserName"
           placeholder="Enter Slot"
           value="{{old('slot', isset($slot->slots) ? $slot->slots:'')}}"
           required />
  </div>
</div>








<button type="submit" class="btn btn-primary">{{isset($slot) ? 'Update' : 'Create'}}</button>
<a class="btn btn-dark" href="{{ route('timeslot.index') }}">Cancel</a>





@include('admin.common.scripts')




