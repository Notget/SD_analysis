<?php
    error_reporting(0);
    $username = "*********";
    $password = "*********";
    $host = "*********";
    $database="*********";

    $connection = mysqli_connect($host, $username, $password, $database);

// query goes here
    $myquery = "
    SELECT form, count(form) as count FROM *********.partypayment
    GROUP BY form;";
// query end

    $query = mysqli_query($connection, $myquery);

    //check if query variable stored
    if ( ! $query ) {
        echo mysqli_error();
        die;
    }
    // store data to html file (named init_var) using PHP ob* methods
    ob_start();
    //store data in array
    $data = array();
    for ($x = 0; $x < mysqli_num_rows($query); $x++) {
        $data[] = mysqli_fetch_assoc($query);
    }

    //convert appropriate strings
    // convert to JSON, echo
    $data_encoded = json_encode($data, JSON_NUMERIC_CHECK);
    echo $data_encoded;
  e
    mysqli_close($connection);
     // start buffering - generate html
    file_put_contents('init_var.html', ob_get_contents());
    // end buffering
    ob_end_flush();
?>
