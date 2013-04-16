<?php
	function kontroler()	//ovde kupimo podatke od korisnika i angazujemo model 
	{	
		global $model;
		// provera login podataka
		if(isset($_SESSION["uloga"])) $uloga = $_SESSION["uloga"];
		else {$uloga = 100; $_SESSION["uloga"] = $uloga;}
		$model["cntr"]["uloga"]=$uloga;
		
		// uzimanje id-a stranice
		if(!isset($_GET['id'])) $id = 1;
		else $id = $_GET['id'];
		//malo sigurnosti
		if(!preg_match("/^[0-9]+$/", $id)) $id = 1;
		$model['cntr']['id']=$id;

		//prolaz za ajax - u slucaju da se pristupa preko ajaxa onda preskacemo heder/footer i ostale nepotrebne elemente
		if(!isset($_GET['ajax'])) $model["cntr"]["ajax"] = 0;
		else $model["cntr"]["ajax"]=1;

		//uvoz funkcija iz glavnog modela
		include ($model["cntr"]["model"].'model.inc');
		//startovanje modela - nesto kao konstruktor
		model($id);

		
		//startovanje view-a
		include ($model["cntr"]["prikaz"].'prikaz.inc');
		prikaz();
	
		
	}
?>