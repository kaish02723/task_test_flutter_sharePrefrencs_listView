import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_flutter/Model/task_model.dart';
import 'package:task_flutter/Provider/task_add_provider.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {


  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<TaskAddProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Deashboard Here"),
          backgroundColor: Colors.blueGrey,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                key: provider.formKeyValidation,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: provider.nameTaskController,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Enter Task Name",
                              prefixIcon: Icon(Icons.person)),
                          validator: (value) {
                            if(value!.isEmpty){
                              return "Please Task Name is required";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: provider.descriptionTaskController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Enter Task Description",
                              prefixIcon: Icon(Icons.description)),
                          validator: (value) {
                            if(value!.isEmpty){
                              return "Please Task Description is required";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: provider.statusTaskController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Enter Task Status",
                              prefixIcon: Icon(Icons.stadium_sharp)),
                          validator: (value) {
                            if(value!.isEmpty){
                              return "Please Task Status is required";
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 45,
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  backgroundColor: Colors.blueGrey),
                              onPressed: () {
                                provider.addTask(context);
                              },
                              child: Text("Add-Task",style: TextStyle(color: Colors.white),)),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }
}
