// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mercado_libre_app/src/models/user_api_model.dart';
import 'package:mercado_libre_app/src/controllers/controllers_user.dart';

void showUpdateUserModal(
    BuildContext context, {
  required bool isUpdate,
  UserApi? user,
  required Function onUpdate}) {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController(text: user?.name ?? '');
  final _documentController = TextEditingController(text: user?.document?? '');
  final _emailController = TextEditingController(text: user?.email?? '');
  final _birthdayController = TextEditingController(
      text: user != null ? DateFormat('MM/dd').format(user.birthday) : '');
  final _genderController = TextEditingController(text: user?.gender??'');
  final _phoneController = TextEditingController(text: user?.phone??'');

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  style: TextStyle(fontSize: 20.0),
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                    labelStyle: TextStyle(fontSize: 20.0)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingrese un nombre';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  style: TextStyle(fontSize: 20.0),
                  controller: _documentController,
                  decoration: const InputDecoration(
                    labelText: 'Documento',
                    labelStyle: TextStyle(fontSize: 20.0)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingrese un documento';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  style: TextStyle(fontSize: 20.0),
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(fontSize: 20.0)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingrese un email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  style: TextStyle(fontSize: 20.0),
                  controller: _birthdayController,
                  decoration: const InputDecoration(
                    labelText: 'Fecha de nacimiento',
                    labelStyle: TextStyle(fontSize: 20.0)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingrese una fecha de nacimiento';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  style: TextStyle(fontSize: 20.0),
                  controller: _genderController,
                  decoration: const InputDecoration(
                    labelText: 'Genero',
                    labelStyle: TextStyle(fontSize: 20.0)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingrese un género';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  style: TextStyle(fontSize: 20.0),
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Telefono',
                    labelStyle: TextStyle(fontSize: 20.0)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingrese un número telefónico';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 8, 0),
                    foregroundColor: Colors.white,
                    textStyle: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
                    minimumSize: const Size(300, 60)
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                     UserApi userToSave = UserApi(
                        id: user?.id,
                        name: _nameController.text,
                        document: _documentController.text,
                        email: _emailController.text,
                        birthday: DateFormat('MM/dd').parse(_birthdayController.text),
                        gender: _genderController.text,
                        phone: _phoneController.text,
                        image: user?.image,
                      );

                      if (isUpdate) {
                        await updateUser(userToSave);
                      } else {
                        await createUser(userToSave);
                      }

                      onUpdate();
                      Navigator.pop(context);
                    }
                  },
                  child: Text(isUpdate ? 'Actualizar':'Registrar'),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
