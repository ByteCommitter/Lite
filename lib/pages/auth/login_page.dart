import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hydlite/config/colors.dart';
import 'package:hydlite/controller/auth_controller/SignupController.dart';
import 'package:hydlite/controller/auth_controller/loginController.dart';
import 'package:hydlite/pages/MainScreen/base_widget.dart';
import 'package:hydlite/pages/auth/signup_page.dart';
import 'package:hydlite/pages/auth/widgets/button.dart';
import 'package:hydlite/pages/auth/widgets/text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());

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
                const Row(
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(fontSize: 45, fontWeight: FontWeight.w700),
                    ),
                  ],),
                const SizedBox(height: 30),
                //Add a nice flutter created bubbles like image which relates to literature and books over here              
                
                MyTextField(
                  lable: "Enter Phone Number",
                  icons: Icons.phone, 
                  Onchange: loginController.phone ,),
                const SizedBox(height: 10),
                MyTextField(
                  lable: "Enter Password",
                  icons: Icons.password, 
                  Onchange: loginController.password ,),
                const SizedBox(height: 10),
                
                const SizedBox(height: 20),
                MyButton(
                  icon: Icons.login,
                  Btname: "LOGIN",
                  ontap: () {
                    loginController.onLogin();
                    Get.to(BaseScreen());
                  },
                ),
                const SizedBox(height: 20),
                //Add a button to register the user
                MyButton(
                  icon: Icons.person_add,
                  Btname: "REGISTER",
                  ontap: () {
                    Get.to(SignupPage());
                    //does the registration of the user
                    //loginController.onSignup();
                  },
                ),
                const SizedBox(height: 20),
                //Add a button to login the user
                
                
                 ],)
            ),
      ),)
    );
  }
}

/*
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        title: Text("LOGIN"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(children: [
              Row(
                children: [
                  Text(
                    "Welcome back ❤️",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "LOGIN",
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              SizedBox(height: 30),
              MyTextField(
                icons: Icons.email,
                lable: "Email id",
                Onchange: loginController.email,
              ),
              SizedBox(height: 10),
              MyTextField(
                icons: Icons.password,
                lable: "Password",
                Onchange: loginController.password,
              ),
              SizedBox(height: 20),
              MyButton(
                icon: Icons.admin_panel_settings_rounded,
                Btname: "LOGIN",
                ontap: () {
                  loginController.onLogin();
                },
              ),
              SizedBox(height: 20),
              MyButton(
                icon: Icons.person_add,
                Btname: "SIGN UP",
                ontap: () {
                  Get.toNamed("/signup");
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}*/