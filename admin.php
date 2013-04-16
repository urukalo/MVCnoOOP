<?php

		if(isset($_REQUEST['akcija'])) $a = $_REQUEST['akcija'];
		else $a = "listing";
		if(isset($_REQUEST['arg'])) $strana['sadrzaj'] = @$a($_REQUEST['arg']);
		else $strana['sadrzaj'] = @$a();
		
function listing($ispis = "Odaberi akciju")
{
	global $model; 
	$id = $model['cntr']['id']; $sadr ="";
	list($idM) = mysql_fetch_array(mysql_query("select id from stranice where link = 'meni'"));
	$sadr.= "<p class='klik' onclick='ajaxGET(\"id=$id&akcija=editPro\", \"adm\")'>Izmena/dodavanje proizvoda</p>";
	$sadr.= "<p class='klik' onclick='ajaxGET(\"id=$id&akcija=editMeni\", \"adm\")'>Izmena/dodavanje stavki u meni</p>";
	$sadr.= "<p class='klik' onclick='ajaxGET(\"id=$id&akcija=editStr\", \"adm\")'>Izmena/dodavanje stranica</p>";
	$sadr.= "<p class='klik' onclick='ajaxGET(\"id=$id&akcija=editAnk\", \"adm\")'>Izmena/dodavanje stavki u anketu</p>";
	$sadr.= "<p class='klik' onclick='ajaxGET(\"id=$id&akcija=editKor\", \"adm\")'>Izmena/administriranje korisnika</p>";
	$sadr.= "<div class='contact_form'><div class='form_subtitle'>administriranje</div><div id='adm'>$ispis</div></div>";
	return $sadr;
}
function editMeni()
{
		$DBst = "select id, naziv, meni, msort from stranice";
		$DBstRez = mysql_query($DBst) or die($DBst.mysql_error());
		$imali = mysql_num_rows($DBstRez);
		
		if( $imali > 0) 
		{
		$sadr = "Stranicu: <select name='stranice' id='stranice'>";	$s2="";
			while(list($id, $naziv, $meni, $msort) = mysql_fetch_array($DBstRez))
			{
				$sadr .= "<option value='$id'>$naziv</option>";
				//$s1;
				if($meni == 0) $s2 .= "<option value='$id'>kao podmeni za: $naziv</option>";
			}
			global $model; 
			$id = $model['cntr']['id'];
			$sadr .= "</select><select name='stranice2' onChange='if(this.value != -2) ajaxGET(\"id=$id&akcija=updMeni&arg=\"+document.getElementById(\"stranice\").options[document.getElementById(\"stranice\").selectedIndex].value+\",\"+this.value+\",\", \"admP\")'>";
			$sadr .= "<option value='-2'>Izaberi Opciju</option><option value='-1'>Izbaci iz Menija</option><option value='0'>Dodaj u meni</option>";
			$sadr .= $s2."</select>";
			//$sadr .= "<span id='admMC' class='klik' onclick='ajaxGET(\"id=$id&akcija=updMeni&arg=\"+document.getElementById(\"stranice\").options[document.getElementById(\"stranice\").selectedIndex].value+\",,\", \"admP\")'>Ukloni</span>";
			
			
		}
		else $sadr = "Joj, ovde nema stranica!!";
		
		return $sadr;
}		

function updMeni($atr)
{
	list($pid, $pod, $por ) = explode(",",$atr);
	if($pod == "") $pod = -1;
	$upit = "UPDATE stranice SET meni='$pod', msort = '50' WHERE id = '$pid';";
	mysql_query($upit) or die(mysql_error().$upit);
	return "";
}

function addKat($arg)
{
	mysql_query("insert into kategorije values ('','$arg')");
	return "Dodali ste novu kategoriju";
}
function delKat($arg)
{
	if(mysql_num_rows(mysql_query("select * from proizvodi where id_kat = '$arg'")) == 0)
	mysql_query("Delete from kategorije where id ='$arg'");
	else return "Ne mozete obrisati kategoriju u kojoj ima proizvoda";
	return "Obrisali ste kategoriju";
}


