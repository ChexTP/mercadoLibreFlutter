import 'package:flutter/material.dart';
import 'package:mercado_libre_app/src/models/categories.dart';
import 'package:mercado_libre_app/src/widgets/modal_update_user.dart';

class Profilescreen extends StatelessWidget {
  final User userData;

  const Profilescreen({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 11, 9, 30),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 120.0),
          child: Container(
            child: Column(
              children: [
                const SizedBox(height: 30.0,),
                ElevatedButton(
                  onPressed: () {
                    // Mostrar el modal para registrar un nuevo usuario
                    showUpdateUserModal(
                      context,
                      isUpdate: false,  // Modo registro
                      onUpdate: _refreshUsers, // Callback para refrescar la lista de usuarios
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.all(8),
                    minimumSize: const Size(350, 53),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text("Registrar Nuevo Usuario"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _refreshUsers() {
    // Implementa la lógica para refrescar la lista de usuarios después de registrar uno nuevo
  }
}
