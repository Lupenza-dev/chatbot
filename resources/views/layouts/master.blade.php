<!doctype html>
<html lang="en" data-layout="vertical" data-sidebar="dark" data-sidebar-size="lg" data-preloader="disable" data-theme="default" data-topbar="light" data-bs-theme="light">



<!-- Mirrored from themesbrand.com/steex/layouts/dashboard-crm.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 10 Jul 2023 09:31:30 GMT -->
<head>

    <meta charset="utf-8">
    <title>WCF </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Minimal Admin & Dashboard Template" name="description">
    <meta content="Themesbrand" name="author">
    <!-- App favicon -->
    <link rel="shortcut icon" href="assets/images/favicon.ico">
    <meta name="csrf-token" content="{{ csrf_token() }}" />

    <!-- Fonts css load -->
    <link rel="preconnect" href="https://fonts.googleapis.com/">
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
    <link id="fontsLink" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&amp;display=swap" rel="stylesheet">

    <!-- Layout config Js -->
    <script src="{{ asset('assets/js/layout.js')}}"></script>
    <link rel="stylesheet" href="{{ asset('assets/swtalrt/sweetalert.css')}}">

    <!-- Bootstrap Css -->
    <link href="{{ asset('assets/css/bootstrap.min.css')}}" rel="stylesheet" type="text/css">
    <!-- Icons Css -->
    <link href="{{ asset('assets/css/icons.min.css')}}" rel="stylesheet" type="text/css">
    <!-- App Css-->
    <link href="{{ asset('assets/css/app.min.css')}}" rel="stylesheet" type="text/css">
    <!-- custom Css-->
    <link href="{{ asset('assets/css/custom.min.css')}}" rel="stylesheet" type="text/css">

</head>

<body>

    <!-- Begin page -->
    <div id="layout-wrapper">

        <!-- ========== App Menu ========== -->
    <x-layouts.sidebar />
<!-- Left Sidebar End -->
<!-- Vertical Overlay-->
<div class="vertical-overlay"></div>
       
        <x-layouts.navbar />
        <!-- removeNotificationModal -->
        <div id="removeNotificationModal" class="modal fade zoomIn" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="NotificationModalbtn-close"></button>
                    </div>
                    <div class="modal-body p-md-5">
                        <div class="text-center">
                            <div class="text-danger">
                                <i class="bi bi-trash display-4"></i>
                            </div>
                            <div class="mt-4 fs-base">
                                <h4 class="mb-1">Are you sure ?</h4>
                                <p class="text-muted mx-4 mb-0">Are you sure you want to remove this Notification ?</p>
                            </div>
                        </div>
                        <div class="d-flex gap-2 justify-content-center mt-4 mb-2">
                            <button type="button" class="btn w-sm btn-light" data-bs-dismiss="modal">Close</button>
                            <button type="button" class="btn w-sm btn-danger" id="delete-notification">Yes, Delete It!</button>
                        </div>
                    </div>

                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

        <!-- removeCartModal -->
        <div id="removeCartModal" class="modal fade zoomIn" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="close-cartmodal"></button>
                    </div>
                    <div class="modal-body p-md-5">
                        <div class="text-center">
                            <div class="text-danger">
                                <i class="bi bi-trash display-5"></i>
                            </div>
                            <div class="mt-4">
                                <h4>Are you sure ?</h4>
                                <p class="text-muted mx-4 mb-0">Are you sure you want to remove this product ?</p>
                            </div>
                        </div>
                        <div class="d-flex gap-2 justify-content-center mt-4 mb-2">
                            <button type="button" class="btn w-sm btn-light" data-bs-dismiss="modal">Close</button>
                            <button type="button" class="btn w-sm btn-danger" id="remove-cartproduct">Yes, Delete It!</button>
                        </div>
                    </div>

                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
        
        <!-- ============================================================== -->
        <!-- Start right Content here -->
        <!-- ============================================================== -->
       @yield('content')
        <!-- end main content-->

        <x-layouts.footer />

    </div>
    <!-- END layout-wrapper -->

    <!--start back-to-top-->
    <button class="btn btn-dark btn-icon" id="back-to-top">
        <i class="bi bi-caret-up fs-3xl"></i>
    </button>
    <!--end back-to-top-->

    <!--preloader-->
    <div id="preloader">
        <div id="status">
            <div class="spinner-border text-primary avatar-sm" role="status">
                <span class="visually-hidden">Loading...</span>
            </div>
        </div>
    </div>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <!-- JAVASCRIPT -->
    <script src="{{ asset('assets/libs/bootstrap/js/bootstrap.bundle.min.js')}}"></script>
    <script src="{{ asset('assets/libs/simplebar/simplebar.min.js')}}"></script>
    <script src="{{ asset('assets/js/plugins.js')}}"></script>
    
    <!-- list js-->
    <script src="{{ asset('assets/libs/list.js/list.min.js')}}"></script>
    <script src="{{ asset('assets/libs/list.pagination.js/list.pagination.min.js')}}"></script>

    {{-- sweet alert --}}
    <script src="{{ asset('assets/swtalrt/jquery.sweet-alert.custom.js')}}"></script>
    <script src="{{ asset('assets/swtalrt/sweetalert.js')}}"></script>
    <script src="{{ asset('assets/notify/notify.js')}}"></script>

    
    <!-- apexcharts -->
    <script src="{{ asset('assets/libs/apexcharts/apexcharts.min.js')}}"></script>

    <!--dashboard crm init js-->
    <script src="{{ asset('assets/js/pages/dashboard-crm.init.js')}}"></script>

    <!-- App js -->
    <script src="{{ asset('assets/js/app.js')}}"></script>
    @stack('scripts')
</body>


<!-- Mirrored from themesbrand.com/steex/layouts/dashboard-crm.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 10 Jul 2023 09:31:38 GMT -->
</html>