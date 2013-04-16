var xmlHttp;
var prenos;

function GetXmlHttpObject()
{
	var xmlHttp=null;
	try	{ xmlHttp=new XMLHttpRequest(); }
	catch (e) {
		// Internet Explorer
		try { xmlHttp=new ActiveXObject("Msxml2.XMLHTTP"); }
		catch (e) { xmlHttp=new ActiveXObject("Microsoft.XMLHTTP"); }
	}
	return xmlHttp;
}


function ajaxGET(atr,ispis)
{ 
	prenos = ispis;
//alert(atr +"|"+ispis); 
	xmlHttp=GetXmlHttpObject()
	if (xmlHttp==null)	{alert ("Browser does not support HTTP Request"); return }
	var url="index.php?"
	url=url+atr
	url=url+"&ajax=1"
	url=url+"&sid="+Math.random()
	xmlHttp.onreadystatechange=stateChanged
	xmlHttp.open("GET",url,true)
	xmlHttp.send(null)
}

function stateChanged() 
{ 
	if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
	{ 
		document.getElementById(prenos).innerHTML=xmlHttp.responseText;
		initLightbox();
	} 
}

