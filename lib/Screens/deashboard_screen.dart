import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_flutter/ButtonNavigationBarScreens/add_task_screen.dart';
import 'package:task_flutter/ButtonNavigationBarScreens/setting_task_screen.dart';
import 'package:task_flutter/ButtonNavigationBarScreens/view_task_screen.dart';

class DeashboardScreen extends StatefulWidget {
   DeashboardScreen({super.key});

  @override
  State<DeashboardScreen> createState() => _DeashboardScreenState();
}

class _DeashboardScreenState extends State<DeashboardScreen> {
  List<Widget> listShowScreens=[AddTaskScreen(),ViewTaskScreen(),SettingTaskScreen()];

  var currentScreen=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listShowScreens[currentScreen],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentScreen,
          onTap: (value) {
            setState(() {
              currentScreen=value;
            });
          },
          items: [
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.add_circled),label: "Add Task"),
        BottomNavigationBarItem(icon: Icon(Icons.view_day),label: "View Task"),
        BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Setting"),
      ]),
    );
  }
}
