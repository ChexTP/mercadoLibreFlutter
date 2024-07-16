import 'package:flutter/material.dart';
import 'package:mercado_libre_app/src/models/categories.dart';

class GridCardCustom extends StatelessWidget {
  const GridCardCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate:const  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount:  categories.length, 
        itemBuilder: (BuildContext context, int index){
          return Card(
            color:const   Color.fromARGB(255, 255, 8, 0),
            shadowColor: const Color.fromARGB(255, 255, 8, 0) ,
            elevation:30,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.all(5),
            child: InkWell(
              onTap: (){},
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(categories[index]['icono'],size: 40,),
                    SizedBox(height: 10,),
                    Text(
                      categories[index]['titulo'],
                      textAlign:TextAlign.center,
                      style: TextStyle(color:Color.fromARGB(255, 11, 9, 30),fontSize: 17),)
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
