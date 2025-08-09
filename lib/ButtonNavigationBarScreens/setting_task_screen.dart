import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_flutter/LoginRegister/login_screen.dart';

import '../Provider/theme_manage_provider.dart';

class SettingTaskScreen extends StatefulWidget {
   SettingTaskScreen({super.key});

  @override
  State<SettingTaskScreen> createState() => _SettingTaskScreenState();
}

class _SettingTaskScreenState extends State<SettingTaskScreen> {
  String nameGet="";
   get() async {
     var sharePrefrence=await SharedPreferences.getInstance();
     nameGet=sharePrefrence.getString("name_key")!;
     setState(() {
     });
   }
   @override
  void initState() {
    super.initState();
    get();
  }

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("Welcome:- "),
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  '$nameGet',
                  textStyle: const TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                  speed: Duration(milliseconds: 150),
                ),
              ],
            )
          ],
        ),
      ),
      body: Center(
child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    SizedBox(
      height: 45,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              backgroundColor: Colors.blueGrey),
          onPressed: () {
            provider.clickToggle();
          },
          child: Text("Change Theme",style: TextStyle(color: Colors.white),)),
    ),
    SizedBox(height: 20,),
    SizedBox(
      height: 45,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              backgroundColor: Colors.blue),
          onPressed: () async {
            var sharePrefrence = await SharedPreferences.getInstance();
            sharePrefrence.setBool("login_status",false);
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen(),), (route) => false,);
          },
          child: Text("LogOut",style: TextStyle(color: Colors.white),)),
    ),
  ],
),
      ),
    );
  }
}
