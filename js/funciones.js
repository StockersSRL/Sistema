var xmlHttp = createXmlHttpRequestObject();

function createXmlHttpRequestObject(){
    var xmlHttp;
    if(window.XMLHttpRequest){
        xmlHttp = new XMLHttpRequest();
        return xmlHttp;
    }else{
        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
        return xmlHttp;
    }
}

    
function suggestNames(){
    if(xmlHttp){
        var pista = document.getElementById("s-nombre").value;
        if(pista!=''){
            try {
                xmlHttp.open("GET","suggestNames.php?q="+pista,true);
                xmlHttp.onreadystatechange = function(){
                    var div = document.getElementById('suggestName');
                    if(xmlHttp.readyState == 4 && xmlHttp.status==200){
                        text = xmlHttp.responseText;
                        if(text!="<ul></ul>"){
                            div.style = '';
                            div.innerHTML=text;
                        }else{
                            var div = document.getElementById('suggestName');
                            div.innerHTML = '';
                            div.style.display = 'none';
                        }
                    }else {
                        xmlHttp.statusText;
                    }
                };
                xmlHttp.send(null);
            }catch (e){
                alert(e.toString());
            }
        }else{
            var div = document.getElementById('suggestName');
            div.innerHTML = '';
            div.style.display = 'none';
        }
    }
}

function hide(){
    var div = document.getElementById('suggestName');
    div.innerHTML = '';
    div.style.display = 'none';  
}

function getNombre(str){
    var textBox = document.getElementById("s-nombre");
    textBox.value = str;
    var div = document.getElementById('suggestName');
    div.innerHTML = '';
    div.style.display = 'none';  
}

    
