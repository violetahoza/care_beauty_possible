<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Home</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f6f9;
      color: #333;
      margin: 0;
      padding: 20px;
    }
    .content-container {
      background-image: url('../uploads/img2.jpg'); 
      background-size: cover;
      background-repeat: no-repeat;
      background-position: center;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
    h1 {
      color: #19784f;
      text-align: center;
      background-color: rgba(255, 255, 255, 0.9);
      padding: 20px;
      border-radius: 10px;
      margin-bottom: 30px;
    }
    .info-box {
      display: flex;
      background: rgba(255, 255, 255, 0.8); /* Semi-transparent background */
      border-radius: 5px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      margin-bottom: 20px;
      padding: 20px;
      align-items: center;
      width: 100%;
      /* background-image: url('../uploads/img1.jpg'); 
      background-size: cover;
      background-repeat: no-repeat;
      background-position: center; */
    }
    .info-box-icon {
      display: flex;
      align-items: center;
      justify-content: center;
      width: 70px;
      height: 70px;
      border-radius: 50%;
      font-size: 2rem;
      color: #fff;
    }
    .bg-maroon {
      background-color: #800000;
    }
    .bg-purple {
      background-color: #6f42c1;
    }
    .bg-success {
      background-color: #28a745;
    }
    .bg-pink {
      background-color: #e83e8c;
    }
    .info-box-content {
      margin-left: 20px;
    }
    .info-box-text {
      font-size: 1.2rem;
      font-weight: bold;
    }
    .info-box-number {
      font-size: 1.5rem;
      margin-top: 5px;
    }
    .clearfix {
      clear: both;
    }
    .info-box-container {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      gap: 20px;
    }
    .info-box-wrapper {
      flex: 1 1 calc(50% - 20px);
      max-width: calc(50% - 20px);
    }
  </style>
</head>
<body>
<h1>Welcome to <?php echo $_settings->info('name') ?></h1>
<hr>
<div class="info-box-container">
    <div class="info-box-wrapper">
      <div class="info-box">
        <span class="info-box-icon bg-maroon elevation-1"><i class="fas fa-table"></i></span>
        <div class="info-box-content">
          <span class="info-box-text">Total Stocks</span>
          <span class="info-box-number">
            <?php 
              $inv = $conn->query("SELECT sum(quantity) as total FROM inventory ")->fetch_assoc()['total'];
              $sales = $conn->query("SELECT sum(quantity) as total FROM order_list where order_id in (SELECT order_id FROM sales) ")->fetch_assoc()['total'];
              echo number_format($inv - $sales);
            ?>
          </span>
        </div>
      </div>
    </div>
    <div class="info-box-wrapper">
      <div class="info-box">
        <span class="info-box-icon bg-purple elevation-1"><i class="fas fa-th-list"></i></span>
        <div class="info-box-content">
          <span class="info-box-text">Pending Orders</span>
          <span class="info-box-number">
            <?php 
              $pending = $conn->query("SELECT sum(id) as total FROM `orders` where status = '0' ")->fetch_assoc()['total'];
              echo number_format($pending);
            ?>
          </span>
        </div>
      </div>
    </div>
    <div class="info-box-wrapper">
      <div class="info-box">
        <span class="info-box-icon bg-success elevation-1"><i class="fas fa-shopping-cart"></i></span>
        <div class="info-box-content">
          <span class="info-box-text">Total Sales Today</span>
          <span class="info-box-number">
            <?php 
              $sales = $conn->query("SELECT sum(amount) as total FROM `orders` where date(date_created) = '".date('Y-m-d')."' ")->fetch_assoc()['total'];
              echo number_format($sales);
            ?>
          </span>
        </div>
      </div>
    </div>
    <div class="info-box-wrapper">
      <div class="info-box">
        <span class="info-box-icon bg-pink elevation-1"><i class="fas fa-users"></i></span>
        <div class="info-box-content">
          <span class="info-box-text">Registered Clients</span>
          <span class="info-box-number">
            <?php 
              $sales = $conn->query("SELECT * FROM `clients` where delete_flag = 0 ")->num_rows;
              echo number_format($sales);
            ?>
          </span>
        </div>
      </div>
    </div>
  </div>
  <!-- <div class="container">
    <?php 
      $files = array();
      $fopen = scandir(base_app.'uploads/banner');
      foreach($fopen as $fname){
        if(in_array($fname,array('.','..')))
          continue;
        $files[]= validate_image('uploads/banner/'.$fname);
      }
    ?>
  </div> 
  <div id="tourCarousel"  class="carousel slide" data-ride="carousel" data-interval="3000">
      <div class="carousel-inner h-100">
          <?php foreach($files as $k => $img): ?>
          <div class="carousel-item  h-100 <?php echo $k == 0? 'active': '' ?>">
              <img class="d-block w-100  h-100" style="object-fit:contain" src="<?php echo $img ?>" alt="">
          </div>
          <?php endforeach; ?>
      </div>
      <a class="carousel-control-prev" href="#tourCarousel" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#tourCarousel" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
      </a>
  </div> -->

</body>
</html>