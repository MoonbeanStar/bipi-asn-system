<?php include 'includes/session.php'; ?>
<?php
	if(!isset($_SESSION['supplier']) || trim($_SESSION['supplier']) == ''){
		header('index.php');
	}

?>
<?php
function generateASN() {
    // You can customize the ANS format according to your requirements
    $prefix = "ASN"; // Prefix for ANS number
    $random_number = mt_rand(10000, 99999); // Generate a random 5-digit number
    $asn_number = $prefix . $random_number;
    return $asn_number;
}
?>

      
      <?php include 'includes/header.php'; ?>
      <body class="hold-transition skin-blue layout-top-nav">
      <div class="wrapper">
        <?php include 'includes/navbar.php'; ?>
      
        <div class="content-wrapper">
      
          <section class="content-header">
            <h1>
              Schedule Delivery
            </h1>
          
          </section>
          <!-- Main content -->
          <section class="content">
            <?php
               if(isset($_SESSION['error'])){
                ?>
                  <div class="alert alert-danger alert-dismissible">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    <h4><i class="icon fa fa-warning"></i> Error!</h4>
                    <ul>
                      <li><?php echo $_SESSION['error']; ?></li>
                    </ul>
                  </div>
                <?php
                unset($_SESSION['error']);
                }
                
                if(isset($_SESSION['success'])){
                  echo "
                    <div class='alert alert-success alert-dismissible'>
                      <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                      <h4><i class='icon fa fa-check'></i> Success!</h4>
                      ".$_SESSION['success']."
                    </div>
                  ";
                  unset($_SESSION['success']);
                }
            ?>
  <div class="box box-primary">
    <div class="box-header with-border">
        <a href="#addnew" data-toggle="modal" class="btn btn-primary btn-sm btn-flat"><i class="fa fa-plus"></i> ASN Creation</a>
    </div>
    <!-- /.box-header -->
    <div class="box-body">
    <div class="table-responsive">
        <table id="example1" class="table table-bordered">
            <thead style="background: #2E5984; color: white;">
                <tr>
                    <th class="hidden"></th>
                    <th>#</th> 
                    <th>ASN No.</th>
                    <th>Name</th>
                    <th>Delivery Date</th>
                    <th>Delivery Time</th>
                    <th>Item Category</th>
                    <th>Item Type</th>  
                    <th>DR Photo</th>
                    <th>Status</th>
                    <th>Remarks</th>
                    <th>Actions</th>
                </tr>
            </thead>
                <tbody>

                <?php
                    $supplier_id = $supplier['id'];
                    $sql = "SELECT schedule_data.*, supplier.firstname, supplier.lastname, schedule_data.status AS barstat 
                            FROM schedule_data 
                            JOIN supplier ON schedule_data.supplier_id = supplier.id 
                            WHERE schedule_data.supplier_id = '$supplier_id' 
                            ORDER BY schedule_data.delTime DESC";

                    $query = $conn->query($sql);
                    $i = 1; // Initialize $i before the loop
                    $rowsFound = false; // Flag to track if any rows were processed

                    while ($row = $query->fetch_assoc()) {
                        $rowsFound = true; // Set the flag to true if we enter the loop

                        // Determine the status
                        switch ($row['barstat']) {
                            case 1:
                                $status = '<span class="label label-info">For Approval</span>';
                                break;
                            case 2:
                                $status = '<span class="label label-success">Approved</span>';
                                break;
                            case 5:
                                $status = '<span class="label label-danger">Cancel Booked</span>';
                                break;
                            case 3:
                                $status = '<span class="label label-success">Successfully Delivered</span>';
                                break;
                            default:
                                $status = '<span class="label label-default">Unknown</span>';
                                break;
                        }

                        echo "
                        <tr>
                            <td class='hidden'></td>
                            <td>" . $i . "</td>
                            <td>" . $row['asn_no'] . "</td>
                            <td>" . ucwords($row['firstname'] . ' ' . $row['lastname']) . "</td>
                            <td>" . $row['delDate'] . "</td>
                            <td>" . $row['delTime'] . "</td>
                            <td>" . $row['category'] . "</td>
                            <td>" . $row['type'] . "</td>
                            <td><img src='images/" . $row['drPhoto'] . "' alt='DR Photo' style='width:100px;height:100px;'></td>
                            <td>" . $status . "</td>
                            <td>" . $row['remarks'] . "</td>
                            <td>";

                            if ($row['barstat'] == 1) {
                                echo "<button class='btn btn-info btn-sm btn-flat' onClick='openEditModal(" . $row['id'] . ",'" . $row['asn_no'] . "')\"><i class='fa fa-edit'></i> Edit</button>";
                            }
                            
                            if ($row['barstat'] != 2) {
                                echo "<button class='btn btn-danger btn-sm btn-flat' onClick='deleteRecord(" . $row['id'] . ")'><i class='fa fa-trash'></i> Delete</button>";
                            }
                            
                        echo "
                            </td>
                        </tr>
                        ";

                        $i++;
                    }
                    ?>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </section>   
  </div>
    
  <?php include 'includes/footer.php'; ?>
  <?php include 'includes/schedule_modal.php'; ?>
</div>
<?php include 'includes/scripts.php'; ?>          
				       
<script>

