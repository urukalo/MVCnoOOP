<?php 
function anketa()
{
		$anketa="";
		$DBst = "select * from anketa ORDER BY sort";
		$DBstRez = mysql_query($DBst) or die($DBst.mysql_error());
		$imali = mysql_num_rows($DBstRez);
		if( $imali > 0) 
		{
			$anketa.= "<form>";
			while(list($idA, $tekst, $tip ) = mysql_fetch_array($DBstRez))
			{
				switch ($tip) {
					case 0:
						$anketa.= "<p>$tekst</p>";
						break;
					case 1:
						$anketa.= "<input type='radio' name='anketa0'/> $tekst <br/>";
						break;
					case 2:
						$anketa.= "$tekst <br/><input type='text' name='anketa$idA'/><br/> ";
						break;
				}
			
			}
			$anketa.= "<input type='submit' name='anketa' onClick='anketa();'/></form>";
		}
		return $anketa;
}		

function anketiran($idK)
{
		$DBst = "select * from anketao where idK = $idK";
		$DBstRez = mysql_query($DBst) or die($DBst.mysql_error());
		$imali = mysql_num_rows($DBstRez);
		return $imali != 0;
}

function rezultat()
{
		$anketa = "nema rezultata";
		$DBst = "select idA, tekst, tip, odgovor from anketao, anketa where idA = id";
		$DBstRez = mysql_query($DBst) or die($DBst.mysql_error());
		$imali = mysql_num_rows($DBstRez);
		if( $imali > 0) 
		{
			$anketa = "Rezultati ankete:<br/>";
			$brojac = 0;
			while(list($idA, $tekst, $tip, $odgovor ) = mysql_fetch_array($DBstRez))
			{
				switch ($tip) {
					case 0:
						//naslove ne brojimo
						$anketa.= "<p>$tekst</p>";
						break;
					case 1:
						if($odgovor == 1) @$rez[$tekst]++;
						else @$rez[$tekst] = @$rez[$tekst];
						break;
					case 2:
						//ni ovo ne mogu prebrojati
						break;
				}
			
			}
			foreach($rez as $k => $r)
			{
			$anketa.= $k.": ".$r. " odgovora"; 
			}
		}
		return $anketa;
}



		// = 1;

		if(!isset($_SESSION['idKorisnika']) || anketiran($_SESSION['idKorisnika'])) $strana['sadrzaj'] = rezultat();
		else $strana['sadrzaj'] = anketa();
		
?>