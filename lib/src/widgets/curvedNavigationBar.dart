import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({super.key});

  @override
  _NavigationBarWidgetState createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      color: const Color.fromARGB(255, 255, 8, 0),
      backgroundColor: const Color.fromARGB(255, 11, 9, 30),
      
      key: _bottomNavigationKey,
      items: const <Widget>[
        Icon(Icons.home, size: 40,color: Colors.white,),
        Icon(Icons.person, size: 40,color: Colors.white),
        Icon(Icons.exit_to_app_sharp, size: 40,color: Colors.white),
      ],
      onTap: (index) {
        setState(() {
          _page = index;
        });
        // Hacer algo según el icono seleccionado
        switch (_page) {
          case 0:
            print('Estás en la pantalla de Home');
            break;
          case 1:
            print('Estás en la pantalla de Shop');
            break;
          case 2:
            print('Has salido de la aplicación');
            break;
          default:
            print('Índice no reconocido');
        }
      },
    );
  }
}