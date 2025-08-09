import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Model/task_model.dart';

class TaskAddProvider with ChangeNotifier{

  var formKeyValidation=GlobalKey<FormState>();

  var nameTaskController=TextEditingController();

  var descriptionTaskController=TextEditingController();

  var statusTaskController=TextEditingController();

  addTask(BuildContext context){
   if(formKeyValidation.currentState!.validate()){
     listTask.add(TaskModel(taskName: nameTaskController.text.toString(), taskDescription: descriptionTaskController.text.toString(), taskStatus: statusTaskController.text.toString()));
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Task Added successfully")));
   }
   notifyListeners();
  }
}