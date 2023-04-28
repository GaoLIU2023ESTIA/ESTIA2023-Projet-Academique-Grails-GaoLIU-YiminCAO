<!doctype html>
<html>
<head>
    <meta name="layout" content="lvchanglong"/>
    <title>Welcome to Lecoincoin</title>
</head>
<body id="page-top">
<div id="wrapper">
    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3">Lecoincoin</div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <!-- Nav Item - User -->
        <li class="nav-item active">
            <a class="nav-link" href="/user">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                    <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                    <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
                </svg>
                <span>users</span></a>
        </li>

        <!-- Nav Item - Annonces -->
        <li class="nav-item active">
            <a class="nav-link" href="/annonce?max=100">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box" viewBox="0 0 16 16">
                    <path d="M8.186 1.113a.5.5 0 0 0-.372 0L1.846 3.5 8 5.961 14.154 3.5 8.186 1.113zM15 4.239l-6.5 2.6v7.922l6.5-2.6V4.24zM7.5 14.762V6.838L1 4.239v7.923l6.5 2.6zM7.443.184a1.5 1.5 0 0 1 1.114 0l7.129 2.852A.5.5 0 0 1 16 3.5v8.662a1 1 0 0 1-.629.928l-7.185 2.874a.5.5 0 0 1-.372 0L.63 13.09a1 1 0 0 1-.63-.928V3.5a.5.5 0 0 1 .314-.464L7.443.184z"/>
                </svg>
                <span>Annonces</span></a>
        </li>


    </ul>
    <!-- End of Sidebar -->
    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
            <div class="container-fluid">
                <div id="controllers" role="navigation">

                    <ul>
                        <sec:ifLoggedIn>
                            <h2>Controllers :</h2>
                            <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                                <li class="controller">
                                    <g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link>
                                </li>
                            </g:each>
                        </sec:ifLoggedIn>

                        <sec:ifNotLoggedIn>
                            <h1>Lecoincoin est une entreprise de dépôt vente touchant à tout ce qui peut se vendre ou s’acheter.</h1>
                            <h1>Les utilisateurs peuvent gérer les annonces, les modifier,  les supprimer et même en créer!</h1>
                            <h2>Veuillez vous connecter d’abord!</h2>
                        </sec:ifNotLoggedIn>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
