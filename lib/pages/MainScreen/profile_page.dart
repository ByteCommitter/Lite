import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hydlite/controller/auth_controller/SignupController.dart';
import 'package:hydlite/pages/auth/widgets/text_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var signupController = SignupController();
    final User? user = FirebaseAuth.instance.currentUser;
    final String? name = user?.displayName ?? 'Not provided';
    final String? email = user?.email ?? 'Not provided';
    final String? phoneNumber = user?.phoneNumber ?? 'Not provided';

    return Scaffold(
      appBar: AppBar(
        title: Text("YOUR PROFILE",style: TextStyle(color: Colors.deepPurple,fontSize: 18,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: _image != null ? FileImage(_image!) : null,
              child: _image == null
                  ? IconButton(
                      icon: Icon(Icons.add_a_photo),
                      onPressed: getImage,
                    )
                  : null,
            ),
            const SizedBox(height: 30),
            ListTile(
              leading: Text('Name :',style: TextStyle(fontSize: 18),),
              title: Text(name!),
            ),
            ListTile(
              leading: Text('Email :',style: TextStyle(fontSize: 18),),
              title: Text(email!),
            ),
            ListTile(
              leading: Text('Phone Number : ',style: TextStyle(fontSize: 18),),
              title: Text(phoneNumber!),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: Text('Logout'),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
            ) 
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Name: $name');
          print('Email: $email');
          print('Phone Number: $phoneNumber');
        },
        child: Icon(Icons.save),
      ),
    );
  }
}