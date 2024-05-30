<?php
include 'includes/session.php';
include 'includes/conn.php';

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['action'])) {
    $action = $_POST['action'];

    if ($action === 'deleteRecord' && isset($_POST['id'])) {
        $id = intval($_POST['id']);

        // Escaping values before embedding in SQL query to prevent SQL injection
        $id_escaped = $conn->real_escape_string($id);

        // Begin a transaction
        $conn->begin_transaction();

        try {
            // Fetch the record
            $sql_fetch = "SELECT * FROM schedule_data WHERE id = '$id_escaped'";
            $result = $conn->query($sql_fetch);

            if ($result && $result->num_rows > 0) {
                $row = $result->fetch_assoc();
                $new_status = $row['status'];

                // Set new status if required
                if (in_array($new_status, [1, 2, 5])) {
                    $new_status = 6; // Unsuccessful Delivered
                }

                // Move the record to scheduled_history table
                $sql_insert = "
                    INSERT INTO scheduled_history (asn_no, supplier_id, delDate, delTime, category, type, drPhoto, status, remarks)
                    VALUES ('{$row['asn_no']}', '{$row['supplier_id']}', '{$row['delDate']}', '{$row['delTime']}', '{$row['category']}', '{$row['type']}', '{$row['drPhoto']}', '$new_status', '{$row['remarks']}')
                ";

                if (!$conn->query($sql_insert)) {
                    throw new Exception("Failed to move the record to history: " . $conn->error);
                }

                // Delete the record from the original table
                $sql_delete = "DELETE FROM schedule_data WHERE id = '$id_escaped'";
                if (!$conn->query($sql_delete)) {
                    throw new Exception("Failed to delete the record from the original table: " . $conn->error);
                }

                // Commit the transaction
                $conn->commit();
                $response = array('status' => 'success', 'message' => 'Record moved to history and deleted successfully');
            } else {
                throw new Exception("Record not found");
            }
        } catch (Exception $e) {
            // Rollback the transaction in case of any error
            $conn->rollback();
            $response = array('status' => 'error', 'message' => $e->getMessage());
        }

        echo json_encode($response);
        exit;
    }
}
?>
