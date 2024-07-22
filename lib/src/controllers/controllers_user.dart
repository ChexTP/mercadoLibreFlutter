import 'package:http/http.dart' as http;
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