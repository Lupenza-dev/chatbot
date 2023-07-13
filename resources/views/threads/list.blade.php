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
                            <h4 class="card-title mb-0">Threads</h4>
                            <a href="{{ route('threads.create')}}">
                            <button class="btn btn-primary btn-sm"> <span class="bx bx-plus-circle"></span> Add</button>
                            </a>
                        </div><!-- end card header -->

                        <div class="card-body">
                            {{-- <p class="text-muted mb-4">Use <code>table-card</code> class to show card-based table within a &lt;tbody&gt;.</p> --}}
                            <div class="table-responsive table-card">
                                <table class="table align-middle table-nowrap mb-0">
                                    <thead class="table-light">
                                        <tr>
                                            <th scope="col"></th>
                                            <th scope="col">Step</th>
                                            <th scope="col" width="60%">Name</th>
                                            <th>Created At</th>
                                            <th scope="col">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($messages as $message)
                                        <tr style="margin-top: 20px; margin-bottom: 20px">
                                            <td><span class="bx bx-chat"></span></td>
                                            <td>{{ $message->step }}</td>
                                            <td>{{ $message->title_eng }}</td>
                                            <td>{{ $message->created_at}}</td>
                                            <td>
                                                <a href="{{ route('responses.index',['uuid' =>$message->uuid]) }}">
                                                 <button type="button" class="btn btn-outline-primary btn-sm btn-icon"><i class="ri-mail-send-line"></i></button>
                                                </a>
                                                <a href="{{ route('threads.edit',$message->uuid )}}">
                                                <button type="button" class="btn btn-outline-success btn-sm btn-icon"><i class=" ri-edit-2-line"></i></button>
                                                </a>
                                                <button type="button" id="{{ $message->uuid}}" onclick="deleteThread(id)" class="btn btn-outline-danger btn-sm btn-icon"><i class=" ri-delete-bin-5-line"></i></button>

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
            url: "{{ route('delete.thread')}}", 
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
