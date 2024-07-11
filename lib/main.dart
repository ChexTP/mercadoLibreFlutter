import 'package:app_mercado_libre/MenuPrincipal.dart';
import 'package:flutter/material.dart';

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
 