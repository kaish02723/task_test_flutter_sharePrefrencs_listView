import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_flutter/Screens/deashboard_screen.dart';
import '../LoginRegister/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  get() async {
    var sharePrefrence = await SharedPreferences.getInstance();
    var status = sharePrefrence.getBool("login_status") ?? false;
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            if (status) {
              return DeashboardScreen();
            } else {
              return LoginScreen();
            }
          },
        ));
      },
    );
  }

  @override
  void initState() {
    super.initState();
    get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Lottie.asset('assets/loging.json',height: 300),
            SizedBox(height: 100),
            Lottie.asset('assets/loading.json',width: 150),
            SizedBox(height: 200),
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  'Welcome To EduGaon',
                  textStyle: const TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                  speed: Duration(milliseconds: 100),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
