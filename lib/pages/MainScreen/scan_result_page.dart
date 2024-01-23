import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hydlite/firebase_options.dart'; // Import your Firestore service

class ScanResultPage extends StatefulWidget {
  final Barcode result;

  ScanResultPage(this.result);

  @override
  _ScanResultPageState createState() => _ScanResultPageState();
}




  

final List<String> validQRCodes = [
  'Lit_Stream',
  'Kaavya Dhaara',
  'Storytelling',
  'Youngistaan Nukkad',
  'Indigenous and Endangered Languages',
  'Science and the City',
  'Climate Conversation',
  'Stage Talk',
  'Nanha_Nukkad',
  'Cultural Events',
  'Workshops',
  'Exhibitions', 
  'Moving Images Talkies',
  'Cultural Events',
  'Meet My Book',
  'Interlude',
];

class _ScanResultPageState extends State<ScanResultPage> {
  @override
  void initState() {
    super.initState();
    addScan('userId', 'phoneNumber', DateTime.now())
    .then((_) => print('Scan added successfully'))
    .catchError((e) => print('Failed to add scan: $e'));// Call your function here
  }

  Future<void> addScan(String name, String phoneNumber, DateTime dateTime) {
    return FirebaseFirestore.instance.collection('Registration').add({
      'Name': name,
      'Phone Number': phoneNumber,
      'td': dateTime.toIso8601String(),
    });
  }

  @override
  Widget build(BuildContext context) {
  bool isValidQRCode = validQRCodes.contains(widget.result.code);

  return Scaffold(
    appBar: AppBar(
      title: Text('Scan Result', style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 270,
            width: 270,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Image.asset(isValidQRCode ? 'assets/images/tick.png' : 'assets/images/error.png'),
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 20.0),
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
          Text(
            isValidQRCode ? 'Checked in for event:\n ${widget.result.code}' : 'Invalid QR code',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.0),
          ),
        ],
      ),
    ),
  );
  }
}
