<?php
include 'includes/session.php';

if (isset($_POST['edit'])) {
    $id = $_POST['id'];
    $supplier = $_POST['supplier'];
    $delDate = $_POST['delDate'];
    $delTime = $_POST['delTime'];
    $name = $_POST['name'];
    $itemType = $_POST['itemType'];
    $totalDel = $_POST['totalDel'];
    $uom1Name = $_POST['uom1Name'];
    $totalQty = $_POST['totalQty'];
    $uom2Name = $_POST['uom2Name'];
    $vehicleModel = $_POST['vehicleModel'];
    $plateNo = $_POST['plateNo'];
    $driverName = $_POST['driverName'];
    $helperName = $_POST['helperName'];
    $drPhoto = $_FILES['drPhoto']['name'];

    // Handle file upload
    if (!empty($drPhoto)) {
        move_uploaded_file($_FILES['drPhoto']['tmp_name'], 'uploads/' . $drPhoto);
        $photo_update = ", drPhoto = '$drPhoto'";
    } else {
        $photo_update = "";
    }

    $sql = "UPDATE schedule_data SET 
            supplier_id = '$supplier', 
            delivery_date = '$delDate', 
            delivery_time = '$delTime', 
            item_category_id = '$name', 
            item_type_id = '$itemType', 
            total_delivery = '$totalDel', 
            uom1_name = '$uom1Name', 
            total_quantity = '$totalQty', 
            uom2_name = '$uom2Name', 
            vehicle_model = '$vehicleModel', 
            plate_no = '$plateNo', 
            driver_name = '$driverName', 
            helper_name = '$helperName' 
            $photo_update
            WHERE id = '$id'";

    if ($conn->query($sql)) {
        $_SESSION['success'] = 'Shipping notice updated successfully';
    } else {
        $_SESSION['error'] = $conn->error;
    }
} else {
    $_SESSION['error'] = 'Fill up edit form first';
}

header('location: schedule.php');
?>
