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
            color:const Color.fromARGB(255, 155, 51, 47),
            shadowColor: const Color.fromARGB(255, 255, 8, 0) ,
            elevation:30,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.all(5),
            child: InkWell(
              splashColor:const Color.fromARGB(133, 13, 4, 98),
              onTap: (){},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(categories[index]['icono'],size: 40,color: Colors.white,),
                    const SizedBox(height: 10,),
                    Text(
                      categories[index]['titulo'],
                      textAlign:TextAlign.center,
                      style: const TextStyle(color:Colors.white,fontSize: 17),)
                  ],
                ),
              ),
            ),
          );
        }));
  }
}

