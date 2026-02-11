import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gestionart_frontend_ruben_y_jessica/config/common/resources/app_colores.dart';
import 'package:gestionart_frontend_ruben_y_jessica/config/common/resources/app_estilo_texto.dart';
import 'package:gestionart_frontend_ruben_y_jessica/config/common/resources/app_estilo_botones.dart';
import 'package:gestionart_frontend_ruben_y_jessica/config/common/utils/CameraGalleryService.dart';
import 'package:gestionart_frontend_ruben_y_jessica/config/common/utils/validators/Validators.dart';
import 'package:gestionart_frontend_ruben_y_jessica/screens/Comprador/PantallaInicioComprador.dart';
import 'package:gestionart_frontend_ruben_y_jessica/screens/PantallaInicioSesion.dart';

class PantallaregistroComprador extends StatefulWidget {
  const PantallaregistroComprador({super.key});

  @override
  State<PantallaregistroComprador> createState() =>
      _PantallaregistroCompradorState();
}

class _PantallaregistroCompradorState extends State<PantallaregistroComprador> {
  final _formKey = GlobalKey<FormState>();
  String _nombre = "";
  String _direccion = "";
  String _correoElectronico = "";
  String _contrasena = "";
  String _contrasena2 = "";
  String? photoPath = "";
  
  void _validarComprador(){
    final isFormValid = _formKey.currentState!.validate();
    if(isFormValid){
      Navigator.pop(context);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColores.colorPrimario,
        flexibleSpace: Center(
          child: Text(
            "¡ REGISTRATE EN GESTIONART !",
            style: AppEstiloTexto.encabezado,
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 20),
                SizedBox(
                  width: 400,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Nombre",
                      labelStyle: AppEstiloTexto.textoPrincipal,
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => Validators.validateName(value),
                    onChanged: (value) => _nombre = value,
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 400,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Dirección",
                      labelStyle: AppEstiloTexto.textoPrincipal,
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => Validators.validateDireccion(value),
                    onChanged: (value) => _direccion = value,
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 400,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Correo electronico",
                      labelStyle: AppEstiloTexto.textoPrincipal,
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => Validators.validateEmail(value),
                    onChanged: (value) => _correoElectronico = value,
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 400,
                  child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Contraseña",
                      labelStyle: AppEstiloTexto.textoPrincipal,
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => Validators.validateEmpty(value),
                    onChanged: (value) => _contrasena = value,
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 400,
                  child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Repita la contraseña",
                      labelStyle: AppEstiloTexto.textoPrincipal,
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => Validators.validatePassword(value, _contrasena),
                    onChanged: (value) => _contrasena2 = value,
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  child: photoPath != ""
                      ? kIsWeb
                            ? Image.network(photoPath!, fit: BoxFit.fill)
                            : Image.file(File(photoPath!), fit: BoxFit.fill)
                      : Container(),
                ),
                SizedBox(
                  width: 400,
                  child: Row(
                    children: [
                      Text(
                        "Añadir imagen",
                        style: AppEstiloTexto.textoSecundario,
                      ),
                      SizedBox(width: 20),
                      ElevatedButton(
                        child: const Icon(Icons.image),
                        onPressed: () async {
                          final path = await CameraGalleryService()
                              .selectPhoto();
                          if (path == null) return;
                          photoPath = path;
                          setState(() {});
                        },
                      ),
                      ElevatedButton(
                        child: const Icon(Icons.camera_alt),
                        onPressed: () async {
                          final path = await CameraGalleryService().takePhoto();
                          if (path == null) return;
                          photoPath = path;
                          setState(() {});
                        },
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                photoPath = "";
                              });
                            },
                            icon: Icon(Icons.delete_outline),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 400,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: AppEstiloBotones.botonPrincipal,
                        onPressed: () {
                          _validarComprador();
                        },
                        child: Text(
                          "Resgistrarme",
                          style: AppEstiloTexto.textoPrincipal,
                        ),
                      ),
                      ElevatedButton(
                        style: AppEstiloBotones.botonPrincipal,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const Pantallainiciosesion(),
                            ),
                          );
                        },
                        child: Text(
                          "Cancelar",
                          style: AppEstiloTexto.textoPrincipal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
