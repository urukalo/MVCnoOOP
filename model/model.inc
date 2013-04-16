<?php
	
	function model($id) //prikupljanje univerzalnih podataka za svaku stranicu
	{
		global $model;
		
		//uzimanje stranice iz baze
		$model["str"] = dajStranu($id);
		//uzimanje imaginarne 404 stranice, za svaki slucaj
		$model["404"] = dajStranu($model["cntr"]["nemaID"]);
		//uzimanje elemenata na stranici - svaka stranica moze da ima zasebne elemente
		// oni se naknadno ucitavaju u okviru stranice, tamo gde su potrebni 
		//i omogucavaju direktan pristup ajax-om
		$model["elm"] = dajElemente($id);
		//dodavanje menija i desne strane na svaku stranicu
		//$model["elm"]['meni'] = dajElemente(7);
		//$model["elm"]['desno'] = dajElemente(11);
		
		//print_r($model); //za debagovanje
		
		//hvatanje logovanja
		if(isset($_GET['pristupi']))
		{
			login();
		}
		
		
		
	}

	function login()
	{
		$log = mysql_query("select u.uloga as uloga from login, uloga u where id_uloge=u.id and ime=".$_GET['ime']." and pass=".$_GET['pass']);
		if(mysql_num_rows($log) == 1)
		{
			$_SESSION['uloga'] = $log[0];
		}
	}
	
	
	
	function dajStranu($id)
	{
		global $model;
		
		$DBst = "select * from stranice where id = $id and uloga > ".$_SESSION["uloga"];
		$DBstRez = mysql_query($DBst) or die($DBst.mysql_error());
		if(mysql_num_rows($DBstRez) != 1) return dajStranu(1);	
		$strana = mysql_fetch_array($DBstRez);
		$strana['slink']=$model["cntr"]["model"].$strana['link'].".php";
		$strana['link']=$model["cntr"]["template"].$strana['link'].".php";
		
		if(file_exists($strana['slink'])) 
			include($strana['slink']); //ako postoji model za stranicu
		return $strana;
	}

	function dajElemente($id)
	{
		$DBst = "select elm_id, link as naziv from elementi, stranice where elm_id = id and str_id = $id";
		$DBstRez = mysql_query($DBst) or die($DBst.mysql_error());
		while($elm_id = mysql_fetch_array($DBstRez))
		{
			$m_elm[$elm_id['naziv']] = dajStranu($elm_id['elm_id']);
			$m_elm[$elm_id['naziv']]['elm'] = dajElemente($elm_id['elm_id']);
		}
		
		if(!isset($m_elm)) $m_elm = null;
		
		return $m_elm;
	}
	
	function dajMeni($id)
	{
		$meni = "";
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
				list($id, $naziv) = mysql_fetch_array($DBstRez1);
				$meni .= "<li><a href='?id=$id'>$naziv</a></li>";
				dajMeni($id_str);
			}
			$meni .= "</ul>";
		}
		return $meni;
	}
?>