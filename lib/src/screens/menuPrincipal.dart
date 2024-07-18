
import 'package:flutter/material.dart';
import 'package:mercado_libre_app/src/models/categories.dart';
import 'package:mercado_libre_app/src/widgets/gridCardCustom.dart';
import 'package:mercado_libre_app/src/widgets/searchBar.dart';

class MenuPrincipal extends StatefulWidget {
  final User userData;
  const MenuPrincipal({super.key, required this.userData});

  @override
  State<MenuPrincipal> createState() => _MenuPrincipalState();
}

class _MenuPrincipalState extends State<MenuPrincipal> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 11, 9, 30),
      // appBar: AppBarCustom(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SearchBarCustom(),
            // SizedBox(height: 10,),
            GridCardCustom(),
          ],
        ),
      ),
      // bottomNavigationBar: NavigationBarWidget(userData: widget.userData),
    );
  }
}
