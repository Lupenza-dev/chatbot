@extends('layouts.master')
@section('content')
<div class="main-content">

    <div class="page-content">
        <div class="container-fluid">

            <!-- start page title -->
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                        <h4 class="mb-sm-0">Threads</h4>

                        <div class="page-title-right">
                            <ol class="breadcrumb m-0">
                                <li class="breadcrumb-item"><a href="javascript: void(0);">List</a></li>
                                <li class="breadcrumb-item active">Threads</li>
                            </ol>
                        </div>

                    </div>
                </div>
            </div>
            <!-- end page title -->

            <div class="row">
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-header" style="margin-bottom: 10px; display: flex; flex-direction:row; justify-content:space-between; align-items:center">
                            <div></div>
                            <h4 class="card-title mb-0">Response To Thread Link</h4>
                            <button class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#myModal"> <span class="bx bx-plus-circle"></span> Add Link</button>
                        </div><!-- end card header -->

                        <div class="card-body">
                            {{-- <p class="text-muted mb-4">Use <code>table-card</code> class to show card-based table within a &lt;tbody&gt;.</p> --}}
                            <div class="table-responsive table-card">
                                <table class="table align-middle table-nowrap mb-0">
                                    <thead class="table-light">
                                        <tr>
                                            <th scope="col">#</th>
                                            <th>Created At</th>
                                            <th scope="col">Response</th>
                                            <th scope="col">Thread Linked To</th>
                                            <th scope="col">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($links as $link)
                                        <tr style="margin-top: 20px; margin-bottom: 20px">
                                            <td>{{ $loop->iteration }}</td>
                                            <td>{{ $link->created_at}}</td>
                                            <td>{{ $link->response->name_eng }}</td>
                                            <td>{{ $link->thread->title_eng }}</td>
                                            <td>
                                                <button type="button" id="{{ $link->uuid}}" onclick="deleteThread(id)" class="btn btn-outline-danger btn-sm btn-icon"><i class=" ri-delete-bin-5-line"></i></button>
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

<div id="myModal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="myModalLabel">Add Link</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"> </button>
            </div>
            <div class="modal-body">
                <form id="registration_form">
                    <div class="form-group row">
                        <div class="col-md-12">
                            <label for="">Response </label>
                           <select name="thread_response_id" class="form-control">
                            <option value="" selected> Select Thread Response</option>
                            @foreach ($responses as $item)
                                <option value="{{ $item->id }}">{{ $item->name_eng }}</option>
                            @endforeach
                           </select>
                        </div>
                    </div>
                    <div class="form-group row" style="margin-top: 10px">
                        <div class="col-md-12">
                            <label for="">Thread To Link With Response</label>
                           <select name="thread_id" class="form-control">
                            <option value="" selected> Select Thread To Linked</option>
                            @foreach ($threads as $item)
                                <option value="{{ $item->id }}">{{ $item->title_eng }}</option>
                            @endforeach
                           </select>
                        </div>
                    </div>
                   
                    <div class="form-group row" style="margin-top: 10px;">
                        <div class="col-md-12" id="alert">
                        </div>
                    </div>
                    <div class="form-group row text-center" style="margin-top: 10px;">
                        <div class="col-md-12">
                         <button style="margin-right: 10px" type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
                        <button type="submit" id="reg_btn" class="btn btn-primary "><span class="bx bx-save"></span> Register</button>
                        </div>
                        
                    </div>
                </form>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
    
@endsection
@push('scripts')
<script>
     function deleteThread(id){
      var csrf_tokken =$('meta[name="csrf-token"]').attr('content');
      swal({
      title: "Delete  Thread",
      text: "Are you sure you want to Delete this Thread?",
      type: "warning",
      showCancelButton: true,
      confirmButtonColor: "#0D6855",
      confirmButtonText: "Yes, Delete",
      closeOnConfirmation: false
    },
    function(){
      $.ajax({
            url: "{{ route('delete.response.link')}}", 
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
      url:"{{ route('response.links.store')}}",
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
@endpush
