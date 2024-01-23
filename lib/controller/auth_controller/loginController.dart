import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;

  void onLogin(){
    print("Login button pressed");
    print("Password: ${password.text}");
    print("Phone: ${phone.text}");
    signInWithPhoneAndPassword(phone.text, password.text);
  }

  Future<String> signInWithPhoneAndPassword(String phone, String password) async {
    try{
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: phone,
        password: password,
      );
      Fluttertoast.showToast(
            msg: "Signed in",
            backgroundColor: Colors.greenAccent,
            timeInSecForIosWeb: 1,
          );
      return "Signed in";
    } on FirebaseAuthException catch(e){
      if(e.code == 'user-not-found'){
        //create a snackbar to show the user that the account already exists
        Fluttertoast.showToast(
            msg: "User Not Found",
            backgroundColor: Colors.redAccent,
            timeInSecForIosWeb: 1,
          );
        print("No user found for that email");
      } else if(e.code == 'wrong-password'){
        //create a snackbar to show the user that the account already exists
        SnackBar snackBar = SnackBar(content: Text("Wrong password provided for that user"));
        ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
        print("Wrong password provided for that user");
      }
      return e.code;
    } catch(e){
      print(e);
      return e.toString();
    }
  }

}