function getPro($arg)
{
	
	$pro = mysql_fetch_array(mysql_query("select * from proizvodi where id = $arg"));
	
	return "	<br/>Naziv: <input type='text' name='nazivPro' value='".$pro['naziv']."'/>
				<br/>Slika: <input type='file' name='fajl' />
				<br/>Opis: <br/> <textarea name='opisPro'>".$pro['opis']."</textarea>
				<input type='hidden' name='idPro' value='".$pro['id']."'/>
				<br>Cena: <input type='text' name='cenaPro' value='".$pro['cena']."'/>
				<br/><input type='submit' name='akcija' value='addPro' />
	
	";

}

function addPro()
{
	$naziv = $_POST["nazivPro"];
	@$slika = $_FILES['fajl']['name'];
	if(isset($slika)) {prihvatiSlikuM();prihvatiSlikuV(); }
	$opis = $_POST["opisPro"];
	$id = $_POST["idPro"];
	$cena = $_POST["cenaPro"];
	$kategorija = $_POST["kategorija"];
	if($_POST['akcijaPro'] == -2) 
	{
		$upit = "insert into proizvodi values ('','$kategorija','$naziv','$opis','$slika','$cena','1')";
		mysql_query($upit);
		return listing("Dodali ste nov proizvod");

	}
	else
	{
	if($slika == "") $upit = "update proizvodi set id_kat='$kategorija', naziv='$naziv',opis='$opis' ,cena='$cena' where id = $id";
	else $upit = "update proizvodi set id_kat='$kategorija', naziv='$naziv',opis='$opis',slika='$slika',cena='$cena' where id = $id";
		mysql_query($upit);
		return listing("Proizvod je izmenjen $upit");
		

	}
	
}

function prihvatiSlikuM()
{

				$slika = $_FILES['fajl']['tmp_name'];	
				list($sirina, $visina) = getimagesize($slika);
				if ($visina > 90) {$nsirina = 90/$visina*$sirina; $nvisina=90;}
				else if($sirina > 100) {$nvisina = 100/$sirina*$visina; $nsirina=100;}
				else{$nsirina = $sirina; $nvisina=$visina;}
				
				$th = imagecreatetruecolor($nsirina,$nvisina);
				$iz = imagecreatefromjpeg($slika);
				imagecopyresized($th,$iz,0,0,0,0,$nsirina,$nvisina, $sirina, $visina);
				$nslika = $_FILES['fajl']['name'];
				imagejpeg($th,"pub/images/m/".$nslika);
				return $nslika;
}

function prihvatiSlikuV()
{
				$slika = $_FILES['fajl']['tmp_name'];	
				$nslika = $_FILES['fajl']['name'];
				move_uploaded_file($slika, "pub/images/v/".$nslika);
				return $nslika;
}


function editPro($arg = -1)
{
	global $model; 
	$id = $model['cntr']['id'];
	
	if($arg == -3)
	{
		$sadr = "<input type='text' id='nazivKat' /> <p class='klik' onclick='ajaxGET(\"id=$id&akcija=addKat&arg=\"+document.getElementById(\"nazivKat\").value, \"adm\")'>Dodaj Kategoriju</p> ";
	}
		
	else if($arg==-1)
	{
		$kat = mysql_query("select * from kategorije");
		$sadr = "<form method='POST' enctype='multipart/form-data' action='index.php?id=$id&action=addPro'> Izaberi kategoriju za proizvod: <br/><select name='kategorija' id='kategorija' onChange='if(this.value !=0)ajaxGET(\"id=$id&akcija=editPro&arg=\"+this.value, \"admeP\")'><option value=0>Izaberi Kategoriju</option><option value=-3> Nova Kategorija </option>";
	}
	else
	{
		$kat = mysql_query("select id, naziv from proizvodi where id_kat=$arg");
		$sadr = "<span id='admMC' class='klik' onclick='ajaxGET(\"id=$id&akcija=delKat&arg=\"+document.getElementById(\"kategorija\").options[document.getElementById(\"kategorija\").selectedIndex].value, \"adm\")'>Ukloni kategoriju ili</span>";
		$sadr .= "<select name='akcijaPro' onChange='if(this.value !=0)ajaxGET(\"id=$id&akcija=getPro&arg=\"+this.value, \"admeP2\")'><option value=0>Izaberi Proizvod</option><option value=-2> Nov Proizvod </option>";

	
	}

		while(list($idKat, $nazivKat) = mysql_fetch_array($kat))
		{
			$sadr .= "<option value='$idKat'>$nazivKat</option>";
		}
		$sadr .= "</select><span id='admeP'></span><span id='admeP2'></span>";

		
		return $sadr;
}		
	
