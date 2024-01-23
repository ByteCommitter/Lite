import 'package:flutter/material.dart';
import 'package:hydlite/pages/MainScreen/check_in_page.dart';
import 'package:hydlite/pages/MainScreen/eventPage.dart';
import 'package:hydlite/pages/MainScreen/profile_page.dart';
import 'package:hydlite/pages/MainScreen/schedule_page.dart';
import 'package:hydlite/pages/auth/login_page.dart';

class BaseScreen extends StatefulWidget{
  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  
  @override
  void initState(){
    super.initState();
  }

  int _selectedIndex = 0;
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

  @override
  Widget build(BuildContext context){
    

    return  Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        elevation: 0,
        title:const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "L I T E",
                          style:
                          TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),

      body: IndexedStack(
        index: _selectedIndex,
        children: <Widget>[
           
            CheckIntoEventsPage(),

            EventPage(),

            SchedulePage(),
          
            ProfilePage()

        ],
      ),
      
      

      //Bottom Navigation Bar:
      bottomNavigationBar: BottomNavigationBar(
        //decoration of the bar
        type: BottomNavigationBarType.shifting,
        selectedIconTheme: const IconThemeData(color: Colors.deepPurple),
        iconSize: 34,
        selectedItemColor: const Color.fromARGB(255, 248, 213, 16),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedIconTheme: const IconThemeData(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        backgroundColor: Colors.deepPurple,
        elevation: 0, 
        //to do with the different pages in the bar
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.qr_code_2_outlined),
        label: "Scan",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.event_outlined),
        label: "Events",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.schedule_outlined),
        label: 'Schedule',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_outline_rounded),
        label: 'Profile',
      ),
    ],
    currentIndex: _selectedIndex, //New
    onTap: _onItemTapped,
  ),
  

      
    );
  }
}


