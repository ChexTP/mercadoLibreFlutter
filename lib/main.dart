
import 'package:flutter/material.dart';
import 'package:mercado_libre_app/src/screens/login_screen.dart'; // Asegúrate de importar tu modelo User
// Ajusta la ruta según la ubicación de tu MainScreen

void main(List<String> args) {
  runApp(const ProyectoMercadoLibre());
}

class ProyectoMercadoLibre extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const ProyectoMercadoLibre({Key? key});

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Loginscreen()
    );
  }
}
