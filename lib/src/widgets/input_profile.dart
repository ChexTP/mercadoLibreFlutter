import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Container InputProfile(String nombre,IconData icono,String titulo) {
    // ignore: avoid_unnecessary_containers
    return Container(                 
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // ignore: avoid_unnecessary_containers
                    Container(
                      child: Row(
                        children: [
                          Icon(icono,color: Colors.white,size: 30.0,),
                          Text(
                            titulo,
                            style: const TextStyle(color: Colors.white,fontSize: 20.0),),
                        ],
                      ),
                    ),
                    Text(
                      nombre,
                      style: const TextStyle(color: Colors.white,fontSize: 20.0))
                  ],
                ),
              );
  }