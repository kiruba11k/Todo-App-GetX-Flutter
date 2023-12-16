import 'package:get/get.dart';
import 'package:todo/controller/controller.dart';

class TaskBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>SQLController());
  }

}