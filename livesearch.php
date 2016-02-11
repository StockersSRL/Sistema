<?php
$xmlDoc=new DOMDocument();
$xmlDoc->load("nombres.xml");

$nombres=$xmlDoc->getElementsByTagName('nombre');
//get the q parameter from URL
$q=$_GET["q"];

//lookup all links from the xml file if length of q>0
if (strlen($q)>0) {
  $hint="";
  for($i=0; $i<($nombres->length); $i++) {
    $aTitle=$nombres->item($i)->getElementsByTagName('title');
//    $aURL=$nombres->item($i)->getElementsByTagName('url');
    if ($aTitle->item(0)->nodeType==1) {
      //find a link matching the search text
      if (stristr($aTitle->item(0)->childNodes->item(0)->nodeValue,$q)) {
          $hint=$hint . "<span onclick='setSearch(this.innerHTML);' class='dropdown-suggest' target='_blank'>" .
          trim($aTitle->item(0)->childNodes->item(0)->nodeValue) . "</span>";
      }
    }
  }
}

// Set output to "no suggestion" if no hint was found
// or to the correct values
if ($hint=="") {
  $response="no suggestion";
} else {
  $response=$hint;
}

//output the response
echo $response;
?> 