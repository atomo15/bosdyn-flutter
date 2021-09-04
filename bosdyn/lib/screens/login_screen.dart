import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:bosdyn/widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:bosdyn/globals.dart' as globals;
import 'package:bosdyn/screens/screens.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:swipedetector/swipedetector.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({ Key? key }) : super(key: key);

  @override
  _Login_ScreenState createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FSBStatus status = FSBStatus.FSB_CLOSE;
  
  @override
  Widget build(BuildContext context) {
    api();
    FSBStatus drawerStatus;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Colors.black,
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
            _buidTitle(screenHeight),
            _buildForm(screenHeight),
          ]
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
    )
    ;
  }
  SliverToBoxAdapter _buidTitle(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        child: Center(
          child: 
          Column(
            children: [
              SizedBox(height: 20,),
              Text(globals.isLoggedIn?"ACCOUNT":
                  "LOGIN",
                  style: 
                  TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    ),
                  ),
              SizedBox(height: 20,),
            ],
          )
          
         
          )
      )
    );
  }
  SliverToBoxAdapter _buildForm(double screenHeight) {
    var username = "";
    var passwords = "";
    var ip="";
    var api_ip = "";
    return SliverToBoxAdapter(
      child: Container(
        child: Center(
          child: 
          globals.isLoggedIn?
          // Text('Usename : '+globals.username
          // +'\n'+'IP Address : '+globals.IP
          // +'\n'+'API IP Address : '+globals.API_IP,
          // style: TextStyle(
          //   fontSize: 20),)
          Column(
            children: [
              
              FaIcon(FontAwesomeIcons.userAlt,color: Colors.blue),
              SizedBox(height: screenHeight*0.01,),
              Container(
                //width: MediaQuery.of(context).size.width*0.5,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5)
                    )
                  ),
                child: Text(
                      ' '+globals.username+' ',
                      style: 
                      TextStyle(
                        //backgroundColor: Colors.green,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      ),
              ),
              
              SizedBox(height: screenHeight*0.01,),

              FaIcon(FontAwesomeIcons.robot,color: Colors.blue),
              SizedBox(height: screenHeight*0.01,),
              Container(
                //width: MediaQuery.of(context).size.width*0.5,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5)
                    )
                  ),
                child: Text(
                        ' '+globals.IP+' ',
                        style: 
                        TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
              ),
              
              SizedBox(height: screenHeight*0.01,),
              FaIcon(FontAwesomeIcons.server,color: Colors.blue),
              SizedBox(height: screenHeight*0.01,),
              Container(
                //width: MediaQuery.of(context).size.width*0.5,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5)
                    )
                  ),
                child: Text(
                        ' '+globals.API_IP+' ',
                        style: 
                        TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      )
              ),
              
              
            ],
          )
          :Form(
            key: _formKey,
            child: Column(
            children: [
              SizedBox(height: 20,),
              FaIcon(FontAwesomeIcons.robot,size: screenHeight*0.1,color: Colors.blue,),
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
                  //icon: Icon(Icons.person),
                  hintText: 'username',
                  labelText: 'username *',
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
                  username = value!;
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                  //return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                },
              ),
              ),
              SizedBox(height: 20,),
              
              Container(
                width: 300,
                child: TextFormField(
                scrollPadding: const EdgeInsets.all(20.0),
                style: TextStyle(
                  color: Colors.blue,
                  ),
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'password',
                  labelText: 'password *',
                  labelStyle: TextStyle(
                    color: Colors.blue
                  ),
                  hintStyle: TextStyle(
                    color: Colors.blue
                  ),
                  // suffixIcon: Padding(
                  //   padding: const EdgeInsetsDirectional.only(top: 20.0,start:10),
                  //   child: FaIcon(FontAwesomeIcons.eye),),
                ),
                onSaved: (String? value) {
                  //print('Submit ${value}');
                  passwords = value!;
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                  
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                  //return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                },
              ),
              ),
              SizedBox(height: 20,),
              Container(
                width: 300,
                child: TextFormField(
                scrollPadding: const EdgeInsets.all(20.0),
                style: TextStyle(
                  color: Colors.blue,
                  ),
                decoration: const InputDecoration(
                  //icon: Icon(Icons.person),
                  hintText: '192.168.80.3',
                  labelText: 'IP Address *',
                  labelStyle: TextStyle(
                    color: Colors.blue
                  ),
                  hintStyle: TextStyle(
                    color: Colors.blue
                  ),
                  //contentPadding: EdgeInsets.all(10)
                ),
                onSaved: (String? value) {
                  if(value=='default'){
                    ip = '192.168.80.3';
                  }
                  else{
                    ip = value!; 
                  }
                },
                validator: (String? value) {
                  if(value == null || value.isEmpty){
                    return 'Please enter some text';                    
                  }
                  else{
                    if(value=='default'){
                      ip = "192.168.80.3";
                    }else{
                      var dot = 0;
                      for(var i =0;i<value.length;i++){
                        if(value[i]=='.'){
                          if(dot<3){
                            dot++;
                          }
                          return '. cannot have more than 3';
                        }
                      }
                    }
                  }
                  return null;
                },
              ),
              ),
              SizedBox(height: 20,),
              Container(
                width: 300,
                child: TextFormField(
                scrollPadding: const EdgeInsets.all(20.0),
                style: TextStyle(
                  color: Colors.blue,
                  ),
                decoration: const InputDecoration(
                  //icon: Icon(Icons.person),
                  hintText: '192.168.80.3',
                  labelText: 'API KEYS *',
                  labelStyle: TextStyle(
                    color: Colors.blue
                  ),
                  hintStyle: TextStyle(
                    color: Colors.blue
                  ),
                  //contentPadding: EdgeInsets.all(10)
                ),
                onSaved: (String? value) {
                  api_ip = value!;
                },
                validator: (String? value) {
                  if(value == null || value.isEmpty){
                    return 'Please enter some text';                    
                  }
                  return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                },
              ),
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
                       print(globals.isLoggedIn);
                       globals.isLoggedIn = true;
                       globals.username = username;
                       globals.password = passwords;
                       globals.IP = ip;
                       globals.API_IP = api_ip;
                       globals.statement = "";
                       
                       print('check ip');
                       print(globals.IP);
                         Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BottomNavScreen(pages_index: 3,)),
                          );
                      //  Future<String> fetchAlbum() async {
                      //    print("AM IN");
                      //   final response = await http
                      //       .get(Uri.parse('https://7325-161-130-189-212.ngrok.io/api'));

                      //   if (response.statusCode == 200) {
                      //     // If the server did return a 200 OK response,
                      //     // then parse the JSON.
                      //     //return Album.fromJson(jsonDecode(response.body));
                      //     print(response.body);
                      //     return "work";
                      //   } else {
                      //     // If the server did not return a 200 OK response,
                      //     // then throw an exception.
                      //     throw Exception('Failed to load album');
                      //   }
                      // }
                      // fetchAlbum();
                      //  print("Result Form : "+username+passwords+ip+api_ip);
                       //Text(username+passwords+ip+api_ip);
                    }
                  },
                  child: const Text('Login'),
                ),
              ),
              
            ],
          )
            
          )
          
          )
      )
    );
  }
}
