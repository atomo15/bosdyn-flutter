import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:bosdyn/widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({ Key? key }) : super(key: key);

  @override
  _Login_ScreenState createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          _buidTitle(screenHeight),
          _buildForm(screenHeight),
        ]
      )
    );
  }
  SliverToBoxAdapter _buidTitle(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        child: Center(
          child: 
          Column(
            children: [
              SizedBox(height: 20,),
              Text(
                  "Login",
                  style: 
                  TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
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
    return SliverToBoxAdapter(
      child: Container(
        child: Center(
          child: 
          Column(
            children: [
              SizedBox(height: 20,),
              Container(
                width: 300,
                child: TextFormField(
                scrollPadding: const EdgeInsets.all(20.0),
                decoration: const InputDecoration(
                  //icon: Icon(Icons.person),
                  hintText: 'username',
                  labelText: 'username *',
                  //contentPadding: EdgeInsets.all(10)
                ),
                onSaved: (String? value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                validator: (String? value) {
                  return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                },
              ),
              ),
              SizedBox(height: 20,),
              Container(
                width: 300,
                child: TextFormField(
                scrollPadding: const EdgeInsets.all(20.0),
                decoration: const InputDecoration(
                  //icon: Icon(Icons.person),
                  hintText: 'password',
                  labelText: 'password *',
                  //contentPadding: EdgeInsets.all(10)
                ),
                onSaved: (String? value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                validator: (String? value) {
                  return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                },
              ),
              ),
              SizedBox(height: 20,),
              Container(
              margin: EdgeInsets.all(20),
              child: FlatButton(
                child: Text('Login'),
                color: Colors.blueAccent,
                textColor: Colors.white,
                onPressed: () {},
              ),
            ),
              
            ],
          )
          )
      )
    );
  }
}
