import 'package:flutter/material.dart';

class TextInputProfile extends StatelessWidget {
  
  const TextInputProfile({
    super.key,
    required this.title,
    required this.value,
  });

  final String value;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
        Text(value,style: const TextStyle(color: Colors.white,fontSize: 20,)),
      ],
    );
  }
}