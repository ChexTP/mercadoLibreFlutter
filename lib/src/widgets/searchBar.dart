import 'package:flutter/material.dart';

class SearchBarCustom extends StatelessWidget {
  const SearchBarCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  style: const TextStyle(color: Colors.white,fontSize: 20.0),
                  decoration: InputDecoration(
                    
                    contentPadding: const EdgeInsets.all(3.0),
                    prefixIcon: const Icon(Icons.search,color:Colors.white ,),
                    hintText: "Buscar producto",
                    hintStyle: const TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.normal),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none
    
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 255, 8, 0)
                  ),
                )),
                const SizedBox(width: 10.0),
                IconButton(
                  onPressed: (){},
                  icon:const  Icon(Icons.favorite_border_outlined,size: 40,color: Color.fromARGB(255, 255, 8, 0),)),
                IconButton(
                  onPressed: (){}, 
                  icon:const  Icon(Icons.notification_add_outlined,size: 40,color: Color.fromARGB(255, 255, 8, 0)))
            ],
          )
        ],
      ),
    );
  }
}