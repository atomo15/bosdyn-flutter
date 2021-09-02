import 'dart:convert';

import 'package:bosdyn/screens/login_screen.dart';
import 'package:bosdyn/screens/screens.dart';
import 'package:bosdyn/screens/submit_screen.dart';
import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bosdyn/globals.dart' as globals;
import 'package:swipedetector/swipedetector.dart';
import 'package:http/http.dart' as http;

class TestScreen extends StatefulWidget {
  const TestScreen({ Key? key }) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  
  FSBStatus status = FSBStatus.FSB_CLOSE;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SwipeDetector(
        onSwipeRight: (){
          setState(() {
            status = FSBStatus.FSB_OPEN;
          });
          api();
        } ,
        onSwipeLeft: (){
          setState(() {
            status = FSBStatus.FSB_CLOSE;
          });
        },
        child: FoldableSidebarBuilder(
        status: status,drawer: CustomDrawer(),screenContents: SubmitScreen(),
        drawerBackgroundColor: Colors.blue,),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //   setState(() {
      //     status = status == FSBStatus.FSB_OPEN?FSBStatus.FSB_CLOSE:FSBStatus.FSB_OPEN;
      //   });
      // },child: FaIcon(FontAwesomeIcons.bars),),
    );
  }
}

class CustomDrawer extends StatelessWidget {

  //final Function closeDrawer;

