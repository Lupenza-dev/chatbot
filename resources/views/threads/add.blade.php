@extends('layouts.master')
@section('content')
<div class="main-content">

    <div class="page-content">
        <div class="container-fluid">

            <!-- start page title -->
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                        <h4 class="mb-sm-0">Register Thread</h4>

                        <div class="page-title-right">
                            <ol class="breadcrumb m-0">
                                <li class="breadcrumb-item"><a href="javascript: void(0);">Details</a></li>
                                <li class="breadcrumb-item active">Add</li>
                            </ol>
                        </div>

                    </div>
                </div>
            </div>
            <!-- end page title -->

            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        {{-- <div class="card-header">
                            <h4 class="card-title mb-0">Input Example</h4>
                        </div> --}}
                        <!-- end card header -->
                        <div class="card-body">
                            <form id="registration_form">
                            <div class="row gy-4">
                                <div class="col-xxl-12 col-md-12">
                                    <div>
                                        <label for="basiInput" class="form-label">Title Eng</label>
                                        <textarea name="title_eng" class="form-control" placeholder="Write thread title in english...." required></textarea>
                                    </div>
                                </div>
                                <div class="col-xxl-12 col-md-12">
                                    <div>
                                        <label for="basiInput" class="form-label">Title Sw</label>
                                        <textarea name="title_sw" class="form-control" placeholder="Write thread title in Swahili...." required></textarea>
                                    </div>
                                </div>
                                <div class="col-xxl-12 col-md-12">
                                    <div>
                                        <label for="valueInput" class="form-label">Label</label>
                                        <textarea name="label" class="form-control" required placeholder="Write label.."></textarea>
                                    </div>
                                </div>
                                <!--end col-->
                                <div class="col-xxl-4 col-md-6">
                                    <div>
                                        <label for="labelInput" class="form-label">Step</label>
                                        <input type="text" name="step" class="form-control" id="labelInput" required>
                                    </div>
                                </div>
                                <!--end col-->
                                <div class="col-xxl-4 col-md-6">
                                    <div>
                                        <label for="placeholderInput" class="form-label">Flag</label>
                                        <input type="text" name="flag" class="form-control" id="placeholderInput" placeholder="Write flag" required>
                                    </div>
                                </div>
                                <!--end col-->
                                
                                <!--end col-->
                                <div class="col-xxl-4 col-md-6">
                                    <div>
                                        <label for="readonlyPlaintext" class="form-label">Message Type</label>
                                       <select name="message_type" class="form-control" required>
                                        <option value="" selected>Please choose message type</option>
                                        @foreach ($message_types as $message)
                                        <option value="{{ $message->name}}">{{ $message->name }}</option>
                                            
                                        @endforeach
                                       </select>
                                    </div>
                                </div>

                                <div class="col-xxl-3 col-md-6">
                                    <div>
                                       
                                        <input type="checkbox" name="back_status" value="Yes" >
                                        <label for="">Back To Main Menu</label>
                                    </div>
                                </div>
                                <div class="col-xxl-12 col-md-12" id="alert">

                                </div>
                                <div class="col-xxl-12 col-md-12 text-center">
                                    <button class="btn btn-primary">Cancel</button>
                                    <button type="submit" class="btn btn-primary" id="reg_btn">  Submit</button>
                                </div>
                              
                            </div>
                        </form>
                            <!--end row-->
                        </div>
                    </div>
                </div>
                <!--end col-->
            </div>
            <!--end row-->


        </div> <!-- container-fluid -->
    </div><!-- End Page-content -->

</div>
    
@endsection

@push('scripts')
<script>
    $(document).ready(function(){
      $('#registration_form').on('submit',function(e){ 
          e.preventDefault();

      $.ajaxSetup({
      headers: {
      'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
           }
          });
      $.ajax({
      type:'POST',
      url:"{{ route('threads.store')}}",
      data : new FormData(this),
      contentType: false,
      cache: false,
      processData : false,
      success:function(response){
        console.log(response);
        $('#alert').html('<div class="alert alert-success">'+response.message+'</div>');
        setTimeout(function(){
         window.location.href="{{ route('threads.index')}}";
      },500);
      },
      error:function(response){
          console.log(response.responseText);
          if (jQuery.type(response.responseJSON.errors) == "object") {
            $('#alert').html('');
          $.each(response.responseJSON.errors,function(key,value){
              $('#alert').append('<div class="alert alert-danger">'+value+'</div>');
          });
          } else {
             $('#alert').html('<div class="alert alert-danger">'+response.responseJSON.errors+'</div>');
          }
      },
      beforeSend : function(){
                   $('#reg_btn').html('<i class="fa fa-spinner fa-pulse fa-spin"></i> Register .........');
                   $('#reg_btn').attr('disabled', true);
              },
              complete : function(){
                $('#reg_btn').html('<i class="bx bx-save"></i> Register');
                $('#reg_btn').attr('disabled', false);
              }
      });
  });
  });
</script>
    
@endpush