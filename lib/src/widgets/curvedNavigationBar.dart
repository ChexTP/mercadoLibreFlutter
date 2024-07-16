import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

int _page = 0;
GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

CurvedNavigationBar curvedNavigatioBar() {
    return CurvedNavigationBar(
      color:const  Color.fromARGB(255, 255, 8, 0),
      backgroundColor:const Color.fromARGB(255, 11, 9, 30) ,
      key: _bottomNavigationKey,
      items: const <Widget>[
        Icon(Icons.home, size: 40),
        Icon(Icons.shop, size: 40),
        Icon(Icons.exit_to_app_sharp, size: 40),
      ],
      onTap: (index) {
        setState(() {
          _page = index;
        });
        // Hacer algo segun el icono seleccionado
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
      });
  }