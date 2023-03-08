<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?= $title ?></title>

    <style>
        .bg-light {
            background-image: linear-gradient(#C973FF, #AEBAF8);
        }

        .button {
            background-image: linear-gradient(#C973FF, #AEBAF8);
            width: 50px;
            height: 50px;
            border-radius: 50px;
            margin-top: 20%;
            margin-left: 3%;
            margin-right: 3%;
        }

        .judul {
            color: #AEBAF8;
            font-weight: bold;
        }

        .th-warna {
            background-image: linear-gradient(#C973FF, #AEBAF8);
        }

        th {
            font-size: 14px;
            font-family: sans-serif;
            background: lightblue;
        }
    </style>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="<?= base_url() ?>assets/adminlte/plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="<?= base_url() ?>assets/adminlte/https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Tempusdominus Bootstrap 4 -->
    <link rel="stylesheet" href="<?= base_url() ?>assets/adminlte/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="<?= base_url() ?>assets/adminlte/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- JQVMap -->
    <link rel="stylesheet" href="<?= base_url() ?>assets/adminlte/plugins/jqvmap/jqvmap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="<?= base_url() ?>assets/adminlte/dist/css/adminlte.min.css">
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="<?= base_url() ?>assets/adminlte/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="<?= base_url() ?>assets/adminlte/plugins/daterangepicker/daterangepicker.css">
    <!-- summernote -->
    <link rel="stylesheet" href="<?= base_url() ?>assets/adminlte/plugins/summernote/summernote-bs4.min.css">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
</head>

<body class="hold-transition sidebar-mini layout-fixed">

    <nav class="navbar navbar-expand-lg navbar-dark bg-danger">
        <a class="navbar-brand" href="#">
            <img src="<?= base_url('assets/img/favicon/icon.png') ?>" height="50">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav">
                <a class="nav-link active" href="<?= base_url() ?>welcome">Home <span class="sr-only">(current)</span></a>
                <a class="nav-link" href="<?= base_url() ?>auth">Login</a>
            </div>
        </div>
    </nav>

    <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleCaptions" data-slide-to="1" class="active"></li>
            <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="<?= base_url() ?>assets/img/favicon/logo1.jpg" class="d-block w-100" alt="First Slide">
                <div class="carousel-caption d-none d-md-block">
                    <div class="container text-danger text-center">
                        <h4 class="text-shadow display-4 oleo-font font-weight-bold">SPP FIROH</h4>

                    </div>

                </div>
            </div>
            <div class="carousel-item">
                <img src="<?= base_url() ?>assets/img/favicon/logo2.jpg" class="d-block w-100" alt="Second Slide">
                <div class="carousel-caption d-none d-md-block">
                    <div class="container text-danger text-center">
                        <h4 class="text-shadow display-4 oleo-font font-weight-bold">SPP FIROH</h4>


                    </div>

                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

    <!-- <div id="carouselExampleInterval" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active" data-interval="10000">
                <img src="<?= base_url() ?>assets/img/slider1.jpg" class="d-block w-100" alt="First Slider">
                <div class="carousel-caption d-none d-md-block bg-caption">
                    <h5>TES</h5>
                    <p></p>
                </div>
            </div>
            <div class="carousel-item" data-interval="2000">
            <img src="<?= base_url() ?>assets/img/slider2.jpg" class="d-block w-100" alt="Second Slider">
        </div>
            <div class="carousel-item">
                <img src="<?= base_url() ?>assets/img/slider3.jpg" class="d-block w-100" alt="Third Slider" height="600" width="500">
            </div>
        </div>
        <a class="carousel-control-prev button" href="#carouselExampleInterval" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next button" href="#carouselExampleInterval" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div> -->