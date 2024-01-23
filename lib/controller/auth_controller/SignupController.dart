import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class SignupController extends GetxController{
  TextEditingController name = TextEditingController(); 
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;

  void onSignup(){
    print("Signup button pressed");
    print("Name: ${name.text}");
    print("Email: ${email.text}");
    print("Password: ${password.text}");
    print("Phone: ${phone.text}");
    createAccount(name.text, email.text, password.text, phone.text);
  }

  bool isValidEmail(String email) {
    final RegExp regex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    return regex.hasMatch(email);
  }

  Future<String> createAccount(String name, String email, String password, String phone) async {

      try{
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        Fluttertoast.showToast(
            msg: "Account Created",
            backgroundColor: Colors.greenAccent,
            timeInSecForIosWeb: 1,
          );
        return "Signed up";
      } on FirebaseAuthException catch(e){
        if(e.code == 'weak-password'){
          //create a snackbar to show the user that the password is weak
          Fluttertoast.showToast(
            msg: "The password provided is too weak",
            backgroundColor: Colors.orangeAccent,
            timeInSecForIosWeb: 1,
          );
          SnackBar snackBar = SnackBar(content: Text("The password provided is too weak"));
          ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
          print("The password provided is too weak");
        } else if(e.code == 'email-already-in-use'){
          //create a snackbar to show the user that the account already exists
          SnackBar snackBar = SnackBar(content: Text("The account already exists for that email"));
          ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
          print("The account already exists for that email");
        }
        return e.code;
      } catch(e){
        print(e);
        return e.toString();
      }
  } 
  
}