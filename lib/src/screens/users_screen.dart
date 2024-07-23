import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mercado_libre_app/src/controllers/controllers_user.dart';
import 'package:mercado_libre_app/src/models/user_api_model.dart';
import 'package:mercado_libre_app/src/widgets/text_input_profile.dart';

class UsersListScreen extends StatelessWidget {
  const UsersListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 11, 9, 30),
      body: FutureBuilder<List<UserApi>>(
        future: getAllUser(),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else if(snapshot.hasError){
            return Center(child: Text('Error: ${snapshot.error}'),);
          }
          else if(!snapshot.hasData|| snapshot.data!.isEmpty){
            return const Center(child: Text('No users found'),);
          }
          else{
            return Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index){
                  UserApi user = snapshot.data![index];
                  return Card(
                    color:const Color.fromARGB(255, 155, 51, 47),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: InkWell(
                      splashColor:const Color.fromARGB(255, 144, 80, 68),
                      onTap: (){},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: CircleAvatar(
                                radius: 60,
                                backgroundImage: user.image != null
                                  ? NetworkImage(user.image!)
                                  : null,
                                child: user.image == null
                                  ? Icon(Icons.person, size: 80)
                                  : null,)),
                            const SizedBox(height: 15,),
                            TextInputProfile(title: 'Nombre', value: user.name),                          
                            const SizedBox(height: 5,),                          
                            TextInputProfile(title:"Documento",value: user.document),
                            const SizedBox(height: 5,),
                            TextInputProfile(title:"Email",value: user.email),
                            const SizedBox(height: 5,),
                            TextInputProfile(title:"Fecha de nacimiento",value: DateFormat('MM/dd').format(user.birthday)),
                            const SizedBox(height: 5,),
                            TextInputProfile(title:"Genero",value: user.gender),
                            const SizedBox(height: 5,),
                            TextInputProfile(title:"Numero telefonico",value: user.phone),                          
                          ],
                        ),
                      ),
                    ),
                  );
                  
                },
              ),
            );
          }

        },
        ),
    );
  }
}

