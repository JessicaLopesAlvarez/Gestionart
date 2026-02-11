import 'package:gestionart_frontend_ruben_y_jessica/models/Comprador.dart';
import 'package:gestionart_frontend_ruben_y_jessica/services/LogicaComprador.dart';
class Controllercomprador {
  static bool compradorExiste(String nombre, String contrasena){
    bool esta = false;
    LogicaComprador.getListaCompradores().forEach((comprador)
    {
      if(comprador.getNombre()==nombre && comprador.getContrasena()==contrasena ){
        esta=true;
      }
    });
    return esta;
  }
  static Comprador? extraerComprador(String nombre, String contrasena){
    for (var i = 0; i < LogicaComprador.getListaCompradores().length; i++) {
      if(LogicaComprador.getListaCompradores()[i].getNombre()==nombre && LogicaComprador.getListaCompradores()[i].getContrasena()==contrasena){
        return LogicaComprador.getListaCompradores()[i];
      }
    }
    return null;
  }
}