function editStr()
{
		$DBst = "select id, naziv, meni, msort from stranice";
		$DBstRez = mysql_query($DBst) or die($DBst.mysql_error());
		$imali = mysql_num_rows($DBstRez);
		
		if( $imali > 0) 
		{
		$sadr = "Stranicu: <select name='stranice'>";	$s2="";
			while(list($id, $naziv, $meni, $msort) = mysql_fetch_array($DBstRez))
			{
				$sadr .= "<option value='$id'>$naziv</option>";
				//$s1;
				if($meni == 0) $s2 .= "<option value='$id'>kao podmeni za: $naziv</option>";
			}
			$sadr .= "</select><span id='admMC'><select name='stranice' onChange='ajaxGET(\"id=$id&akcija=proizvod\", \"admP\")'>";
			$sadr .= "<option value='-1'>Izbaci iz Menija</option><option value='0'>Dodaj u meni</option>";
			$sadr .= $s2."</select>";
			$sadr .= "<input type='text' ";
			
			
		}
		else $sadr = "Joj, ovde nema stranica!!";
		
		return $sadr;
}		

function editAnk()
{
		$DBst = "select id, naziv, meni, msort from stranice";
		$DBstRez = mysql_query($DBst) or die($DBst.mysql_error());
		$imali = mysql_num_rows($DBstRez);
		
		if( $imali > 0) 
		{
		$sadr = "Stranicu: <select name='stranice'>";	$s2="";
			while(list($id, $naziv, $meni, $msort) = mysql_fetch_array($DBstRez))
			{
				$sadr .= "<option value='$id'>$naziv</option>";
				//$s1;
				if($meni == 0) $s2 .= "<option value='$id'>kao podmeni za: $naziv</option>";
			}
			$sadr .= "</select><span id='admMC'><select name='stranice' onChange='ajaxGET(\"id=$id&akcija=proizvod\", \"admP\")'>";
			$sadr .= "<option value='-1'>Izbaci iz Menija</option><option value='0'>Dodaj u meni</option>";
			$sadr .= $s2."</select>";
			$sadr .= "<input type='text' ";
			
			
		}
		else $sadr = "Joj, ovde nema stranica!!";
		
		return $sadr;
}		

function editKor()
{
		$DBst = "select id, naziv, meni, msort from stranice";
		$DBstRez = mysql_query($DBst) or die($DBst.mysql_error());
		$imali = mysql_num_rows($DBstRez);
		
		if( $imali > 0) 
		{
		$sadr = "Stranicu: <select name='stranice'>";	$s2="";
			while(list($id, $naziv, $meni, $msort) = mysql_fetch_array($DBstRez))
			{
				$sadr .= "<option value='$id'>$naziv</option>";
				//$s1;
				if($meni == 0) $s2 .= "<option value='$id'>kao podmeni za: $naziv</option>";
			}
			$sadr .= "</select><span id='admMC'><select name='stranice' onChange='ajaxGET(\"id=$id&akcija=proizvod\", \"admP\")'>";
			$sadr .= "<option value='-1'>Izbaci iz Menija</option><option value='0'>Dodaj u meni</option>";
			$sadr .= $s2."</select>";
			$sadr .= "<input type='text' ";
			
			
		}
		else $sadr = "Joj, ovde nema stranica!!";
		
		return $sadr;
}		
		
?>