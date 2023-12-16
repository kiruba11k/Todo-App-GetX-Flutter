import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controller/controller.dart';
import 'package:todo/sharable/control_form.dart';

class EditItem extends StatefulWidget {
  const EditItem({Key? key,this.id, this.title, this.description, this.time}) : super(key: key);

final int? id;
final String? title;
final String? description;
final String? time;
  @override
  State<EditItem> createState() => _EditItemState();
}

class _EditItemState extends State<EditItem> {
  final titleController = TextEditingController();

  final descriptionController = TextEditingController();

  final timeController = TextEditingController();

  final SQLController controller=Get.find();
@override
  void initState() {
  if(controller.updateTask){
    titleController.text=widget.title.toString();
    descriptionController.text=widget.description.toString();
    timeController.text=widget.time.toString();
  }

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.updateTask ? "Update":"Add"),
        centerTitle: true,// Provide a meaningful title
      ),
      body: Column(
        children: [
          CustomFormField(
            controller: titleController,
            hintText: "Enter Title",
            validationText: "Title must be there",
            keyboardType: TextInputType.text, // Adjust keyboard type as needed
          ),
          CustomFormField(
            controller: descriptionController,
            hintText: "Enter Description",
            validationText: "Description must be there",
            keyboardType: TextInputType.text, // Adjust keyboard type as needed
          ),
          CustomFormField(
            controller: timeController,
            hintText: "Enter Time",
            validationText: "Time must be there",
            keyboardType: TextInputType.text, // Adjust keyboard type as needed
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: MaterialButton(
              onPressed: () {
                if(!controller.updateTask){
                  controller.InsertDatabase(
                    title: titleController.text,
                    description: descriptionController.text,
                    time: timeController.text,
                  );
                }
                else{
                  controller.UpdateData(title: titleController.text,
                    description: descriptionController.text,
                    time: timeController.text,
                    id:widget.id!);
                }

              },
              minWidth: double.infinity,
              textColor: Colors.white,
              color: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text(controller.updateTask ? "Update":"Add"),
            ),
          ),
        ],
      ),
    );
  }
}
