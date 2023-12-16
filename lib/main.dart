import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/config/task_binding.dart';
import 'package:todo/view/screens/HomeScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  TaskBinding().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Your App Title',
      initialBinding: TaskBinding(),
      home: HomeScreen(),
    );
  }
}
