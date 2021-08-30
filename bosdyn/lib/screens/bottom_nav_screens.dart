import 'package:flutter/material.dart';
import 'package:bosdyn/screens/screens.dart';
import 'package:bosdyn/globals.dart' as globals;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:flutter_covid_dashboard_ui/screens/screens.dart';

class BottomNavScreen extends StatefulWidget {
  final int pages_index;
  
  BottomNavScreen({Key? key,required this.pages_index}):super(key: key);
  
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List _screens = [
    HomeScreen(),
    micScreen(),
    SubmitScreen(),
    Login_Screen(),
    Scaffold(),
  ];
  //int _currentIndex = globals.justLoggedIn?4:0;

  @override
  Widget build(BuildContext context) {
    int _currentIndex = widget.pages_index!=''?widget.pages_index:0;
    //print("curr"+ _currentIndex.toString());
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
          FontAwesomeIcons.commentAlt, FontAwesomeIcons.microphoneAlt, FontAwesomeIcons.upload, FontAwesomeIcons.userAlt]
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
                      child: 
                      IconButton(onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BottomNavScreen(pages_index: key,)),
                        );
                      },icon: FaIcon(value,color:  _currentIndex == key
                            ?Colors.black:Colors.blue,),)
                      ,
                    ),
                  ),
                ))
            .values
            .toList(),
            
      ),
    );
  }
}
