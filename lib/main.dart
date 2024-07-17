
import 'package:flutter/material.dart';
import 'package:mercado_libre_app/src/models/categories.dart';
import 'package:mercado_libre_app/src/routers/app_routes.dart';
import 'package:mercado_libre_app/src/screens/LoginScreen.dart';
import 'package:mercado_libre_app/src/screens/menuPrincipal.dart';

void main(List<String> args) {
  runApp(const ProyectoMercadoLibre());
}

class ProyectoMercadoLibre extends StatelessWidget {
  const ProyectoMercadoLibre({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Loginscreen(),

      onGenerateRoute: (settings){
        switch (settings.name) {
          case AppRoutes.home:
           if (settings.arguments != null && settings.arguments is User) {
              return MaterialPageRoute(
                builder: (context) => MenuPrincipal(userData: settings.arguments as User),
              );
            } else {
              // Manejar el caso donde settings.arguments es null o no es de tipo User
              return MaterialPageRoute(builder: (context) => const Loginscreen());
            }            
            
          default:
            return MaterialPageRoute(builder: (context)=>const Loginscreen());
        }
      },
    );
  }
}
 