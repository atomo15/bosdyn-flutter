import 'package:flutter/material.dart';
import 'package:bosdyn/screens/screens.dart';
import 'package:bosdyn/globals.dart' as globals;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:flutter_covid_dashboard_ui/screens/screens.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List _screens = [
    HomeScreen(),
    Scaffold(),
    SubmitScreen(),
    Login_Screen(),
    Scaffold(),
  ];
  int _currentIndex = globals.justLoggedIn?4:0;
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() => _currentIndex = index);
          globals.justLoggedIn = false;
          },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        elevation: 0.0,
        items: [
          Icons.comment_rounded, Icons.mic_rounded, Icons.volume_up_rounded, Icons.person]
            .asMap()
            .map((key, value) => MapEntry(
                  key,
                  BottomNavigationBarItem(
                    title: Text(''),
                    icon: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                        color: _currentIndex == key
                            ? Colors.blue[600]
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Icon(value,color:  _currentIndex == key
                            ?Colors.white:Colors.blue,),
                    ),
                  ),
                ))
            .values
            .toList(),
            
      ),
    );
  }
}
