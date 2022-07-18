<?php 
session_start();
if(!isset($_SESSION['id_usuario'])){
	include '../php/v/0/login.php';
	exit;
}

?>
<!doctype html>
<html lang="en" dir="ltr">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta name='viewport' content='width=device-width, initial-scale=1.0, user-scalable=0'>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="Description" content="Bootstrap Responsive Admin Web Dashboard HTML5 Template">
		<meta name="Author" content="Spruko Technologies Private Limited">
		<meta name="Keywords" content="CodeIgniter Admin & Dashboard Template, Codeigniter Admin Template, Codeigniter admin panel, Codeigniter Bootstrap 5, Codeigniter admin template Bootstrap 5, Codeigniter Templates Using Bootstrap Admin, codeigniter admin, codeigniter dashboard, Admin & Dashboard Template, admin template, admin dashboard, admin panel, Bootstrap 5 admin template"/>
		<title>Administrador</title>
		<link rel="icon" href="nowa/nowa_demo/assets/img/brand/favicon.png" type="image/x-icon"/>
		<link href="nowa/nowa_demo/assets/css/icons.css" rel="stylesheet">
		<link id="style" href="nowa/nowa_demo/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
		<link href="nowa/nowa_demo/assets/css/style.css" rel="stylesheet">
		<link href="nowa/nowa_demo/assets/css/style-dark.css" rel="stylesheet">
		<link href="nowa/nowa_demo/assets/css/style-transparent.css" rel="stylesheet">
		<link href="nowa/nowa_demo/assets/css/skin-modes.css" rel="stylesheet" />
		<link href="nowa/nowa_demo/assets/css/animate.css" rel="stylesheet">
		<link href="nowa/nowa_demo/assets/switcher/css/switcher.css" rel="stylesheet"/>
		<link href="nowa/nowa_demo/assets/switcher/demo.css" rel="stylesheet"/>
		<link href="nowa/nowa_demo/assets/css/SumoSelect.css" rel="stylesheet"/>
		<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
		<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
		<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/nprogress/0.2.0/nprogress.min.js" integrity="sha512-bUg5gaqBVaXIJNuebamJ6uex//mjxPk8kljQTdM1SwkNrQD7pjS+PerntUSD+QRWPNJ0tq54/x4zRV8bLrLhZg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/nprogress/0.2.0/nprogress.css" integrity="sha512-DanfxWBasQtq+RtkNAEDTdX4Q6BPCJQ/kexi/RftcP0BcA4NIJPSi7i31Vl+Yl5OCfgZkdJmCqz+byTOIIRboQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.6.13/flatpickr.min.css" integrity="sha512-MQXduO8IQnJVq1qmySpN87QQkiR1bZHtorbJBD0tzy7/0U9+YIC93QWHeGTEoojMVHWWNkoCp8V6OzVSYrX0oQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightgallery/2.6.0-beta.1/css/lightgallery.min.css" integrity="sha512-Szyqrwc8kFyWMllOpTgYCMaNNm/Kl8Fz0jJoksPZAWUqhE60VRHiLLJVcIQKi+bOMffjvrPCxtwfL+/3NPh/ag==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	</head>
	<body class="ltr main-body app sidebar-mini">
		<div class="page">
            <div>
				<?php 
				
					include '../php/v/0/header.php';
					include '../php/v/0/sidebar.php';
				?>
            </div>
			<!-- main-content -->
			<div class="main-content app-content">
				<!-- container -->
				<div class="main-container container-fluid">
					<div class="breadcrumb-header justify-content-between">
						<div class="left-content">
						<span class="main-content-title mg-b-0 mg-b-lg-1">Vista inicio</span>
						</div>
					</div>
					<div class="" id="contenido">
					</div>
                </div>
				<!-- Container closed -->
			</div>
		</div>
		<div class="modal fade" id="Extra" style="display: none;" aria-hidden="true">
			<div class="modal-dialog modal-xl" id="contenido_modal" role="document">
				
			</div>
		</div>
		<div class="modal fade" id="modaldemo3" data-bs-backdrop="static" data-bs-keyboard="false" style="display: none;" aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content modal-content-demo">
					<div class="modal-header">
						<h6 class="modal-title">Large Modal</h6><button aria-label="Close" class="btn-close" data-bs-dismiss="modal" type="button"><span aria-hidden="true">×</span></button>
					</div>
					<div class="modal-body">
						<h6>Modal Body</h6>
						<p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.</p>
					</div>
					<div class="modal-footer">
						<button class="btn ripple btn-primary" type="button">Save changes</button>
						<button class="btn ripple btn-secondary" data-bs-dismiss="modal" type="button">Close</button>
					</div>
				</div>
			</div>
		</div>
		<style>
			.alertify-notifier {
    		z-index: 999999 !important;
		}
		</style>
		<!-- <div class="alert alert-solid-success alert-dismissible" role="alert" id="alerta">
			<strong id="alert_top">Mensaje</strong> <span id="alert_text">Texto del mensaje</span>
			<button aria-label="Close" class="btn-close" data-bs-dismiss="alert" type="button"><span aria-hidden="true">×</span></button>
		</div> -->
		<!-- End Page -->
				<!-- Back-to-top -->
		<a href="#top" id="back-to-top"><i class="las la-arrow-up"></i></a>
		<!-- JQuery min js -->
		<script src="nowa/nowa_demo/assets/plugins/jquery/jquery.min.js"></script>
		<!-- Bootstrap js -->
		<script src="nowa/nowa_demo/assets/plugins/bootstrap/js/popper.min.js"></script>
		<script src="nowa/nowa_demo/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
		<!-- Moment js -->
		<script src="nowa/nowa_demo/assets/plugins/moment/moment.js"></script>
		<!-- P-scroll js -->
		<!-- <script src="nowa/nowa_demo/assets/plugins/perfect-scrollbar/perfect-scrollbar.min.js"></script>
		<script src="nowa/nowa_demo/assets/plugins/perfect-scrollbar/p-scroll.js"></script> -->
		<!-- eva-icons js -->
		<script src="nowa/nowa_demo/assets/js/eva-icons.min.js"></script>
		<!-- Sidebar js -->
		<!-- <script src="nowa/nowa_demo/assets/plugins/side-menu/sidemenu.js"></script> -->
		<!-- Internal Chart.Bundle js-->
		<script src="nowa/nowa_demo/assets/plugins/chart_js/Chart.bundle.min.js"></script>
		<!-- INTERNAL Apexchart js -->
		<script src="nowa/nowa_demo/assets/js/apexcharts.js"></script>
		<!--Internal Sparkline js -->
		<script src="nowa/nowa_demo/assets/plugins/jquery-sparkline/jquery.sparkline.min.js"></script>
		<!--Internal  Perfect-scrollbar js -->
		<!-- <script src="nowa/nowa_demo/assets/plugins/perfect-scrollbar/perfect-scrollbar.min.js"></script>
		<script src="nowa/nowa_demo/assets/plugins/perfect-scrollbar/p-scroll.js"></script> -->
		<!--Internal  index js -->
		<script src="nowa/nowa_demo/assets/js/index.js"></script>
		<!-- Chart-circle js -->
		<script src="nowa/nowa_demo/assets/js/circle-progress.min.js"></script>
		<!-- Internal Data tables -->
		<script src="nowa/nowa_demo/assets/plugins/datatable/js/jquery.dataTables.min.js"></script>
		<script src="nowa/nowa_demo/assets/plugins/datatable/js/dataTables.bootstrap5.js"></script>
		<script src="nowa/nowa_demo/assets/plugins/datatable/dataTables.responsive.min.js"></script>
		<script src="nowa/nowa_demo/assets/plugins/datatable/responsive.bootstrap5.min.js"></script>
		<!-- INTERNAL Select2 js -->
		<script src="nowa/nowa_demo/assets/plugins/select2/js/select2.full.min.js"></script>
		<script src="nowa/nowa_demo/assets/js/select2.js"></script>
		<script src="nowa/nowa_demo/assets/plugins/select2/js/select2.min.js"></script>
		<script src="nowa/nowa_demo/assets/plugins/sumoselect/jquery.sumoselect.js"></script>
		<!-- Sticky js -->
		<script src="nowa/nowa_demo/assets/js/sticky.js"></script>
		<!-- Right-sidebar js -->
		<!-- <script src="nowa/nowa_demo/assets/plugins/sidebar/sidebar.js"></script>
		<script src="nowa/nowa_demo/assets/plugins/sidebar/sidebar-custom.js"></script> -->
		<!-- Theme Color js -->
		<script src="nowa/nowa_demo/assets/js/themecolor.js"></script>
		<!-- custom js -->
		<script src="nowa/nowa_demo/assets/js/custom.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.6.13/flatpickr.min.js" integrity="sha512-K/oyQtMXpxI4+K0W7H25UopjM8pzq0yrVdFdG21Fh5dBe91I40pDd9A4lzNlHPHBIP2cwZuoxaUSX0GJSObvGA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<!-- Switcher js -->
		<!-- <script src="nowa/nowa_demo/assets/switcher/js/switcher.js"></script> -->
		<script src="js/main.js?0.1"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/lightgallery/2.6.0-beta.1/lightgallery.umd.min.js" integrity="sha512-mTkrmSjDbnQupfqRqR37iXQBo1/ibXR2dHvKQ5e72HENLkjOkrJXapSsctcSCSQ7ufPgdWZmQ+mBf9KnFjbaSA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</html>