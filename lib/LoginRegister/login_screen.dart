import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_flutter/Provider/share_prefrence_provider.dart';
import 'package:task_flutter/LoginRegister/register_screen.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<ManageProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Login Here"),
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
                      keyboardType: TextInputType.emailAddress,
                      controller: provider.emailTaskController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter Your Email",
                          prefixIcon: Icon(Icons.email)),
                      validator: (value) {
                        if(value!.isEmpty){
                          return "Please Email is required";
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: provider.passwordTaskController,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                          hintText: "Enter Your Password",
                          prefixIcon: Icon(Icons.password)),
                      validator: (value) {
                        if(value!.isEmpty){
                          return "Please Password is required";
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
                          onPressed: ()  async {
                           await provider.login(context);
                          },
                          child: Text("Login",style: TextStyle(color: Colors.white),)),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't Have an Account?"),
                        TextButton(child: Text("Register here",style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),), onPressed: () {
                           Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen(),));
                        },),
                      ],
                    ),

                  ],
                ),
              ))
            ],
          ),
        ));
  }
}
