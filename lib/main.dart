
import 'package:flutter/material.dart';
import 'package:mercado_libre_app/src/screens/menuPrincipal.dart';

void main(List<String> args) {
  runApp(const ProyectoMercadoLibre());
}

class ProyectoMercadoLibre extends StatelessWidget {
  const ProyectoMercadoLibre({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MenuPrincipal(),
    );
  }
}
 