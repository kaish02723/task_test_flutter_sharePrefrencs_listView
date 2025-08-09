import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_flutter/Provider/share_prefrence_provider.dart';
import 'package:task_flutter/Provider/task_add_provider.dart';
import 'package:task_flutter/Provider/theme_manage_provider.dart';
import 'package:task_flutter/Screens/splash_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ThemeProvider(),),
    ChangeNotifierProvider(create: (context) => TaskAddProvider(),),
    ChangeNotifierProvider(create: (context) => ManageProvider(),),
  ],child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<ThemeProvider>(context);
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      themeMode: provider.currentTheme,
      debugShowCheckedModeBanner: false,
      home:  SplashScreen(),
    );
  }
}

