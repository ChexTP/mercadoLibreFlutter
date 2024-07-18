import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:mercado_libre_app/src/models/categories.dart';

import 'package:mercado_libre_app/src/routers/app_routes.dart';

class NavigationBarWidget extends StatefulWidget {
  final User userData;

  const NavigationBarWidget({super.key, required this.userData});

  @override
  _NavigationBarWidgetState createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      items: const <Widget>[
        Icon(Icons.home, size: 40, color: Colors.white),
        Icon(Icons.person, size: 40, color: Colors.white),
        Icon(Icons.exit_to_app_sharp, size: 40, color: Colors.white),
      ],
      color: const Color.fromARGB(255, 255, 8, 0),
      backgroundColor: const Color.fromARGB(255, 11, 9, 30),
      index: _page,
      onTap: (index) {
        setState(() {
          _page = index;
        });

        // Hacer algo según el icono seleccionado
        switch (_page) {
          case 0:
            Navigator.of(context).pushNamed( AppRoutes.home, arguments: widget.userData);
            print('en pagina menu');
            
          case 1:
            Navigator.of(context).pushNamed(AppRoutes.profilePage, arguments: widget.userData);
            print('en pagina profile');
            
          case 2:
            print('Has salido de la aplicación');
            
          default:
            print('Índice no reconocido');
        }
      },
      
    );
  }
}
