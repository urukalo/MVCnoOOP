<?php session_start();
global $model;
$model['conf'] = "conf/";
// ucitavanje konekcije i podesavanja
include ($model['conf'].'podesavanja.inc');
include ($model['conf'].'db.inc');


// angazovanje kontrolera
include ($model["cntr"]["kontroler"].'kontroler.inc');
//nesto kao konstruktor kontrolera
kontroler();


?>