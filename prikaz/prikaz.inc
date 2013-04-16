<?php 
	function prikaz() //konstruktor za view - postavlja osnovne elemente na stranicu
	{
		global $model;
		//print_r($model);
		if($model['cntr']['ajax'] == 0) //prolaz za ajax
		{
			include ($model["cntr"]["template"]."heder.php");
			_include($model['elm']['meni']); //zbog lakseg punjenja podacima
		}			
		//pakovanje stranice
		_include($model['str']);

		
		
		if($model['cntr']['ajax'] == 0) 
		{
			_include($model['elm']['desno']);
			include ($model["cntr"]["template"]."footer.php");
		}
	}
	
	function _include($data)
	{
		global $model;		
		if(!file_exists($data['link']))
		{				
			$tmp = $data;
			$data = $model["404"];
			$data["info"] = $tmp;
		}
		
		include($data['link']); //ucitavanje stranice 
		//unutar stranice moze da se pristupa $data nizu - specificni podaci za stranicu
		// i $model nizu - globalni podaci za citav sajt
	}	
?>