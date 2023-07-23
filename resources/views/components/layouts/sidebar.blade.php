<div class="app-menu navbar-menu">
    <!-- LOGO -->
    <div class="navbar-brand-box">
        <a href="index.html" class="logo logo-dark">
            <!-- <span class="logo-sm">
                <img src="assets/images/logo-sm.png" alt="" height="22">
            </span>
            <span class="logo-lg">
                <img src="assets/images/logo-dark.png" alt="" height="22">
            </span> -->
            <span style="font-size: 20px; color: #fff; font-weight: bold">GsAfrica</span>
        </a>
        <a href="index.html" class="logo logo-light">
            <!-- <span class="logo-sm">
                <img src="assets/images/logo-sm.png" alt="" height="22">
            </span>
            <span class="logo-lg">
                <img src="assets/images/logo-light.png" alt="" height="22">
            </span> -->
            <span style="font-size: 20px; color: #fff; font-weight: bold">GsAfrica</span>
        </a>
        <button type="button" class="btn btn-sm p-0 fs-3xl header-item float-end btn-vertical-sm-hover" id="vertical-hover">
            <i class="ri-record-circle-line"></i>
        </button>
    </div>

    <div id="scrollbar">
        <div class="container-fluid">

            <div id="two-column-menu">
            </div>
            <ul class="navbar-nav" id="navbar-nav">

                <li class="nav-item">
                    <a href="{{ route('dashboard')}}" class="nav-link menu-link"> <i class="ph-calendar"></i> <span data-key="t-calendar">Home</span> </a>
                </li>
                <li class="menu-title"><i class="ri-more-fill"></i> <span data-key="t-pages">Bot</span></li>


                <li class="nav-item">
                    <a href="{{ route('threads.index')}}" class="nav-link menu-link"> <i class="ph-chats"></i> <span data-key="t-chat">Threads</span> </a>
                </li>
                <li class="nav-item">
                    <a href="{{ route('links.index')}}" class="nav-link menu-link"> <i class="ph-link-thin"></i> <span data-key="t-chat">Link Threads</span> </a>
                </li>

                {{-- <li class="nav-item">
                    <a href="apps-email.html" class="nav-link menu-link"> <i class="ph-envelope"></i> <span data-key="t-email">Email</span> </a>
                </li> --}}

                <li class="menu-title"><i class="ri-more-fill"></i> <span data-key="t-pages">Customers</span></li>
                <li class="nav-item">
                    <a href="#" class="nav-link menu-link"> <i class="ph-users"></i> <span data-key="t-chat">Customers</span> </a>
                </li>
            </ul>
        </div>
        <!-- Sidebar -->
    </div>

    <div class="sidebar-background"></div>
</div>