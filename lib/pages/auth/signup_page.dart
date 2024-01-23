
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hydlite/controller/auth_controller/SignupController.dart';
import 'package:hydlite/pages/auth/login_page.dart';
import 'package:hydlite/pages/auth/widgets/button.dart';
import 'package:hydlite/pages/auth/widgets/text_field.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    SignupController signupController = Get.put(SignupController());

    return Scaffold(
      appBar: AppBar(
        title: Text("L I T E",style: TextStyle(color: Colors.deepPurple,fontSize: 21,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(children: [
                //A text widget saying welcome
              
                //add in the textfields now around the center of the page
                Row(
                  children: [
                    Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 45, fontWeight: FontWeight.w700),
                    ),
                  ],),
                SizedBox(height: 30),
                //Add a nice flutter created bubbles like image which relates to literature and books over here
              
                MyTextField(
                  lable: "Enter Name",
                  icons: Icons.person, 
                  Onchange: signupController.name,),
                SizedBox(height: 10),
                MyTextField(
                  lable: "Enter Email",
                  icons: Icons.email, 
                  Onchange: signupController.email ,),
                SizedBox(height: 10),
                MyTextField(
                  lable: "Enter Password",
                  icons: Icons.password, 
                  Onchange: signupController.password ,),
                SizedBox(height: 10),
                MyTextField(
                  lable: "Enter Phone Number",
                  icons: Icons.phone, 
                  Onchange: signupController.phone ,),
                SizedBox(height: 20),
                
                //Add a button to register the user
                MyButton(
                  icon: Icons.person_add,
                  Btname: "REGISTER",
                  ontap: () {
                    //Get.toNamed("/signup");
                    //does the registration of the user
                    signupController.onSignup();
                  },
                ),
                SizedBox(height: 20),
                //Add a button to login the user
                MyButton(
                  icon: Icons.login,
                  Btname: "LOGIN",
                  ontap: () {
                    //go to the baseScreen page
                    Get.to(LoginPage());
                  },
                ),
                
                 ],)
            ),
      ),)
    );
  }
}