  //const CustomDrawer({Key? key, this.closeDrawer}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Container(
      color: Colors.black,
      width: mediaQuery.size.width * 0.60,
      height: mediaQuery.size.height,
      child: Column(
        children: <Widget>[
          SizedBox(height: 10,),
          // Container(
          //     width: double.infinity,
          //     height: 100,
          //     color: Colors.grey.withAlpha(20),
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: <Widget>[
          //         SizedBox(
          //           height: 10,
          //         ),
          //         Text("BOSDYN",style: TextStyle(
          //           color: Colors.blue
          //         ),)
          //       ],
          //     )),
         
          Expanded(
            child: ListView(
            scrollDirection: Axis.vertical,
            semanticChildCount: 6,
            shrinkWrap: true,
            children: [
              ListTile(
            onTap: (){
              debugPrint("Tapped Profile");
            },
            leading: Icon(Icons.person,color: Colors.blue,),
            title: Text(
              globals.isLoggedIn?globals.username:"Username",
              style: TextStyle(
                color: Colors.blue
              ),
            ),
            trailing: globals.isLoggedIn?FaIcon(
              FontAwesomeIcons.solidCheckCircle,
              color: Colors.green,):
              FaIcon(
              FontAwesomeIcons.solidTimesCircle,
              color: Colors.red,),
          ),
          // Divider(
          //   height: 1,
          //   color: Colors.grey,
          // ),
          ListTile(
            onTap: () {
              //debugPrint("Tapped settings");
            },
            leading: FaIcon(FontAwesomeIcons.server,color: Colors.blue,),
            title: Text(globals.API_IP==""?
              "API IP":globals.API_IP,style: TextStyle(color: Colors.blue),),
            trailing: globals.isApiCon?FaIcon(
              FontAwesomeIcons.solidCheckCircle,
              color: Colors.green,):
              FaIcon(
              FontAwesomeIcons.solidTimesCircle,
              color: Colors.red,),
          ),
          // Divider(
          //   height: 1,
          //   color: Colors.grey,
          // ),
          ListTile(
            onTap: () {
              debugPrint("Tapped Payments");
            },
            leading: FaIcon(FontAwesomeIcons.robot,color: Colors.blue,),
            title: Text(
              "SPOT",style: TextStyle(color: Colors.blue),),
            trailing: globals.isSpotCon?FaIcon(
              FontAwesomeIcons.solidCheckCircle,
              color: Colors.green,):
              FaIcon(
              FontAwesomeIcons.solidTimesCircle,
              color: Colors.red,),
          ),
          // Divider(
          //   height: 1,
          //   color: Colors.grey,
          // ),
          ListTile(
            onTap: () {
              debugPrint("Tapped Notifications");
            },
            leading: FaIcon(FontAwesomeIcons.video,color: Colors.blue,),
            title: Text(
              "SPOT CAM",style: TextStyle(color: Colors.blue),),
            trailing: globals.isCamCon?FaIcon(
              FontAwesomeIcons.solidCheckCircle,
              color: Colors.green,):
              FaIcon(
              FontAwesomeIcons.solidTimesCircle,
              color: Colors.red,), 
          ),
          // Divider(
          //   height: 1,
          //   color: Colors.grey,
          // ),
          ListTile(
            onTap: () {
              debugPrint("Tapped Notifications");
            },
            leading: FaIcon(FontAwesomeIcons.batteryFull,color: Colors.blue,),
            title:  RichText(text: TextSpan(
                            children: [
                              TextSpan(
                                text: globals.isSpotCon?globals.battery:'-',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  )
                              ),
                              WidgetSpan(
                                child:  Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                        child: FaIcon(FontAwesomeIcons.percentage,color: Colors.blue),
                                      ),
                                )
                            ]
                          )),
            trailing: globals.isSpotCon?FaIcon(
              FontAwesomeIcons.solidCheckCircle,
              color: Colors.green,):
              FaIcon(
              FontAwesomeIcons.solidTimesCircle,
              color: Colors.red,), 
          ),
          
          ListTile(
            onTap: () {
              debugPrint("Tapped Notifications");
            },
            leading: FaIcon(FontAwesomeIcons.temperatureHigh,color: Colors.blue,),
            title:  Text(globals.isSpotCon?globals.Temp+' °':'- °',
                          style: 
                          TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue
                            ),
                          ),
            trailing: globals.isSpotCon?FaIcon(
              FontAwesomeIcons.solidCheckCircle,
              color: Colors.green,):
              FaIcon(
              FontAwesomeIcons.solidTimesCircle,
              color: Colors.red,), 
          ),
          
          globals.isLoggedIn?
          ListTile(
            onTap: () {
              debugPrint("Tapped Log Out");
            },
            onLongPress: (){
                globals.isLoggedIn = false;
                globals.API_IP = "";
                globals.IP = "";
                globals.username = "";
                globals.password = "";
                globals.Temp = "";
                globals.battery="";
                globals.isApiCon = false;
                globals.isCamCon = false;
                globals.isSpotCon = false;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BottomNavScreen(pages_index: 3,)),
                );
            },
            leading: FaIcon(FontAwesomeIcons.signOutAlt,color: Colors.red,),
            title: Text("Log Out",style: TextStyle(color: Colors.red),),
          ):SizedBox(height: 0,)
            ],
          ),
          )
          
          
        ],
      ),
    );
  }
}
void api() async{
              Future<String> fetchApi() async {
                        print("AM IN");
                        if(globals.isLoggedIn==true){
                          // globals.isApiCon = false;
                          // globals.isCamCon = false;
                          // globals.isSpotCon = false;
                          // globals.Temp = "";
                          // globals.battery="";
                           String api_url = globals.API_IP;
                          String url =  'https://'+api_url+'.ngrok.io/api';
                          try{
                            final response = await  http.post(
                              Uri.parse(url),
                              headers: <String, String>{
                                'Content-Type': 'application/json; charset=UTF-8',
                              },
                              body: jsonEncode(<String, String>{
                                'user': globals.username,
                                'password':globals.password,
                                'ip':globals.IP
                              }),
                            );
                            if (response.statusCode == 200) {
                              // If the server did return a 200 OK response,
                              // then parse the JSON.
                              //return Album.fromJson(jsonDecode(response.body));
                              var api_result = jsonDecode(response.body);
                              print(api_result);
                              globals.battery = api_result['battery'].toString();
                              globals.Temp =  api_result['temperature'].toString();
                              globals.isSpotCon = api_result['spot'];
                              globals.isCamCon = api_result['payload'];
                              globals.isApiCon = true;
                              return "work";
                              } 
                          }catch (error){
                            print("post error");
                          }
                          
                        //   try{
                          
                        //     final response = await http
                        //     .get(Uri.parse(url));
                        //       if (response.statusCode == 200) {
                        //       // If the server did return a 200 OK response,
                        //       // then parse the JSON.
                        //       //return Album.fromJson(jsonDecode(response.body));
                        //       var api_result = jsonDecode(response.body);
                        //       //print(api_result);
                        //       globals.battery = api_result['battery'].toString();
                        //       globals.Temp =  api_result['temperature'].toString();
                        //       globals.isSpotCon = api_result['spot'];
                        //       globals.isCamCon = api_result['payload'];
                        //       globals.isApiCon = true;
                        //       return "work";
                        //       } 
                        //   }catch (error){
                        //     globals.isApiCon = false;
                        //     // If the server did not return a 200 OK response,
                        //     // then throw an exception.
                        //     //throw Exception('Failed to load album');
                        //     return "api not working";
                        //   }
                        // }else{
                        //   // try{
                        //   //   final response = await http
                        //   //   .get(Uri.parse('https://2c4c-128-206-16-255.ngrok.io/'));
                        //   //   if (response.statusCode == 200) {
                        //   //   globals.isApiCon = true;
                        //   //   //is_api_con = true;
                        //   //   return 'api is works';
                        //   // }
                        //   // }catch (error){
                        //   //   print('api not working');
                        //   //   globals.isApiCon = false;
                        //   //   return "api not working";
                        //   // }
                          
                          
                        }
                        globals.isApiCon = false;
                        return "api not working";
                        
                      }
          await fetchApi();  
  }