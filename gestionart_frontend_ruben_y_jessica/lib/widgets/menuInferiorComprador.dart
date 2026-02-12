import 'package:flutter/material.dart';
import 'package:gestionart_frontend_ruben_y_jessica/config/common/resources/app_colores.dart';
import 'package:gestionart_frontend_ruben_y_jessica/config/common/resources/app_estilo_texto.dart';

BottomNavigationBar menuInferiorComprador(int index) {
  return BottomNavigationBar(
    currentIndex: index,
    //Menú de navegación inferior para el comprador
    selectedItemColor: AppColores.colorPrimario,
    unselectedItemColor: AppColores.colorDesactivado,
    showUnselectedLabels:
        true, //Asi muestro los labels de losbotones no seleccionados
    selectedLabelStyle: AppEstiloTexto
        .textoPrincipal, // Con esto y el de abajo forzamos que se vea el label (El texto que identifica a los iconos ya sea que esté seleccionado o no)
    unselectedLabelStyle: AppEstiloTexto.textoSecundario,
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
      BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Ajustes'),
      BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'Pedidos'),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
    ],
  );
}
