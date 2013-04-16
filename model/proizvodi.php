<?php
		$br=-1;$trazi="";
		if(isset($_GET['trazi'])) $br=count($trazi);
			if($br>1) $trazi = json_decode($_GET['trazi'], true);
			else if($br==0) $trazi = null;
		//echo $trazi;
		$strana['sadrzaj'] = proizvodi($trazi, $id);


function proizvodi($trazi, $id)
{		print_r($trazi);
		global $model; $brP = $model["cntr"]["brP"]; $ispis =""; 
		if(isset($_GET['s'])) $s = $_GET['strana'];
		else $s = 0;
		$spro = $s*$brP;
		if(count($trazi) == 0) $DBst = "SELECT id, z.naziv as naziv, m.naziv as promo, slika, opis, cena FROM  `proizvodi` as z, promocija as m WHERE m.id=p.id_promo and  m.naziv =  'novo' LIMIT $spro, $brP";
		else 
		{
			$DBst = "SELECT * FROM `proizvodi` where id_promo = (select id from promocija where naziv = 'novo')  LIMIT $spro, $brP"; //.$trazi['promo'].")";
		}

		$DBstRez = mysql_query($DBst) or die($DBst.mysql_error());
		$imali = mysql_num_rows($DBstRez);
		if( $imali > 0) 
		{
			
			while($podaci = mysql_fetch_array($DBstRez))
			{
				$ispis[] = $podaci; 
			}
			
		}
		else $ispis = false;		
		return $ispis;
}


?>