
function sqlToXml($query,$data='') {

	header ("Content-Type:text/xml");//send xml header to browser

	echo getDataXML($query,$data);
}



function getDataXML($sql, $name='data', $admin=false)
{
/**
 * This function takes a SQL query and formats it as an XML Data stream.
 * If called from the reporting section, do not allow non-select SQL words.
**/
	$errorflag = false;

	if ($_SESSION["pagename"] == "") $_SESSION["pagename"] = "Unknown";
	if ($_SESSION["dbLogUser"] == "") {
		$CurrUser = "SYSTEM";
	}else{
		$CurrUser = $_SESSION["dbLogUser"];
	}

	$sqlquery = html_entity_decode($sql);

	if (!$admin) {
	// Disable SQL table manipulation statements //
		if (strpos(strtolower ($sqlquery), 'delete') > 0 ) $errorflag = true;
		if (strpos(strtolower ($sqlquery), 'insert') > 0 ) $errorflag = true;
		if (strpos(strtolower ($sqlquery), 'update') > 0 ) $errorflag = true;
		if (strpos(strtolower ($sqlquery), 'load') > 0 ) $errorflag = true;
		if (strpos(strtolower ($sqlquery), 'replace') > 0 ) $errorflag = true;
		if (strpos(strtolower ($sqlquery), 'drop') > 0 ) $errorflag = true;
		if (strpos(strtolower ($sqlquery), 'alter') > 0 ) $errorflag = true;
		if (strpos(strtolower ($sqlquery), 'create') > 0 ) $errorflag = true;
		if (strpos(strtolower ($sqlquery), 'truncate') > 0 ) $errorflag = true;
	}

	if (!$errorFlag){
		$SQLError = false;
	// Connecting, selecting database
		$link = mysqli_connect($_SESSION["config_DBhost"]
				, $_SESSION["config_DBuser"]
				, $_SESSION["config_DBpassword"]
				, $_SESSION["config_DBname"]);
		if (!$link) doDebug(mysqli_connect_error(), $sqlquery);

			$xml          = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
			$root_element = $name;
			$result = mysqli_query($link, $sqlquery) or  $SQLError = true;
			if ($SQLError) {
				die('Invalid query: ' . $sqlquery . ' SQL Error '  . mysqli_error());
			}

			$xml .= "<".$name."s>";

			if(mysqli_num_rows($result)>0)
			{
			   while($result_array = mysqli_fetch_assoc($result))
			   {
				  $xml .= "<".$name.">";

				  //loop through each key,value pair in row
				  foreach($result_array as $key => $value)
				  {
					 $xml .= "<$key>";//$key holds the table column name
					 $xml .= htmlentities ($value);
					 $xml .= "</$key>";// close the element
				  }
				  $xml.="</".$name.">";
			   }
			}
			$xml.='<error></error>';
			$xml .= "</".$name."s>"; //Close Root
		} else {
			$xml.='<error>Could Not Process Query:' . htmlentities($sqlquery) . '</error>';
		}

//	mysqli_close($link);
	return $xml;
}
