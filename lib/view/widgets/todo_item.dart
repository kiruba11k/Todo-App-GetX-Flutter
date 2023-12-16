import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controller/controller.dart';

import '../screens/edit_screen.dart';

class TodoItem extends StatelessWidget {
   TodoItem({Key? key, required this.controller, required this.index}):super(key:key);
  SQLController controller=Get.find();
  final int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        child: SizedBox(
          height: 150,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Expanded(child: Row(

                  children: [Spacer(),
                    Expanded(child: Text(controller.list[index].title,style: const TextStyle(
                      fontSize:25.0,fontWeight: FontWeight.bold,
                    ),textAlign: TextAlign.start,)),
                    Expanded(child: Text(controller.list[index].time,textAlign: TextAlign.end,))
                  ],
                )),Expanded(child: Text(controller.list[index].description)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){

                      controller.deleteData(id:controller.list[index].id);
                      }, icon: const Icon(Icons.delete_forever),color: Colors.red,),
                    IconButton(onPressed: (){
                      controller.updateIntoFav(taskid:controller.list[index].id,favourite:controller.list[index].favourite);
                    }, icon: const Icon(Icons.favorite_outlined),color: controller.list[index].favourite==0 ?Colors.black26 : Colors.red,),
                    IconButton(onPressed: (){
                      controller.updateTask=true;
                      Get.to(()=>EditItem(id: controller.list[index].id,
                        title: controller.list[index].title,
                        description: controller.list[index].description,
                        time: controller.list[index].time,));

                    }, icon: const Icon(Icons.edit),color: Colors.green,)
                  ],
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
