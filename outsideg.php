<?php include 'includes/session.php'; ?>
<?php
	if(!isset($_SESSION['employee']) || trim($_SESSION['employee']) == ''){
		header('index.php');
	}

?>
<?php include 'includes/header.php'; ?>
<body class="hold-transition skin-blue layout-top-nav">
<div class="wrapper">

	<?php include 'includes/navbaroutg.php'; ?>
	 
	  <div class="content-wrapper">
	    <div class="container">

	      <!-- Main content -->
	      <section class="content">
	        <div class="row">
	        	<div class="col-sm-30 col-sm-offset-0">
	        		<div class="box">
	        			<div class="box-header with-border">
	        				<h3 class="box-title">SCHEDULE HISTORY</h3>
	        	
	        			</div>
	        			<div class="box-body">
	        				<table class="table table-bordered table-striped" id="example1">
			        			<thead>
			        				<th class="hidden"></th>
			        				<th>ASN No.</th>
									<th>Name</th>
									<th>Delivery Date</th>
									<th>Delivery Time</th>
									<th>Item Category</th>
									<th>Item Type</th>
									<th>DR Photo</th>
									<th>Status</th>
									<th>Remarks</th>
									<th>Action</th>
			        			</thead>
			        			<tbody>
			        			<?php
			        			
			        			?>
			        			</tbody>
			        		</table>
	        			</div>
	        		</div>
	        	</div>
	        </div>
	      </section>
	     
	    </div>
	  </div>
  
  	<?php include 'includes/footer.php'; ?>
</div>

<?php include 'includes/scripts.php'; ?>

</body>
</html>