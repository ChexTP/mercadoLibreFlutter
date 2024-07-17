import 'package:flutter/material.dart';

final List<Map<String, dynamic>> categories = [
  {'codigo': '001', 'icono': Icons.home, 'titulo': 'Hogares y muebles'},
  {'codigo': '002', 'icono': Icons.phone_android, 'titulo': 'Celulares'},
  {'codigo': '003', 'icono': Icons.checkroom, 'titulo': 'Ropa y accesorios'},
  {'codigo': '004', 'icono': Icons.computer, 'titulo': 'Computación'},
  {'codigo': '005', 'icono': Icons.kitchen, 'titulo': 'Electro Hogar'},
  {'codigo': '006', 'icono': Icons.sports_soccer, 'titulo': 'Deportes'},
  {'codigo': '007', 'icono': Icons.build, 'titulo': 'Herramientas'},
  {'codigo': '008', 'icono': Icons.brush, 'titulo': 'Belleza'},
  {'codigo': '009', 'icono': Icons.tv, 'titulo': 'Electrónica y audio'},
  {'codigo': '010', 'icono': Icons.fastfood, 'titulo': 'Alimentos y bebidas'},
  {'codigo': '011', 'icono': Icons.pets, 'titulo': 'Animales y mascotas'},
];

class User{
  final String name;
  final String password;

  User({required this.name, required this.password});
}