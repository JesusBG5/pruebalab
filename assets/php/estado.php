<?php 

require_once("conexion.php");

class Estado extends Conexion{

	public function consultar(){
		$this->sentencia = "SELECT * FROM estado";
		$res = $this->obtenerSentencia();
		$resultado = "";
		while($fila=$res->fetch_assoc()){
			$resultado.="<option value='".$fila["kcveestado"]."'>".$fila["onombre"]."</option>";
		}
		$this->cerrarConexion();
		return $resultado;
	}

	public function cargarMunicipio($id){
		$this->sentencia = "SELECT * FROM municipio WHERE rcveestado=$id";
		$res = $this->obtenerSentencia();
		$resultado = "";
		while($fila=$res->fetch_assoc()){
			$resultado.="<option value='".$fila["kcvemunicipio"]."'>".$fila["onombre"]."</option>";
		}
		$this->cerrarConexion();
		echo $resultado;	
	}

}

if($_GET["id"]){
	$obj = new Estado();
	$obj->cargarMunicipio($_GET["id"]);
}

 ?>