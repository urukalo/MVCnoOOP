<?php 
$dbServer = "sql203.0fees.net";
$dbKorisnik = "fees0_11925937";
$dbLozinka = "****";
$dbBaza = "fees0_11925937_urukalo";

$kon = mysql_connect($dbServer, $dbKorisnik, $dbLozinka) or die(" Konekcija nije uspela ".mysql_error());
$db = mysql_select_db($dbBaza, $kon) or die(" Selekcija baze nije uspela ".mysql_error());

?>
