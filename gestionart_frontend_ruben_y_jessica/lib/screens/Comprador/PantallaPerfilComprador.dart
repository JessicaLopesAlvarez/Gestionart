import 'package:flutter/material.dart';
import 'package:gestionart_frontend_ruben_y_jessica/config/common/resources/app_colores.dart';
import 'package:gestionart_frontend_ruben_y_jessica/config/common/resources/app_estilo_texto.dart';
import 'package:gestionart_frontend_ruben_y_jessica/models/Comprador.dart';
import 'package:gestionart_frontend_ruben_y_jessica/widgets/dialogs/dialogoCambiarContrasena.dart';

class Pantallaperfilcomprador extends StatefulWidget {
  const Pantallaperfilcomprador({super.key, required this.comprador});
  final Comprador comprador;
  @override
  State<Pantallaperfilcomprador> createState() => _PantallaperfilcompradorState();
}

class _PantallaperfilcompradorState extends State<Pantallaperfilcomprador> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColores.colorPrimario,
        flexibleSpace: Center(
          child: Text(
            "MI PERFIL",
            style: AppEstiloTexto.encabezado,
          ),
        ),
      ),
      body: Container(
        alignment: AlignmentGeometry.center,
        child: SizedBox(
          width: 400,
          child: Column(
            children: [
              SizedBox(
                child: widget.comprador.imagen != "" || widget.comprador.imagen != null
                  ? Image.network(widget.comprador.imagen!)
                  : Image.asset('assets/images/defaultUser.jpg')
              ),
              SizedBox(height: 20,),
              Text(widget.comprador.nombre, style: AppEstiloTexto.textoPrincipal,),
              SizedBox(height: 20,),
              Text(widget.comprador.correoElectronico, style: AppEstiloTexto.textoPrincipal,),
              SizedBox(height: 20,),
              Text(widget.comprador.direccion, style: AppEstiloTexto.textoPrincipal,),
              SizedBox(height: 20,),
              TextButton(
                onPressed: (){
                  DialogoCambiarContrasena(context);
                }, 
                child: Text("¿Quieres cambiar tu contraseña?")
              ),
              SizedBox(height: 20,)


            ],
          ),
        ),
      ),
    );
  }
}