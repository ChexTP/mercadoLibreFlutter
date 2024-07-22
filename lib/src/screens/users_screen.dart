import 'package:flutter/material.dart';
import 'package:mercado_libre_app/src/controllers/controllers_user.dart';
import 'package:mercado_libre_app/src/models/user_api_model.dart';

class UsersListScreen extends StatelessWidget {
  const UsersListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
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
            return Center(child: Text('No users found'),);
          }
          else{
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index){
                UserApi user = snapshot.data![index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                );
                
              },
            );
          }

        },
        ),
    );
  }
}