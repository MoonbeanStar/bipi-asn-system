<?php
include 'includes/session.php';
include 'includes/conn.php'; 

// Set the content type to HTML
header('Content-Type: text/html');

// Fetch deleted records from scheduled_history table
$supplier_id = $supplier['id'];
$sql = "SELECT scheduled_history.*, supplier.firstname, supplier.lastname 
FROM scheduled_history 
JOIN supplier ON scheduled_history.supplier_id = supplier.id 
WHERE scheduled_history.supplier_id = '$supplier_id' 
ORDER BY scheduled_history.delDate DESC";

$result = $conn->query($sql);

if ($result && $result->num_rows > 0) {
    $records = $result->fetch_all(MYSQLI_ASSOC);
} else {
    $records = [];
}
?>
<?php include 'includes/header.php'; ?>
<body class="hold-transition skin-blue layout-top-nav">
<div class="wrapper">

	<?php include 'includes/navbar.php'; ?>
	 
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
									<th>Category</th>
									<th>Type</th>
									<th>DR Photo</th>
									<th>Status</th>
									<th>Remarks</th>
							
			        			</thead>
			        			<tbody>

								<?php if (!empty($records)): ?>
									<?php foreach ($records as $record): ?>
										<?php
											$status = $record['status'];
											$status_label = '';

											if (in_array($status, [1, 2, 5])) {
												$status_label = '<span class="label label-danger">Unsuccessful Delivered</span>';
											} elseif ($status == 3) {
												$status_label = '<span class="label label-success">Successfully Delivered</span>';
											}
										?>
										<tr>
											<td><?php echo $record['asn_no']; ?></td>
											<td><?php echo ucwords($record['firstname'] . ' ' . $record['lastname']); ?></td>
											<td><?php echo $record['delDate']; ?></td>
											<td><?php echo $record['delTime']; ?></td>
											<td><?php echo $record['category']; ?></td>
											<td><?php echo $record['type']; ?></td>
											<td>
												<?php if ($record['drPhoto']): ?>
													<img src="images/<?php echo $record['drPhoto']; ?>" alt="Delivery Photo" style="width:100px;height:100px;">
												<?php else: ?>
													No Photo
												<?php endif; ?>
											</td>
											<td><?php echo $status_label; ?></td>
											<td><?php echo $record['remarks']; ?></td>
											
										</tr>
									<?php endforeach; ?>
								<?php else: ?>
									<tr>
										<td colspan="10">No records found</td>
									</tr>
								<?php endif; ?>
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