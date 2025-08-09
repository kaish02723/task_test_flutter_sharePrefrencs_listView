import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Screens/deashboard_screen.dart';
import '../LoginRegister/login_screen.dart';

class ManageProvider with ChangeNotifier {
  bool passVisible = false;
  var formKeyValidation = GlobalKey<FormState>();
  var emailTaskController = TextEditingController();
  var passwordTaskController = TextEditingController();

  var formKeyReValidation = GlobalKey<FormState>();
  var nameTaskReController = TextEditingController();
  var numberReTaskController = TextEditingController();
  var pinCodeReTaskController = TextEditingController();
  var emailReTaskController = TextEditingController();
  var passwordReTaskController = TextEditingController();


  Future<void> login(BuildContext context) async {
    if (formKeyValidation.currentState!.validate()) {
      var sharePrefrence = await SharedPreferences.getInstance();
      var emailGet = sharePrefrence.getString("email_key");
      var passwordGet = sharePrefrence.getString("password_key");
      if (emailTaskController.text != emailGet) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Email is invalid")));
        return ;
      } else if (passwordTaskController.text != passwordGet) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password is invalid")));
      } else {
        sharePrefrence.setBool("login_status", true);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => DeashboardScreen(),
          ),
          (route) => false,
        );
      }
    }
    notifyListeners();
  }


 Future<void> register(BuildContext context) async {
    if (formKeyReValidation.currentState!.validate()) {
      var sharePrefrence = await SharedPreferences.getInstance();
      sharePrefrence.setString("name_key", nameTaskReController.text.toString());
      sharePrefrence.setString(
          "number_key", numberReTaskController.text.toString());
      sharePrefrence.setString(
          "pinCode_key", pinCodeReTaskController.text.toString());
      sharePrefrence.setString(
          "email_key", emailReTaskController.text.toString());
      sharePrefrence.setString(
          "password_key", passwordReTaskController.text.toString());

      sharePrefrence.setBool("login_status", true);

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
    }
    notifyListeners();
  }
}
