<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="lvchanglong"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
    <asset:stylesheet src="sb-admin-2.min.css"/>
    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>
</head>
<body>


    <g:pageProperty name="page.header" default="${render(template:"/layouts/header")}"/>
    <g:layoutBody/>
    <g:pageProperty name="page.footer" default="${render(template:"/layouts/footer")}"/>

    <!-- Bootstrap core JavaScript-->
    <script src="/assets/jquery/jquery.min.js"></script>
    <script src="/assets/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/assets/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/assets/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    %{--    <asset:javascript src="chartjs/Chart.min.js"/>--}%
    <script src="/assets/chartjs/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/assets/demo/chart-area-demo.js"></script>
    <script src="/assets/demo/chart-pie-demo.js"></script>

    <asset:javascript src="application.js"/>

</body>
</html>
