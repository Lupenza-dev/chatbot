@extends('layouts.master')
@section('content')
<div class="main-content">

    <div class="page-content">
        <div class="container-fluid">

            <!-- start page title -->
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                        <h4 class="mb-sm-0">Responses</h4>

                        <div class="page-title-right">
                            <ol class="breadcrumb m-0">
                                <li class="breadcrumb-item"><a href="javascript: void(0);">List</a></li>
                                <li class="breadcrumb-item active">Responses</li>
                            </ol>
                        </div>

                    </div>
                </div>
            </div>
            <!-- end page title -->

            <div class="row">
                <div class="col-xl-6">
                    <div class="card">
                        {{-- <div class="card-header">
                            <h4 class="card-title mb-0">Input Example</h4>
                        </div> --}}
                        <!-- end card header -->
                        <div class="card-body">
                            <form id="registration_form">
                                <input name="thread_id" value="{{ $thread->id}}" type="hidden">
                                <input type="hidden" name="response_uuid" id="response_uuid">
                            <div class="row gy-4">
                                <div class="col-xxl-12 col-md-12">
                                    <div>
                                        <label for="basiInput" class="form-label">Thread</label>
                                        <textarea class="form-control" readonly>{{ $thread->title_eng}}</textarea>
                                    </div>
                                </div>
                                <div class="col-xxl-12 col-md-12">
                                    <div>
                                        <label for="basiInput" class="form-label">Response Eng</label>
                                        <textarea name="name_eng" class="form-control" id="response_name_eng"  placeholder="Write response title in english...." required></textarea>
                                    </div>
                                </div>
                                <div class="col-xxl-12 col-md-12">
                                    <div>
                                        <label for="basiInput" class="form-label">Response Sw</label>
                                        <textarea name="name_sw" class="form-control" id="response_name_sw" placeholder="Write thread response in Swahili...." required></textarea>
                                    </div>
                                </div>
                                <div class="col-xxl-12 col-md-12">
                                    <div>
                                        <label for="basiInput" class="form-label">Order No</label>
                                        <input type="text" name="order_no" class="form-control" id="response_order_no" required> 
                                    </div>
                                </div>
                                <!--end col-->
                                <div class="col-xxl-12 col-md-12" id="alert">

                                </div>
                                <div class="col-xxl-12 col-md-12 text-center">
                                    <a href="{{ route('threads.index')}}">
                                    <button class="btn btn-outline-dark">Cancel</button>
                                    </a>
                                    <button type="submit" class="btn btn-primary" id="reg_btn"> <span class="bx bx-save"></span>  Submit</button>
                                    <button style="display: none" type="submit" class="btn btn-success" id="update_btn"> <span class="bx bx-refresh"></span>  Update</button>
                                </div>
                              
                            </div>
                        </form>
                            <!--end row-->
                        </div>
                    </div>

                </div>
                <div class="col-xl-6">
                    <div class="card">
                        <div class="card-header" style="margin-bottom: 10px; display: flex; flex-direction:row; justify-content:center; align-items:center">
                            {{-- <div></div> --}}
                            <h4 class="card-title mb-0">Responses</h4>
                            {{-- <button class="btn btn-primary btn-sm"> <span class="bx bx-plus-circle"></span> Add</button> --}}
                            {{-- <button class="btn btn-light" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">Toggle Right offcanvas</button> --}}

                        </div><!-- end card header -->

                        <div class="card-body">
                            {{-- <p class="text-muted mb-4">Use <code>table-card</code> class to show card-based table within a &lt;tbody&gt;.</p> --}}
                            <div class="table-responsive table-card">
                                <table class="table align-middle table-nowrap mb-0" style="border-collapse: separate !important; border-spacing: 0 !important;">
                                    <thead class="table-light">
                                        <tr>
                                            <th scope="col"></th>
                                            <th scope="col">Order</th>
                                            <th scope="col" width="50%">Name</th>
                                            <th>Created At</th>
                                            <th scope="col">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($responses as $response)
                                        <tr style="margin-top: 20px; margin-bottom: 20px">
                                            <td><span class="bx bx-link-alt"></span></td>
                                            <td>{{ $response->order_no }}</td>
                                            <td>{{ $response->name_eng }}</td>
                                            <td>{{ $response->created_at}}</td>
                                            <td>
                                                <button type="button" class="btn btn-outline-success btn-sm btn-icon response-edit"
                                                 data-uuid="{{ $response->uuid}}"
                                                 data-name_eng="{{ $response->name_eng}}"
                                                 data-name_sw="{{ $response->name_sw}}"
                                                 data-order_no="{{ $response->order_no}}"
                                                 >
                                                    <i class=" ri-edit-2-line"></i></button>
                                                <button type="button" id="{{ $response->uuid }}" onclick="deleteResponse(id)" class="btn btn-outline-danger btn-sm btn-icon"><i class=" ri-delete-bin-5-line"></i></button>

                                            </td>
                                        </tr> 
                                        @endforeach
                                       
                                    </tbody>
                                </table>
                            </div>
                        </div><!-- end card-body -->
                    </div><!-- end card -->
                </div><!-- end col -->
            </div><!-- end row -->
        </div>
        <!-- container-fluid -->
    </div>
    <!-- End Page-content -->

 
</div>


{{-- offcanva --}}
{{-- <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
    <div class="offcanvas-header">
        <h5 id="offcanvasRightLabel">Register response</h5>
        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body">
        ...
    </div>
</div> --}}
    
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
      url:"{{ route('responses.store')}}",
      data : new FormData(this),
      contentType: false,
      cache: false,
      processData : false,
      success:function(response){
        console.log(response);
        $('#alert').html('<div class="alert alert-success">'+response.message+'</div>');
        setTimeout(function(){
         location.reload();
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
<script>
    $('.response-edit').on('click',function(){
        $('#reg_btn').hide();
        $('#update_btn').show();
        var uuid =$(this).data('uuid');
        var name_eng =$(this).data('name_eng');
        var name_sw =$(this).data('name_sw');
        var order_no =$(this).data('order_no');

        $('#response_uuid').val(uuid);
        $('#response_name_eng').val(name_eng);
        $('#response_name_sw').val(name_sw);
        $('#response_order_no').val(order_no);
    })
</script>
<script>
    $('#update_btn').on('click', function(e) {
      e.preventDefault();
  
      // Create a new FormData object
      var formData = new FormData($('#registration_form')[0]);
  
      $.ajaxSetup({
        headers: {
          'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
      });
  
      $.ajax({
        type: 'POST',
        url: "{{ route('update.responses') }}",
        data: formData,
        contentType: false,
        cache: false,
        processData: false,
        success: function(response) {
          console.log(response);
          $('#alert').html('<div class="alert alert-success">' + response.message + '</div>');
          setTimeout(function() {
             location.reload();
          }, 500);
        },
        error: function(response) {
          console.log(response.responseText);
          if (jQuery.type(response.responseJSON.errors) == "object") {
            $('#alert').html('');
            $.each(response.responseJSON.errors, function(key, value) {
              $('#alert').append('<div class="alert alert-danger">' + value + '</div>');
            });
          } else {
            $('#alert').html('<div class="alert alert-danger">' + response.responseJSON.errors + '</div>');
          }
        },
        beforeSend: function() {
          $('#update_btn').html('<i class="fa fa-spinner fa-pulse fa-spin"></i> updating .........');
          $('#update_btn').attr('disabled', true);
        },
        complete: function() {
          $('#update_btn').html('<i class="bx bx-refresh"></i> Update');
          $('#update_btn').attr('disabled', false);
        }
      });
    });
  </script>

<script>
     function deleteResponse(id){
      var csrf_tokken =$('meta[name="csrf-token"]').attr('content');
      swal({
      title: "Delete  Response",
      text: "Are you sure you want to Delete this Response?",
      type: "warning",
      showCancelButton: true,
      confirmButtonColor: "#0D6855",
      confirmButtonText: "Yes, Delete",
      closeOnConfirmation: false
    },
    function(){
      $.ajax({
            url: "{{ route('delete.response')}}", 
            method: "POST",
            data: {uuid:id,'_token':csrf_tokken,action:'activate'},
            success: function(response)
           { 
           // console.log(response); 
            $.notify(response.message, "success");
            setTimeout(function(){
                location.reload();
            },500);
            },
            error: function(response){
               console.log(response.responseText);
                $.notify(response.responseJson.errors,'error');  
            }
        });
    }
    );
  }
    
</script>    
@endpush

