import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydlite/pages/MainScreen/qr_scan_page.dart';

class CheckIntoEventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Show an image from the assets folder
            //reduce the size of the image
            Text('Scan to Check In', style: TextStyle(color: Colors.deepPurple,fontSize: 21,fontWeight: FontWeight.bold),),
            Container(
              height: 270,
              width: 270,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 20.0), // Adjust the color and width as needed
                borderRadius: BorderRadius.circular(25.0), // Adjust the radius as needed
              ),
              //make the image have rounded borders
              child:  ClipRRect(
                borderRadius: BorderRadius.circular(25.0), // Adjust the radius as needed
                child: Image.asset('assets/images/qrscan.jpg'), // Replace with your image asset path
              ),
              
            ),
            ElevatedButton(
              child: const Text('Tap here to Scan'),
              onPressed: () {
                //use getX for this navigation to QRScannerPage
                Get.to(QRScannerPage());
                /*Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QRScannerPage()),
                );*/
              },
            ),
          ],
        ),
      ),
    );
  }
}