$(document).ready(function() {
    function openEditModal(response, asn_no) {
        $('.catid').val(response.id);
        $('#edit_asn_no').val(asn_no);  // Set ASN number
        $('#edit_supplier').val(response.supplier_id);
        $('#edit_datepicker_edit').val(response.delivery_date);
        $('#edit_delTime').val(response.delivery_time);
        $('#edit_name').val(response.item_category_id);
        $('#edit_itemType').val(response.item_type_id);
        $('#edit_totalDel').val(response.total_delivery);
        $('#edit_uom1Name').val(response.uom1_name);
        $('#edit_totalQty').val(response.total_quantity);
        $('#edit_uom2Name').val(response.uom2_name);
        $('#edit_vehicleModel').val(response.vehicle_model);
        $('#edit_plateNo').val(response.plate_no);
        $('#edit_driverName').val(response.driver_name);
        $('#edit_helperName').val(response.helper_name);
        $('#edit').modal('show');
    }

    $(document).on('click', '.edit', function(e) {
        e.preventDefault();
        var id = $(this).data('id');
        var asn_no = $(this).data('asn_no');
        $.ajax({
            type: 'POST',
            url: 'schedule_edit.php',
            data: {id: id},
            dataType: 'json',
            success: function(response) {
                openEditModal(response, asn_no);
            }
        });
    });
});
</script>



<script>
        function deleteRecord(id) {
            if (confirm("Are you sure you want to delete this record?")) {
                $.post('schedule_delete.php', { action: 'deleteRecord', id: id }, function(response) {
                    alert(response.message);
                    if (response.status === 'success') location.reload();
                }, 'json').fail(function(xhr) {
                    alert('An error occurred: ' + xhr.responseText);
                });
            }
        }
    </script>

<script>
$(document).ready(function(){
    $('#name').change(function(){
        var categoryId = $(this).val();
        if(categoryId){
            $.ajax({
                type: 'POST',
                url: 'get_types.php', // PHP file to fetch type names
                data: {categoryId: categoryId},
                success: function(response){
                    $('#itemType').html(response);
                }
            });
        }
        else{
            $('#itemType').html('<option value="" selected disabled>Please Select Item Type Here.</option>');
        }
    });
});
</script>

<script>
$(document).ready(function(){
    let counter = 0;
    $('#append-div').click(function(e){
        e.preventDefault();
        counter++;
        $('#append').append(`
            <div class="form-group" id="input-group-${counter}">
                <label for="newNumber${counter}" class="col-sm-3 control-label"></label>
                <div class="col-sm-9">
                    <div class="row">
                        <div class="col-sm-6">
                        <select class="form-control" id="totalDel" name="totalDel" required>
                                <?php
                                $totalQty = 10;
                                for ($i = 0; $i <= $totalQty; $i++) {
                                    echo "<option value='$i'>$i</option>";
                                }
                                ?>
                            </select>
                        </div>
                        <div class="col-sm-6">
                            <select class="form-control" name="newUom${counter}" required>
                                <option value="" selected disabled>Please Select Here.</option>
                                <?php
                                $result = $conn->query($package);
                                if ($result->num_rows > 0) {
                                    while ($row = $result->fetch_assoc()) {
                                        echo "<option value='" . $row['id'] . "'>" . ucwords($row['uom1Name']) . "</option>";
                                    }
                                } else {
                                    echo "<option value=''>No package type available</option>";
                                }
                                ?>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
        `);
    });
});
</script>

<script>
$(document).ready(function(){
    let counter = 0;
    $('#append_qty').click(function(e){
        e.preventDefault();
        counter++;
        $('#append-div-qty').append(`
            <div class="form-group" id="input-group-${counter}">
                <label for="newNumber${counter}" class="col-sm-3 control-label"></label>
                <div class="col-sm-9">
                    <div class="row">
                        <div class="col-sm-6">
                            <select class="form-control" name="totalQty" required>
                                <?php
                                $totalQty = 10;
                                for ($i = 0; $i <= $totalQty; $i++) {
                                    echo "<option value='$i'>$i</option>";
                                }
                                ?>
                            </select>
                        </div>
                        <div class="col-sm-6"> <!-- Adjust the column size as needed -->
                        <select class="form-control" id="uom2Name" name="uom2Name" required>
                              <option value="" selected disabled>Please Select Here.</option>
                                    <?php   
                                        $quantity = "SELECT id, qtyname FROM quantity";
                                        $result = $conn->query($quantity);
                    
                                        // Loop through fetched data and generate options
                                        if ($result->num_rows > 0) {
                                           while ($row = $result->fetch_assoc()) {
                                               echo "<option value='" . $row['id'] . "'>" . ucwords($row['qtyname']) . "</option>";
                                           }
                                       } else {
                                           echo "<option value=''>No quantity available</option>";
                                       }
                                     ?>
                                </select>
                            </div>
                    </div>
                </div>
            </div>
        `);
    });
});
</script>

<script>
        $(document).ready(function(){
            let counter = 1;
            $('#addVehicle').click(function(){
                counter++;
                var vehicleDetails = `
                    <div class="form-group">
                        <label for="vehicleModel" class="col-sm-3 control-label">Vehicle Model${counter}:</label>
                        <div class="col-sm-9"> 
                            <input type="text" class="form-control" name="vehicleModel">
                        </div>
                    </div>
                 
                    <div class="form-group">
                        <label for="plateNo" class="col-sm-3 control-label">Plate No.:</label>
                        <div class="col-sm-9"> 
                            <input type="text" class="form-control" name="plateNo">
                        </div>
                    </div>
              
                    <div class="form-group">
                        <label for="driverName" class="col-sm-3 control-label">Driver Name${counter}:</label>
                        <div class="col-sm-9"> 
                            <input type="text" class="form-control" name="driverName">
                        </div>
                    </div>
            
                    <div class="form-group">
                        <label for="helperName" class="col-sm-3 control-label">Helper Name${counter}:</label>
                        <div class="col-sm-9"> 
                            <input type="text" class="form-control" name="helperName">
                        </div>
                    </div>`;
                
                $('#append-vehicle').append(vehicleDetails);
            });
        });
    </script>

</body>
</html>
