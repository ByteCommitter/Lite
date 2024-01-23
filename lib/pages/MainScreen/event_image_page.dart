import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  final String imagePath;

  ImagePage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule', style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: Image.asset(imagePath),
      ),
    );
  }
}