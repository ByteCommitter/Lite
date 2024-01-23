import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydlite/pages/MainScreen/event_image_page.dart';
import 'package:hydlite/pages/MainScreen/qr_scan_page.dart';
/*
enum Event { 
  "LitStream", 
  "Kaavya Dhaara",
  "LitFest",
}*/

class EventPage extends StatelessWidget {
  final EventController eventController = Get.put(EventController());

  final List<String> eventTitles = [
  'Lit Stream',
  'Kaavya Dhaara',
  'Stage Talks',
  'Science and the City',
  'Climate Conversations',
  'Indigenous and Endangered Languages',
  'Nanha Nukkad',
  'Children’s Corner',
  'Youngistan Nukkad',
  'Storytelling',
  'Cultural Events',
  'Workshops',
  'Exhibitions',
  'Moving Images Talkies',
  'Meet My Book',
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EVENTS ',style: TextStyle(fontSize: 18 ,fontWeight: FontWeight.bold,color: Colors.deepPurple),),
      ),
      body: ListView.builder(
        itemCount: eventTitles.length,
        itemBuilder: (context, index) {
          return _buildEventContainer(eventTitles[index], Colors.deepPurple[200]!);
        },
      ),
    );
  }

 Widget _buildEventContainer(String event, Color color) {
  return GetBuilder<EventController>(
    builder: (controller) {
      return Container(
        margin: EdgeInsets.all(8.0),
        child: ExpansionPanelList.radio(
          elevation: 1,
          expandedHeaderPadding: EdgeInsets.all(0),
          expansionCallback: (int index, bool isExpanded) {
            controller.selectEvent(event);
          },
          children: [
            ExpansionPanelRadio(
              value: event,
              canTapOnHeader: true,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    event,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                );
              },
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    _buildDateButton('Day 1'),
                    _buildDateButton('Day 2'),
                    _buildDateButton('Day 3'),
                    if (controller.getImagePath().isNotEmpty)
                      Image.asset(controller.getImagePath()),
                    ElevatedButton(
                      child: Text('Scan QR'),
                      onPressed: () {
                        Get.to(QRScannerPage());
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

  Widget _buildDateButton(String date) {
  return GetBuilder<EventController>(
    builder: (controller) {
      return ElevatedButton(
        child: Text(date),
        onPressed: () {
          controller.selectDate(date);
          if (controller.getImagePath().isNotEmpty) {
            Get.to(ImagePage(imagePath: controller.getImagePath()));
          }
        },
      );
    },
  );
}
}

class EventController extends GetxController {
  var selectedEvent = ''.obs;
  var selectedDate = ''.obs;

  void selectEvent(String event) {
    if (selectedEvent.value == event) {
      selectedEvent.value = '';
    } else {
      selectedEvent.value = event;
    }
    update();
  }

  void selectDate(String date) {
    selectedDate.value = date;
    update();
  }

  String getImagePath() {
    if (selectedEvent.value.isEmpty || selectedDate.value.isEmpty) {
      return '';
    }
    return 'assets/events/${selectedEvent.value}_${selectedDate.value}.jpg';
  }
}