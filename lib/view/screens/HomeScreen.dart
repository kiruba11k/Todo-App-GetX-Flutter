
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controller/controller.dart';
import 'package:todo/view/screens/edit_screen.dart';
import 'package:todo/view/widgets/todo_item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);


   final SQLController controller=Get.find();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar:AppBar(
          title:const Text("Todo App"),
          backgroundColor: Colors.teal,
          centerTitle:true,


        ),floatingActionButton: FloatingActionButton(
      onPressed: (){
        Get.to(()=>EditItem(),transition: Transition.circularReveal);
      },child: Icon(Icons.add),
    ),
      body:GetBuilder<SQLController>(
      builder: (controller)=>ListView.builder(
        itemCount: controller.list.length,
        itemBuilder: (context,index)=>TodoItem(controller: controller, index: index),
      ),
    ),

    );
  }
}
