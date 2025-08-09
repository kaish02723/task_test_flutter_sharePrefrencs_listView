import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_flutter/LoginRegister/login_screen.dart';

import '../Provider/share_prefrence_provider.dart';

class RegisterScreen extends StatefulWidget {
 RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<ManageProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Register Here"),
          backgroundColor: Colors.blueGrey,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                key: provider.formKeyReValidation,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: provider.nameTaskReController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Enter Your Name",
                              prefixIcon: Icon(Icons.person)),
                          validator: (value) {
                            if(value!.isEmpty){
                              return "Please Name is required";
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          maxLength: 10,
                          controller: provider.numberReTaskController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Enter Your Number",
                              prefixIcon: Icon(Icons.phone)),
                          validator: (value) {
                            if(value!.isEmpty){
                              return "Please Number is required";
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          maxLength: 6,
                          controller: provider.pinCodeReTaskController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Enter Your PinCode",
                              prefixIcon: Icon(Icons.pin)),
                          validator: (value) {
                            if(value!.isEmpty){
                              return "Please PinCode is required";
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: provider.emailReTaskController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Enter Your Email",
                              prefixIcon: Icon(Icons.email)),
                          validator: (value) {
                            if(value!.isEmpty){
                              return "Please Email is required";
                            }
                            else if(!value.contains("@gmail.com")){
                              return "Email is invalid";
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: provider.passVisible,
                          keyboardType: TextInputType.visiblePassword,
                          controller: provider.passwordReTaskController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              suffixIcon: IconButton(onPressed: () {
                                setState(() {
                                  provider.passVisible=!provider.passVisible;
                                });
                              }, icon: Icon(provider.passVisible?CupertinoIcons.eye_slash_fill:CupertinoIcons.eye_solid)),
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
                               await provider.register(context);
                              },
                              child: Text("Register",style: TextStyle(color: Colors.white),)),
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already Have an Account?"),
                            TextButton(child: Text("Login here",style: TextStyle(
                              fontWeight: FontWeight.bold,

                            ),), onPressed: () {
                               Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
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
