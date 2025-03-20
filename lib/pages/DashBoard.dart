import 'package:flutter/material.dart';
import 'package:home_services_app/pages/AccountPage.dart';
import 'package:home_services_app/pages/BookingsPage.dart';
import 'package:home_services_app/pages/Searchpage.dart';

import 'Homepage.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {

  final _pages = [
    HomePage(),
    SearchPage(),
    BookingsPage(),
    AccountPage()


  ];
  
  int _currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(size: 30, opacity: 1),
        unselectedIconTheme: IconThemeData(size: 28, opacity: 0.5),
        selectedLabelStyle: TextStyle(fontSize: 14),
        unselectedLabelStyle: TextStyle(fontSize: 14),
        showUnselectedLabels: true,
        elevation: 40,
        selectedFontSize: 16,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home,size: 20,),
          label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search,size: 20,),
          label: 'Search',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.message_sharp,size: 20,),
          label: 'Bookings',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle,size: 20,),
          label: 'Account',
          ),

        ],
        currentIndex: _currentIndex,
        onTap: (value){
          _currentIndex = value;
          setState(() {

          });
        },

        
      ),
    );
  }
}
