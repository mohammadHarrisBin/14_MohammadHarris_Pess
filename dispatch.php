<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Police Emergency Service System</title>
    <link rel="stylesheet" href="./styles/logcall.css">
    <link rel="stylesheet" href="./styles/dispatch.css">

</head>

<body>
    <?php

    include('nav.php');


    ?>

    <?php

    if (isset($_POST['btnDispatch'])) {

        require_once 'db.php';
        $mysqli = mysqli_connect(DB_SERVER, DB_USER, DB_PASSWORD, DB_DATABASE);

        if ($mysqli->connect_error) {
            die("Error connecting to the database: " . $mysqli->connect_error);
        }

        $patrolcarDispatch = $_POST['chkPatrolcar']; // the array of patrol cars
        $numOfPatrolcarDispatched = count($patrolcarDispatch); // count the number of cars

        $incidentStatus;
        if ($numOfPatrolcarDispatched > 0) {
            $incidentStatus = 2; //dispatched
        } else {
            $incidentStatus = 1; //pending
        }

        $sql = "
        INSERT INTO incident (callerName, phoneNumber, incidentTypeId, incidentLocation, incidentDesc, 
        incidentStatusId) VALUES (?, ? , ?, ?, ?, ?)";

        if (!($stmt = $mysqli->prepare($sql))) {
            die('Cannot run SQL command' . $mysqli->errno);
        }

        if (!$stmt->bind_param(
            'ssssss',
            $_POST['callerName'],
            $_POST['contactNo'],
            $_POST['incidentType'],
            $_POST['location'],
            $_POST['incidentDesc'],
            $incidentStatus
        )) {
            die('Binding parameters failed' . $stmt->errno);
        }
        if (!$stmt->execute()) {
            die('Cannot run SQL command' . $stmt->errno);
        }

        //retrieve incident_id for new reported incident
        $incidentId = mysqli_insert_id($mysqli);

        //update the patrolcar status and add it to the table
        for ($i = 0; $i < $numOfPatrolcarDispatched; $i++) {
            //update the car
            $sql = "UPDATE patrolcar SET patrolcarStatusId = '1' WHERE patrolcarid = ?";

            if (!($stmt = $mysqli->prepare($sql))) {
                die('Prepare failed:' . $mysqli->errno);
            }

            if (!($stmt->bind_param('s', $patrolcarDispatch[$i]))) {
                die("Update patrolcar_status table failed:" . $stmt->errno);
            }

            if (!($stmt->execute())) {
                die("Update patrolcar_status failed:" . $stmt->errno);
            }

            //insert dispatch data
            $sql = "INSERT INTO dispatch(incidentId, patrolcarId, timeDispatched) VALUES(?,?,NOW())";

            if (!($stmt = $mysqli->prepare($sql))) {
                die('Prepare failed' . $mysqli->errno);
            }

            if (!($stmt->bind_param('ss', $incidentId, $patrolcarDispatch[$i]))) {
                die('Binding parameters failed:' . $stmt->errno);
            }
            if (!($stmt->execute())) {
                die("Insert dispatch table failed:" . $stmt->errno);
            }
        }

        $stmt->close();
        $mysqli->close();
    ?>
        <script>
            windows.location.href = '/htdocs/14_MohammadHarris_project5/14_MohammadHarris_Pess/dispatch.php'
        </script>
    <?php

    }

    ?>


    <div id="container">

        <form method="post" action='<?php $_SERVER[htmlentities('PHP_SELF')] ?>' name='frmLogCall'>

            <table style='border:1px white solid' class='table2'>
                <tr>
                    <h1 class='table__top' style="width:40%; padding:5px; font-size:20px">
                        Incident Detail
                    </h1>
                </tr>

                <tr>

                    <td class='table__left'>Caller's Name:</td>
                    <!-- <td class='table__right' name='callerName'><?php echo $_POST['callerName'] ?></td> -->

                    <td class='table__right'><input value=' <?php echo $_POST['callerName'] ?>' type="text" name='callerName' id='callerName' placeholder="callers name">
                </tr>

                <tr>
                    <td class='table__left'>Contact No:</td>
                    <td class='table__right'><input value=' <?php echo $_POST['contactNo'] ?>' type="text" id='contactNo' placeholder="e.g 98651234" name='contactNo'>

                </tr>

                <tr>
                    <td class='table__left'>Location:</td>
                    <td class='table__right'><input value="<?php echo $_POST['location'] ?>" type="text" name='location' id='location' placeholder='e.g Singapore'></td>

                </tr>

                <tr>

                    <td class='table__left'>Incident Type</td>

                    <td class='table__right'><input name='incidentType' id='incidentType' value='<?php echo $_POST['incidentType'] ?>' /></td>


                </tr>

                <tr>

                    <td class='table__left'>Description:</td>
                    <!-- <td class='table__right'><?php echo $_POST['incidentDesc'] ?></td> -->

                    <td class='table__right'>
                        <Textarea name='incidentDesc' id='incidentDesc' placeholder='Accident etc...'><?php echo $_POST['incidentDesc'] ?></Textarea>
                    </td>
                </tr>





            </table>
            <?php


            require_once 'db.php';

            $mysqli = mysqli_connect(DB_SERVER, DB_USER, DB_PASSWORD, DB_DATABASE);

            if ($mysqli->connect_error) {
                die("Error connecting to the database: " . $mysqli->connect_error);
            }

            $sql = "
         
         SELECT patrolcarId, statusDesc FROM patrolcar JOIN patrolcar_status ON 
         patrolcar.patrolcarStatusId=patrolCar_status.StatusId WHERE patrolcar.patrolcarStatusId='2' OR
         patrolcarStatusId='3' 
         
         ";

            if (!($stmt = $mysqli->prepare($sql))) {
                die("Command error: " . $mysqli->errno);
            }

            if (!$stmt->execute()) {
                die('Cannot run SQL command' . $stmt->errno);
            }

            if (!($resultset = $stmt->get_result())) {
                die('No data is resultset: ' . $stmt->errno);
            }

            $patrolcarArray;

            while ($row = $resultset->fetch_assoc()) {
                $patrolcarArray[$row['patrolcarId']] = $row['statusDesc'];
            }

            // foreach($patrolcarArray as $car){
            //     echo $car;
            // }

            $stmt->close();

            $resultset->close();

            $mysqli->close();
            ?>

            <br>
            <table style='margin-bottom:1px; border:1px solid white' colspan=3>


                <tr class='margin-top:-50px'>
                    <h1 class='table__top' style="width:40%; padding:5px; font-size:20px;">
                        Dispatch Patrolcar panel
                    </h1>
                </tr>


                <?php

                foreach ($patrolcarArray as $key => $car) {


                    echo
                    "<tr>
                     <td><input type='checkbox' name='chkPatrolcar[]' value='" . $key . "' />
                     <td>" . $key . "</td>
                     <td>" . $car . "</td>
                     </td>
                     </tr>";
                }

                ?>

                <!-- <tr > -->
                <!-- <td class='table__left'>
                        <button type="reset" name='btnCancel'>Reset</button>
                    </td>
                    <td class='table__left'>
                        <button type="reset" name='btnCancel'>Reset</button>
                    </td>
                    <td class='table__right' style=' display:flex; justify-content:center;'>
                        <button type="submit" name='btnDispatch' id='btnDispatch'>Dispatch</button>
                    </td>
                    
                </tr> -->

                <table />
                <div class='form__buttons'>
                    <button type="reset" name='btnCancel' id='btnCancel'>Reset</button>
                    <button type="submit" name='btnDispatch' id='btnDispatch'>Dispatch</button>
                </div>

        </form>

    </div>

</body>

</html>