import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_flutter/Model/task_model.dart';

class ViewTaskScreen extends StatelessWidget {
  const ViewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     body: ListView.builder(
       itemCount: listTask.length,
       itemBuilder: (context, index) {
         var list=listTask[index];
      return Padding(
        padding: const EdgeInsets.only(left: 20.0,top: 10,right: 20,bottom: 10),
        child: Container(
           width: double.infinity,
           height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(0xffc3eaff)
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(list.taskName,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                Text(list.taskDescription,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Text(list.taskStatus,style: TextStyle(
                  color: Colors.blue
                ),)
              ],
            ),
          ),
         ),
      );
     },),
    );
  }
}
