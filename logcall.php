<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Police Emergency Service System</title>
    <link rel="stylesheet" href="./styles/logcall.css">
</head>

<body>
    <script>
        const mohammadHarris = () => {
            var x = document.forms['frmLogCall']['callerName'].value;
            if (x == null || x == '') {
                alert('Caller Name is required');
                return false;
            }
        }
    </script>
    <?php
    include('nav.php');
    include('db.php');
    //connecting the database
    $mysqli= mysqli_connect(DB_SERVER, DB_USER, DB_PASSWORD, DB_DATABASE);

    if ($mysqli->connect_error) {
        die("Error connecting to the database: " . $mysqli->connect_error);
    }

    $sql = "SELECT * FROM incidenttype";
    

    if (!($stmt = $mysqli->prepare($sql))) {
        die("Command error: " . $mysqli->error);
    }

    if (!$stmt->execute()) {
        die('Cannot run SQL command' . $stmt->error);
    }

    if (!($resultset = $stmt->get_result())) {
        die('No data is resultset: ' . $stmt->error);
    }

    $incidentType;

    while ($row = $resultset->fetch_assoc()) {
        $incidentType[$row['incidentTypeId']] = $row['incidentTypeDesc'];
    }

    $stmt->close();

    $resultset->close();

    $mysqli->close();
    
    ?>
    

    <div id="container">
        
        <form method="post" action='dispatch.php' onSubmit="return mohammadHarris();" name='frmLogCall'>

            <table>
            <tr>
                    <h1 class='table__top' style="width:40%; padding:5px; font-size:20px">
                        User Information
                    </h1>
                </tr>
                
                <tr>
                  
                    <td class='table__left'>Caller's Name:</td>
                    <!-- <td><?php echo $_POST['callerName'] ?></td> -->
                    <td class='table__right'><input type="text" name='callerName' id='callerName' placeholder="callers name"></td>
                </tr>

                <tr>
                    <td class='table__left'>Contact No:</td>
                    <!-- <td><?php echo $_POST['contactNo'] ?></td> -->
                    <td class='table__right'><input type="text" name='contactNo' id='contactNo' placeholder="e.g 98651234"></td>
                </tr>

                <tr>
                    <td class='table__left'>Location:</td>
                    <!-- <td><?php echo $_POST['location'] ?></td> -->
                    <td class='table__right'><input type="text" name='location' id='location' placeholder='e.g Singapore'></td>
                </tr>

                <tr>
                <!-- <td><?php echo $_POST['incidentType'] ?></td> -->
                    <td class='table__left'>Incident Type</td>
                    <td class='table__right'>
                        <select name='incidentType' id='incidentType'>
                            <?php
                            echo $incidentType[0];
                            foreach($incidentType as $incident){
                                echo '<option value="'.$incident.'".>'.$incident.'</option>';
                            }
                            ?>
                        </select>
                    </td>
                </tr>

                <tr>
                <!-- <td><?php echo $_POST['incidentDesc'] ?></td> -->
                    <td class='table__left'>Description:</td>
                    <td class='table__right'>
                        <Textarea name='incidentDesc' id='incidentDesc' cols='45' placeholder='Accident etc...'></Textarea>
                    </td>
                </tr>

                <!-- <tr>
                    <td class='table__left'>
                        <button type="reset" name='btnCancel'>Reset</button>
                    </td>
                    <td class='table__right'>
                        <button type="submit" name='btnProcessCall' id='btnProcessCall'>Process Call</button>
                    </td>
                </tr> -->


            </table>
            <div class='form__buttons'>
                <button type="reset" name='btnCancel' id='btnCancel'>Reset</button>
                <button type="submit" name='btnProcessCal' id='btnProcessCall'>Dispatch</button>
            </div>

        </form>
        
    </div>

</body>

</html>