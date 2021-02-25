window.onload=function(){
	document.getElementById("estado").addEventListener("change",cambioEstado);
}

function cambioEstado(){
	var xhttp = new XMLHttpRequest();
	id = document.getElementById("estado").value;
	xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
		document.getElementById("municipio").innerHTML = xhttp.responseText;
			    }
	};
	xhttp.open("GET", "assets/php/estado.php?id="+id, true);
	xhttp.send();
}