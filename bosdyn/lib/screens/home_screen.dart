import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
//import 'package:flutter_covid_dashboard_ui/config/palette.dart';
//import 'package:flutter_covid_dashboard_ui/config/styles.dart';
//import 'package:flutter_covid_dashboard_ui/data/data.dart';
import 'package:bosdyn/widgets/widgets.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:swipedetector/swipedetector.dart';
import 'package:bosdyn/screens/screens.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:bosdyn/globals.dart' as globals;
import 'package:http/http.dart' as http;
// import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:material_dropdown_formfield/material_dropdown_formfield.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase/firebase.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _myActivity = '';
  String _myActivityResult = '';
  FSBStatus status = FSBStatus.FSB_CLOSE;
  FocusNode focusNode = FocusNode();
  List dataSource = [
    {
      "display": "English",
      "value": "en",
    },
    {
      "display": "Thai",
      "value": "th",
    },
  ];
  @override
  void initState() {
    super.initState();
    _myActivity = '';
    _myActivityResult = '';
  }
  
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    api();
    FSBStatus drawerStatus;
    return SafeArea(
      child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: CustomAppBar(),
      body: SwipeDetector(
        onSwipeRight: (){
          setState(() {
            status = FSBStatus.FSB_OPEN;
          });
        } ,
        onSwipeLeft: (){
          setState(() {
            status = FSBStatus.FSB_CLOSE;
          });
        },
        child: FoldableSidebarBuilder(
        status: status,drawer: CustomDrawer(),screenContents:
        CustomScrollView(
          physics: ClampingScrollPhysics(),
          slivers: <Widget>[
            _buildHeader(screenHeight),
            _buildForm(screenHeight),
            _buildResultFromText(screenHeight),
            //_buildPreventionTips(screenHeight),
            //_buildTopBrandsContent(screenHeight),
            //_buildYourStyle(screenHeight),
            //_buildYourStyleContent(screenHeight),
          ],
        ),
        drawerBackgroundColor: Colors.black,)
        ),
        floatingActionButton: FloatingActionButton(
        onPressed: (){
        setState(() {
          status = status == FSBStatus.FSB_OPEN?FSBStatus.FSB_CLOSE:FSBStatus.FSB_OPEN;
        });
      },child: FaIcon(FontAwesomeIcons.bars,color: Colors.black,),),
    )
    );
  }
  
  SliverToBoxAdapter _buildHeader(double screenHeight) {
    var username = "";
    var passwords = "";
    var ip="";
    var api_ip = "";
    return SliverToBoxAdapter(
      child: Container(
        child: Center(
          child: 
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(FontAwesomeIcons.robot,color: Colors.blue),
                  SizedBox(
                    width: 10,
                  ),
                  Text("LET SPOT SPEAK",style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),),
                  SizedBox(
                    width: 10,
                  ),
                  globals.isSpotCon?FaIcon(
                  FontAwesomeIcons.solidCheckCircle,
                  color: Colors.green,):
                  FaIcon(
                  FontAwesomeIcons.solidTimesCircle,
                  color: Colors.red,),
                  SizedBox(
                    width: 10,
                  ),
                  FaIcon(FontAwesomeIcons.commentAlt,color: Colors.blue),
                ],
              ),
          )
          )
    );
  }

  SliverToBoxAdapter _buildForm(double screenHeight) {
    var username = "";
    var passwords = "";
    var ip="";
    var api_ip = "";
    var statement = "";
    return SliverToBoxAdapter(
      child: Container(
        child: Center(
          child: 
          !globals.isLoggedIn?
          // Text('Usename : '+globals.username
          // +'\n'+'IP Address : '+globals.IP
          // +'\n'+'API IP Address : '+globals.API_IP,
          // style: TextStyle(
          //   fontSize: 20),)
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight*0.02,),
              Text("Please make sure!!\nLogin with correct username and password\nAPI Service Available\nFill API KEYS correctly",
              textAlign: TextAlign.center,
              style: TextStyle(
                    color: Colors.orange,
                    fontSize: 18,
                    //backgroundColor: Colors.blue,
                    fontWeight: FontWeight.bold
                  ),),
              
              SizedBox(height: screenHeight*0.01,),
              SizedBox(height: screenHeight*0.01,),
              SizedBox(height: screenHeight*0.01,),
              // FaIcon(FontAwesomeIcons.server,color: Colors.blue),
              SizedBox(height: screenHeight*0.01,),
              
            ],
          )
          :Form(
            key: _formKey,
            child: Column(
            children: [
              SizedBox(height: 20,),
              
              Center(
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  FaIcon(FontAwesomeIcons.commentAlt,color: Colors.blue),
                  SizedBox(width: 20,),Text("TYPING TO LET SPOT SPEAK",style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),),
                  SizedBox(
                    width: 10,
                  ),
                  FaIcon(FontAwesomeIcons.commentAlt,color: Colors.blue),
                ]
              ),
              ),
              SizedBox(height: 20,),
              Container(
                width: 300,
                child: 
                TextFormField(
                scrollPadding: const EdgeInsets.all(20.0),
                style: TextStyle(
                  color: Colors.blue,
                  ),
                decoration: const InputDecoration(
                  // icon: FaIcon(FontAwesomeIcons.commentAlt),
                  hintText: 'Hello am a Spot',
                  labelText: 'What do you want the spot to says? *',
                  labelStyle: TextStyle(
                    color: Colors.blue,
                    decorationColor: Colors.blue
                  ),
                  hintStyle: TextStyle(
                    color: Colors.blue
                  ),
                  // fillColor: Colors.blue,
                  // filled: true
                  //contentPadding: EdgeInsets.all(10)
                ),
                onSaved: (String? value) {
                  statement = value!;
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty || value.length<1) {
                    return 'Please enter some text';
                  }
                  else {
                    if(value.contains(RegExp(r'[A-Z]||[0-9]'))){
                      return null;
                    }
                    else{
                      return 'Please contain a character to let the spot speak';
                    }
                  }
                  return null;
                  //return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                },
              ),
              ),
              SizedBox(height: 15,)
              ,
              DropDownFormField(
                  autovalidate: true,
                    validator: (value) {
                      if (value == '') {
                        return "can't be empty";
                      }
                      if (value == 'Swimming') {
                        return 'Swimming Not Allowed!';
                      } else {
                        return null;
                      }
                    },
                    innerBackgroundColor: Colors.black,
                    wedgeIcon: Icon(Icons.keyboard_arrow_down),
                    wedgeColor: Colors.lightBlue,
                    innerTextStyle: TextStyle(color: Colors.blue),
                    focusNode: focusNode,
                    inputDecoration: OutlinedDropDownDecoration(
                        labelStyle: TextStyle(color: Colors.blue),
                        labelText: "Languages",
                        borderColor: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                        
                        ),
                    hintText: 'Please choose one',
                    value: _myActivity,
                    onSaved: (value) {
                      setState(() {
                        _myActivity = value;
                        globals.lang = value;
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        _myActivity = value;
                      });
                    },
                    dataSource: dataSource,
                    textField: 'display',
                    valueField: 'value',
                ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                    if (_formKey.currentState!.validate()) {
                       _formKey.currentState?.save();
                       globals.statement = statement;
                       setState(() {
                        _myActivityResult = _myActivity;
                      });
                       print(statement);
                       api();
                         Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BottomNavScreen(pages_index: 0,)),
                          );
                    }
                  },
                  child: 
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      children: [
                        TextSpan(
                                text: "Speak ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  )
                              ),
                        WidgetSpan(
                          child: FaIcon(FontAwesomeIcons.commentAlt,color: Colors.black),
                        )
                      ]
                    ),
                  )
                ),
              ),
              
            ],
          )
            
          )
          
          )
      )
    );
  }
  
  SliverToBoxAdapter _buildResultFromText(double screenHeight) {
      var username = "";
      var passwords = "";
      var ip="";
      var api_ip = "";
      late var r = globals.SayByTextContent;
      return SliverToBoxAdapter(
        child: Container(
          child: Center(
            child: 
              globals.isLoggedIn?
              Column(
                children: [
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.robot,color: Colors.blue),
                      SizedBox(
                        width: 10,
                      ),
                      Text(globals.SayByTextResult==""?"RESULT":globals.SayByTextResult,style: TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                        fontWeight: FontWeight.bold
                      ),),
                      SizedBox(
                        width: 10,
                      ),
                      globals.SayByTextStatus?FaIcon(
                      FontAwesomeIcons.solidCheckCircle,
                      color: Colors.green,):
                      FaIcon(
                      FontAwesomeIcons.solidTimesCircle,
                      color: Colors.red,),
                      SizedBox(
                        width: 10,
                      ),
                      FaIcon(FontAwesomeIcons.robot,color: Colors.blue),
                    ],
                    ),
                    SizedBox(height: 20,)
                    ,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(FontAwesomeIcons.commentAlt,color: Colors.blue),
                        SizedBox(
                          width: 10,
                        ),
                        Text(globals.statement==""?"CONTENT":globals.statement,
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                          fontWeight: FontWeight.bold
                        ),),
                        SizedBox(
                          width: 10,
                        ),
                        globals.SayByTextStatus?FaIcon(
                        FontAwesomeIcons.solidCheckCircle,
                        color: Colors.green,):
                        FaIcon(
                        FontAwesomeIcons.solidTimesCircle,
                        color: Colors.red,),
                        SizedBox(
                          width: 10,
                        ),
                        FaIcon(FontAwesomeIcons.commentAlt,color: Colors.blue),
                      ],
                    ),
                ],
              ):SizedBox(height:0)
              
            )
            )
      );
    }

  void api() async{
              Future<String> fetchApi() async {
                        print("AM IN SPEAK API");
                        if(globals.isLoggedIn==true){
                          print(globals.lang);
                          // globals.isApiCon = false;
                          // globals.isCamCon = false;
                          // globals.isSpotCon = false;
                          // globals.Temp = "";
                          // globals.battery="";
                          String api_url = globals.API_IP;
                          String url =  'https://'+api_url+'.ngrok.io/speak';
                          globals.justSayByText = true;
                          try{
                            final response = await  http.post(
                              Uri.parse(url),
                              headers: <String, String>{
                                'Content-Type': 'application/json; charset=UTF-8',
                              },
                              body: jsonEncode(<String, String>{
                                'user': globals.username,
                                'password':globals.password,
                                'ip':globals.IP,
                                'statement':globals.statement,
                                'lang':globals.lang
                              }),
                            );
                            if (response.statusCode == 200) {
                              
        
                              var api_result = jsonDecode(response.body);
                              print(api_result);
                              globals.SayByTextResult = api_result['issue'];
                              globals.SayByTextContent = globals.statement;
                              globals.SayByTextStatus = api_result['result'];
                              print(globals.SayByTextContent);
                              // globals.battery = api_result['battery'].toString();
                              // globals.Temp =  api_result['temperature'].toString();
                              // globals.isSpotCon = api_result['spot'];
                              // globals.isCamCon = api_result['payload'];
                              globals.statement = "";
                              globals.isApiCon = true;
                              return "work";
                              } 
                          }catch (error){
                            print("post error");
                          }
                          
                          
                          
                        }
                        globals.isApiCon = false;
                        print('api not working');
                        return "api not working";
                        
                      }
          await fetchApi();  
  }

}