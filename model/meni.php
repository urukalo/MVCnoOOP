<?php
function meni($id)
{
	
		@$meni .= "\n";
		$DBst = "select id from stranice where meni = $id ORDER BY msort";
		$DBstRez = mysql_query($DBst) or die($DBst.mysql_error());
		$imali = mysql_num_rows($DBstRez);
		if( $imali > 0) 
		{
			$meni .= "<ul>";
			while(list($id_str) = mysql_fetch_array($DBstRez))
			{
				$DBst1 = "select id, naziv from stranice where id = $id_str ORDER BY msort";
				$DBstRez1 = mysql_query($DBst1) or die($DBst1.mysql_error());
				list($idPod, $nazivPod) = mysql_fetch_array($DBstRez1);
				
				$meni .= "<li><a href='#' onclick='ajaxGET(\"id=$idPod\", \"levi_div\");'>$nazivPod</a>";
				$meni .= meni($id_str);
				$meni .= "</li>";
			}
			$meni .= "</ul>";
		}
		
		return $meni;
}
		$strana['sadrzaj'] = meni(0);
?>