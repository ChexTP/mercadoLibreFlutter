import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:mercado_libre_app/src/models/user_api_model.dart';
import 'dart:convert';

Future<List<UserApi>> getAllUser() async {
  try {
    final response = await http.get(Uri.parse('https://backfluttertest.onrender.com/api/user/users'));
    if (response.statusCode == 201) {
      List<dynamic> body = jsonDecode(response.body);
      final users = body.map((user) => UserApi.fromJson(user)).toList();
      print(users);
      return users;
    } else {
      throw Exception('Error al cargar usuarios: ${response.statusCode}');
    }
  } catch (e) {
    print(e);
    throw Exception('Error al obtener usuarios: $e');
  
  }
}

Future<void> createUser(UserApi user) async {
  final url = Uri.parse('https://backfluttertest.onrender.com/api/register'); // Reemplaza con la URL de tu API
  final headers = {
    'Content-Type': 'application/json',
  };

  final body = {
    'name': user.name,
    'document': user.document,
    'email': user.email,
    'birthday': DateFormat('yyyy-MM-dd').format(user.birthday),
    'gender': user.gender,
    'phone': user.phone,
    'image': user.image,
  };

  try {
    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 201) {
      print('Usuario creado exitosamente');
      // Manejar la respuesta del servidor si es necesario
    } else {
      print('Error al crear el usuario: ${response.statusCode}');
      print(response.body);
    }
  } catch (e) {
    print('Error: $e');
    // Manejar la excepción
  }
}


Future<void> updateUser(UserApi user) async {
  final url = Uri.parse('https://backfluttertest.onrender.com/api/user/updateUserById'); // Reemplaza con la URL de tu API
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer token', // Añade tu token de autenticación si es necesario
  };

  final body = {
    'idUser': user.id,
    'name': user.name,
    'document': user.document,
    'email': user.email,
    'birthday': DateFormat('yyyy-MM-dd').format(user.birthday),
    'gender': user.gender,
    'phone': user.phone,
    if (user.image != null) 'image': user.image,
  };

  try {
    final response = await http.put(
      url,
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      print('Usuario actualizado exitosamente');
      // Manejar la respuesta del servidor si es necesario
      final updatedUser = jsonDecode(response.body);
      // Realizar acciones con updatedUser
    } else if (response.statusCode == 404) {
      print('Usuario no encontrado');
    } else {
      print('Error al actualizar el usuario: ${response.statusCode}');
      print(response.body);
    }
  } catch (e) {
    print('Error: $e');
    // Manejar la excepción, por ejemplo, mostrando un mensaje de error al usuario
  }
}