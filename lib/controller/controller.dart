import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import "package:path/path.dart";

import '../model/todo_model.dart';

class SQLController extends GetxController {
  late Database database; // Move the declaration here

  @override
  void onInit() {
    CreateDatabase();
    super.onInit();
  }

  void CreateDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');

    OpenDatabase(path: path);
  }

  void OpenDatabase({required String path}) async {
    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(
              'CREATE TABLE Test (id INTEGER PRIMARY KEY, title TEXT, description TEXT, time TEXT, favourite INTEGER, completed INTEGER)');
          debugPrint("Created");
        }, onOpen: (Database db) {
          database = db;
          debugPrint("Opened");
          ViewDatabase();
        });
  }

  void InsertDatabase({required String title,required String description,required String time}) async{
    try{ var insert = await database.insert("Test", {
      "title":title,
      "description":description,
      "time": time,
      "favourite": 0,
      "completed": 0
    });
    Get.back();
    debugPrint("$insert Inserted");
    ViewDatabase();}
    catch (e){
      debugPrint(e.toString());
    }


  }

  void DeleteDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');
    await deleteDatabase(path);
    debugPrint("Deleted");
  }
  bool updateTask=false;
  void UpdateData({required String title,required String description,required String time,required int id}) async{

    try{  var update = await database.update("Test", {
      "title":title,
      "description": description,
      "time": time,
      "favourite": 0,
      "completed": 0,
    },where: "id = $id",
    );
    debugPrint("Updated $update");
    Get.back();
    ViewDatabase();

    }
    catch(e){debugPrint(e.toString());}

  }

  void deleteData({required int id})async{
    var del=await database.delete("Test" ,where: "id= $id");
    debugPrint("Delted $del");
    ViewDatabase();

  }
List<TodoModel>list=[];
List<TodoModel>favlist=[];
  void ViewDatabase() async {
    list =[];
    favlist=[];
    var vi= await database.query("Test");
    for(var i in vi){
      debugPrint(i.toString());
      list.add(TodoModel.fromJson(i));
      if(i["favourite"]==1){
      favlist.add(TodoModel.fromJson(i));}
    }

  //  print(vi.toString());
    update();
    // Implement view logic here
  }
  void updateIntoFav({required int taskid ,required int favourite})async{
    var upfav=await database.update("Test",{
    "favourite":(favourite==0)? 1: 0 ,},where: "id = $taskid");
    ViewDatabase();

  }
}
