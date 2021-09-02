import 'dart:convert';

import 'package:bosdyn/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:bosdyn/globals.dart' as globals;
//import 'package:flutter_covid_dashboard_ui/config/palette.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  
  var is_spot_con = false;
  var is_cam_con = false;
  var is_api_con = false;
  late var battery = "-";
  var temp = "-";
 
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      //backgroundColor: Palette.primaryColor,
      backgroundColor: Colors.black,
      elevation: 0.0,
      leading: IconButton(
        icon: const Icon(Icons.home,color: Colors.blue,),
        iconSize: 28.0,
        onPressed: () {
          Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BottomNavScreen(pages_index: 0,)),
                );
        },
      ),
    
      title: Center(
        child: Text(
                  'BOSDYN APP',
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        )
      ,
      actions: <Widget>[
            IconButton(
              onPressed: () async{
              Future<String> fetchApi() async {
                        //  print("AM IN");
                        if(globals.isLoggedIn==true){
                          
                          try{
                            final response = await http
                            .get(Uri.parse('https://2c4c-128-206-16-255.ngrok.io/api'));
                              if (response.statusCode == 200) {
                              // If the server did return a 200 OK response,
                              // then parse the JSON.
                              //return Album.fromJson(jsonDecode(response.body));
                              var api_result = jsonDecode(response.body);
                              //print(api_result);
                              battery = api_result['battery'].toString();
                              temp =  api_result['temperature'].toString();
                              is_spot_con = api_result['spot'];
                              is_cam_con = api_result['payload'];
                              is_api_con = true;
                              return "work";
                              } 
                          }catch (error){
                            is_api_con = false;
                            // If the server did not return a 200 OK response,
                            // then throw an exception.
                            //throw Exception('Failed to load album');
                            return "api not working";
                          }
                        }else{
                          
                          try{
                            final response = await http
                            .get(Uri.parse('https://2c4c-128-206-16-255.ngrok.io/'));
                            if (response.statusCode == 200) {
                            is_api_con = true;
                            return 'api is works';
                          }
                          }catch (error){
                            print('api not working');
                            is_api_con = false;
                            return "api not working";
                          }
                          
                          
                        }
                        is_api_con = false;
                        return "api not working";
                        
                      }
              await fetchApi();  
              // print("test $is_cam_con");
              //_showTemperature(context);
              ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.black,
                      content: Center(
                      child: 
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          
                          FaIcon(FontAwesomeIcons.solidUser,color: Colors.blue,),
                          SizedBox(height: 10),
                          FaIcon(globals.isLoggedIn?
                            FontAwesomeIcons.solidCheckCircle:
                            FontAwesomeIcons.solidTimesCircle,
                            color: globals.isLoggedIn?
                            Colors.green:
                            Colors.red,),
                            
                          SizedBox(height: 10),
                          
                          FaIcon(FontAwesomeIcons.server,color: Colors.blue),
                          SizedBox(height: 10),
                          FaIcon(is_api_con?
                            FontAwesomeIcons.solidCheckCircle:
                            FontAwesomeIcons.solidTimesCircle,
                            color: is_api_con?
                            Colors.green:
                            Colors.red,),
                            
                          SizedBox(height: 10),
                          
                          FaIcon(FontAwesomeIcons.robot,color: Colors.blue),
                          SizedBox(height: 10),
                          
                          FaIcon(is_spot_con?
                            FontAwesomeIcons.solidCheckCircle:
                            FontAwesomeIcons.solidTimesCircle,
                            color: is_spot_con?
                            Colors.green:
                            Colors.red,),
                            
                          SizedBox(height: 10),
                          
                          FaIcon(FontAwesomeIcons.video,color: Colors.blue),
                          SizedBox(height: 10),
                          
                          FaIcon(is_cam_con?
                            FontAwesomeIcons.solidCheckCircle:
                            FontAwesomeIcons.solidTimesCircle,
                            color: is_cam_con?
                            Colors.green:
                            Colors.red,),
                            
                          SizedBox(height: 10),
                          
                          FaIcon(FontAwesomeIcons.batteryFull,color: Colors.blue),
                          SizedBox(height: 10),
                          // Text(is_spot_con?battery+' %':'- ',style: 
                          // TextStyle(
                          //   fontSize: 20,
                          //   fontWeight: FontWeight.bold,
                          //   color: Colors.blue
                          //   ),
                          // ),
                          RichText(text: TextSpan(
                            children: [
                              TextSpan(
                                text: is_spot_con?battery:'-',
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
                          SizedBox(height: 10),
                          FaIcon(FontAwesomeIcons.temperatureHigh,color: Colors.blue),
                          SizedBox(height: 10),
                          Text(is_spot_con?temp+' °':'- °',
                          style: 
                          TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue
                            ),
                          ),
                        ],
                      )
                      )
                      ),
                  );
            }, 
            icon: FaIcon(FontAwesomeIcons.robot,color: Colors.blue,)
            )
            ,
             globals.isLoggedIn?IconButton(
              icon: FaIcon(FontAwesomeIcons.signOutAlt,color: Colors.blue,),
              onPressed: (){
                globals.isLoggedIn = false;
                globals.API_IP = "";
                globals.IP = "";
                globals.username = "";
                globals.password = "";
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BottomNavScreen(pages_index: 3,)),
                );
              },
            ):SizedBox(height:0)
            // IconButton(
            //   icon: 
            //   CircleAvatar( 
            //     backgroundColor: Colors.brown.shade800,
            //     child: Text('TS'),)
            //   ,
            //   onPressed: (){
            //   print('profile');
            // }), 
            
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  
  void _showBattery(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Battery Alert!!"),
          content: new Text("80 %"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  void _showTemperature(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Temperature Alert!!"),
          content: new Text("34 °"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  void _showSpotStatus(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Connection Alert!!"),
          content: new Text("Connected"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  void _showPayload(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Payload Alert!!"),
          content: new Text("Connected"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class CitySearch extends SearchDelegate<String> {
  final cities = [
    'CHANEL',
    'DIOR',
    'PRADA',
    'LOUIS VUITTON',
    'MCM',
  ];

  final recentCities = [
    'CHANEL',
    'DIOR',
    'PRADA',
  ];

  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            if (query.isEmpty) {
              close(context, "");
            } else {
              query = '';
              showSuggestions(context);
            }
          },
        )
      ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => close(context, ""),
      );

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_bag, size: 120),
            const SizedBox(height: 48),
            Text(
              query,
              style: TextStyle(
                color: Colors.black,
                fontSize: 64,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty
        ? recentCities
        : cities.where((city) {
            final cityLower = city.toLowerCase();
            final queryLower = query.toLowerCase();

            return cityLower.startsWith(queryLower);
          }).toList();

    return buildSuggestionsSuccess(suggestions);
  }

  Widget buildSuggestionsSuccess(List<String> suggestions) => ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];
          final queryText = suggestion.substring(0, query.length);
          final remainingText = suggestion.substring(query.length);

          return ListTile(
            onTap: () {
              query = suggestion;

              // 1. Show Results
              showResults(context);

              // 2. Close Search & Return Result
              // close(context, suggestion);

              // 3. Navigate to Result Page
              //  Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (BuildContext context) => ResultPage(suggestion),
              //   ),
              // );
            },
            leading: Icon(Icons.shopping_bag),
            // title: Text(suggestion),
            title: RichText(
              text: TextSpan(
                text: queryText,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                children: [
                  TextSpan(
                    text: remainingText,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
}