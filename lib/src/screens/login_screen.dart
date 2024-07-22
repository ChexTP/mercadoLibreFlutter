import 'package:flutter/material.dart';
import 'package:mercado_libre_app/src/screens/main_layout.dart';
import 'package:mercado_libre_app/src/models/categories.dart';

class Loginscreen extends StatefulWidget {

  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  var _obscureText = true;

  final _formKey = GlobalKey<FormState>();
  String _name = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 255, 8, 0),
            height: double.infinity,
            width: double.infinity,
            ),
          Positioned(
            right: 90,
            top: 70,
            child: Image.asset('assets/luffy.png',
              scale: 15,),
            // left: 0,
            ),
          Padding(
            padding: const EdgeInsets.only(top: 320),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                color:Color.fromARGB(255, 11, 9, 30) ,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60)
                )
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 60.0,vertical: 40.0),
                  child: Center(
                    child: Form(
                      key:_formKey,
                      child: Column(
                        children: [
                          const Text(
                            "Bienvenido a Mercado Libre Col",
                            style: TextStyle(color:Colors.white,fontSize: 22),),
                          const SizedBox(height: 10,),
                          const Text(
                            "Iniciar sesion",
                            style: TextStyle(color: Colors.white,fontSize: 30)),
                          const SizedBox(height: 20,),
                          TextFormField(
                            onChanged: (value) {
                              _name=value;
                            },
                            style: const TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Nombre",
                              labelStyle: const TextStyle(
                                backgroundColor: Colors.white,
                                fontSize: 15,
                                color: Color.fromARGB(255, 255, 8, 0),
                                fontWeight: FontWeight.w700,
                                ),
                              hintStyle: const TextStyle(fontSize: 15),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(color: Color.fromARGB(255, 255, 8, 0), width: 2.0), // Color del borde cuando está en foco
                              ),
                              errorStyle:const  TextStyle(
                                color: Colors.red,
                                fontStyle: FontStyle.italic,
                                fontSize: 14.0)
                            ),
                            validator: (value) {
                              if(value == null || value.isEmpty){
                                return "Nombre requerido";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10,),
                          TextFormField(
                            onChanged: (value) {
                              _password=value;
                            },
                            style: const TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Contraseña",
                              labelStyle: const TextStyle(
                                backgroundColor: Colors.white,
                                fontSize: 15,
                                color: Color.fromARGB(255, 255, 8, 0),
                                fontWeight: FontWeight.w700,
                                ),
                              hintStyle: const TextStyle(fontSize: 16),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(color: Color.fromARGB(255, 255, 8, 0), width: 2.0), // Color del borde cuando está en foco
                              ),
                              errorStyle:const  TextStyle(
                                color: Colors.red,
                                fontStyle: FontStyle.italic,
                                fontSize: 14.0),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState((){
                                    _obscureText = !_obscureText;
                                  });
                                },
                                child: Icon(
                                  _obscureText?Icons.visibility_off_outlined:Icons.visibility_outlined
                                ),
                              )
                            ),
                            obscureText: _obscureText,
                            
                            validator: (value) {
                              if(value == null || value.isEmpty){
                                return "Contraseña requerida";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 8,),
                          Container(
                            alignment: Alignment.centerRight,
                            child: const Text(
                              "Restablecer Contraseña",
                              style: TextStyle(
                                color:Colors.white,
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white),)),
                          const SizedBox(height: 20,),
                          ElevatedButton(
                            style:ElevatedButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 20),
                              foregroundColor: Colors.white,
                              backgroundColor: const Color.fromARGB(255, 255, 8, 0),
                              padding: const EdgeInsets.all(8),
                              minimumSize: const Size(350, 53),
                              shape:RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  // Suponiendo que tienes una instancia de User llamada userData con los datos correctos
                                  User userData = User(name:_name, password: _password);

                                  // Navegación con transición Slide desde la derecha
                                  Navigator.of(context).pushReplacement(
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation, secondaryAnimation) => MainScreen(userData: userData),
                                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                        const begin = Offset(1.0, 0.0);
                                        const end = Offset.zero;
                                        const curve = Curves.ease;
                                        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                        var offsetAnimation = animation.drive(tween);

                                        return SlideTransition(
                                          position: offsetAnimation,
                                          child: child,
                                        );
                                      },
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Credenciales incorrectas')),
                                  );
                                }
                              },

                            child: const Text('Ingresar'),
                          ), 
                            
                          const SizedBox(height: 10,),
                          const Text(
                            "O inicia sesion con",
                            style: TextStyle(color:Colors.white,fontSize: 22)),
                          const SizedBox(height: 10,),
                          InkWell(
                            onTap: (){
                              print('clik en loguear de facebook');
                            },
                            child: Container(
                              width: 330, 
                              height: 60,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: const Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(Icons.facebook,size: 40.0,),
                                  Text(
                                    'Logeate con facebook',
                                    style: TextStyle(fontSize: 18))
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10,),                           
                          InkWell(
                            onTap: (){
                              print('clik en loguear de google');
                            },
                            child: Container(
                              width: 330, 
                              height: 60,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: const Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(Icons.g_mobiledata_outlined,size: 40.0,),
                                  Text(
                                    'Logeate con google',
                                    style: TextStyle(fontSize: 18))
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 15,),                           
                          const Text(
                            'Registrate',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white,
                              decorationThickness: 1.5
                            ),)
                          
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          
        
        ],
    ));
  }
}