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

}

 ?>