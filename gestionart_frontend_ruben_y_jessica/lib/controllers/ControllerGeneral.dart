import 'package:gestionart_frontend_ruben_y_jessica/services/LogicaComprador.dart';

class ControllerGeneral {
  static bool nombreEnUso(String nombre){
    bool esta=false;
    LogicaComprador.getListaCompradores().forEach((comprador){
      if(comprador.getNombre()==nombre ){
        esta= true;
      }
    });
    return esta;
  }
  static bool emailEnUso(String email){
    bool esta=false;
    LogicaComprador.getListaCompradores().forEach((comprador){
      if(comprador.getCorreoElectronico()==email ){
        esta= true;
      }
    });
    return esta;
  }
}