import 'package:flutter/material.dart';
import 'package:mercado_libre_app/src/models/categories.dart';
import 'package:mercado_libre_app/src/widgets/InputProfile.dart';


class Profilescreen extends StatelessWidget {
  final User userData;
  const Profilescreen({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 11, 9, 30),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0,vertical: 120.0),
          child: Container(
            // height: 500,
            // width: 400,
            // decoration: const BoxDecoration(
            //   color: Colors.white54
            // ),
            child: Column(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 70.0,
                  child: Icon(Icons.person,size: 100.0,),
                ),
                const SizedBox(height: 30.0,),
                InputProfile(userData.name,Icons.person_2,"Nombre"),
                const SizedBox(height: 30.0,),
                InputProfile("Mujer",Icons.female,"Genero"),
                const SizedBox(height: 30.0,),
                InputProfile("13/06",Icons.cake,"Cupleaños"),
                const SizedBox(height: 30.0,),
                InputProfile("311 311 33 11",Icons.phone_android_rounded,"Telefono"),
                const SizedBox(height: 30.0,),
                ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.white,
                              padding: const EdgeInsets.all(8),
                              minimumSize: const Size(350, 53),
                              shape:RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text("Cambiar contraseña"))
                                   
              ],
            ),
          ),
        ),
      ),
    );
  }

  
}
