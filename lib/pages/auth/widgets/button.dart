import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String Btname;
  final IconData icon;
  final VoidCallback ontap;
  const MyButton({super.key, required this.Btname, required this.icon, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: ontap,
            child: Text(Btname,style: TextStyle(color: Colors.white),),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}