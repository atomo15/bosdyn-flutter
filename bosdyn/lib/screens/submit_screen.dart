import 'dart:ui';

import 'package:flutter/material.dart';
//import 'package:flutter_covid_dashboard_ui/config/palette.dart';
//import 'package:flutter_covid_dashboard_ui/config/styles.dart';
//import 'package:flutter_covid_dashboard_ui/data/data.dart';
import 'package:bosdyn/widgets/widgets.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:favorite_button/favorite_button.dart';

class SubmitScreen extends StatefulWidget {
  @override
  _SubmitScreenState createState() => _SubmitScreenState();
}

class _SubmitScreenState extends State<SubmitScreen> {

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          //_buildHeader(screenHeight),
          //_buildImageShow(screenHeight),
          _buidSubmitTitle(screenHeight),
          _buidSubmitOption(screenHeight),
          _buidSubmitButton(screenHeight),
          //_buildTopBrandsContent(screenHeight),
          //_buildYourStyle(screenHeight),
          //_buildYourStyleContent(screenHeight),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildHeader(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // Text(
                //   'Verity',
                //   style: const TextStyle(
                //     color: Colors.white,
                //     fontSize: 25.0,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // CountryDropdown(
                //   countries: ['CN', 'FR', 'IN', 'IT', 'UK', 'USA'],
                //   country: _country,
                //   onChanged: (val) => setState(() => _country = val),
                // ),
              ],
            ),
            // SizedBox(height: screenHeight * 0.03),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'What are you looking for?',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                 SizedBox(height: screenHeight * 0.005),
                // Text(
                //   'If you feel sick with any COVID-19 symptoms, please call or text us immediately for help',
                //   style: const TextStyle(
                //     color: Colors.white70,
                //     fontSize: 15.0,
                //   ),
                // ),
                //SizedBox(height: screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton.icon(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                      onPressed: () {},
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      icon: const Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Call Now',
                        // style: Styles.buttonTextStyle,
                      ),
                      textColor: Colors.white,
                    ),
                    FlatButton.icon(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                      onPressed: () {},
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      icon: const Icon(
                        Icons.chat_bubble,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Send SMS',
                        // style: Styles.buttonTextStyle,
                      ),
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buidSubmitTitle(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child:Text(
              'Speaker',
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            ),
            
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
  
    SliverToBoxAdapter _buidSubmitOption(double screenHeight) {
    return SliverToBoxAdapter(
      child: Center(
        //padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                  children: [
                    IconButton(onPressed: (){
                    }, icon: Text(
                      "1"
                    )),
                    
                    Text('Item Info')
                  ],
                ),
                Column(
                  children: [
                    IconButton(onPressed: (){
                    }, icon: Text(
                      "2"
                    )),
                    
                    Text('Item Info')
                  ],
                ),
              ],
            ),
            
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
  
  SliverToBoxAdapter _buidSubmitButton(double screenHeight) {
    return SliverToBoxAdapter(
      child: Center(
        //padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                  children: [
                    FlatButton.icon(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                      onPressed: () {},
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      icon: const Icon(
                        Icons.chat_bubble,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Self-delivery',
                        // style: Styles.buttonTextStyle,
                      ),
                      textColor: Colors.white,
                    ),
                  ],
                ),
                
              ],
            ),
            
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildTopBrandsContent(double screenHeight) {
    var brand_list = ['channel-logo','dior-logo','prada-logo','louis_vuitton'];
    List<Widget> brands_list = [];
    for(var i =0;i<brand_list.length;i++){
      brands_list.add(brands(context, brand_list[i]));
    }
    return SliverToBoxAdapter(
      child: Container(
        // margin: const EdgeInsets.symmetric(
        //   vertical: 10.0,
        //   horizontal: 50.0,
        // ),
        padding: const EdgeInsets.all(10.0),
        height: screenHeight * 0.15,
         width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFAD9FE4), Colors.amber],
          ),
          borderRadius: BorderRadius.circular(0.0),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5.0),
          height: 300.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            // children: <Widget>[
            //   Row(children: brands_list),
            // ],
            children: brands_list,
          ),
        ),
        // child: Container(
        //     height: 130,
        //     child: ListView(
        //       scrollDirection: Axis.horizontal,
        //       padding: EdgeInsets.only(left: 16),
        //       physics: BouncingScrollPhysics(),
        //       children: <Widget>[
        //         _buildSymptomItem("images/channel-logo.png", "Channel"),
        //         _buildSymptomItem("images/dior-logo.png", "Dior"),
        //         _buildSymptomItem("images/prada-logo.png", "Prada"),
        //       ],
        //     ),
        //   ),
      ),
    );
  }
  
  
  SliverToBoxAdapter _buildYourStyle(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Your Style',
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 5.0),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: prevention
            //       .map((e) => Column(
            //             children: <Widget>[
            //               Image.asset(
            //                 e.keys.first,
            //                 height: screenHeight * 0.12,
            //               ),
            //               SizedBox(height: screenHeight * 0.015),
            //               Text(
            //                 e.values.first,
            //                 style: const TextStyle(
            //                   fontSize: 16.0,
            //                   fontWeight: FontWeight.w500,
            //                 ),
            //                 textAlign: TextAlign.center,
            //               )
            //             ],
            //           ))
            //       .toList(),
            // ),
          ],
        ),
      ),
    );
  }
  
  SliverToBoxAdapter _buildYourStyleContent(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 0.0,
        ),
        padding: const EdgeInsets.all(10.0),
        height: screenHeight * 0.40,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFAD9FE4), Colors.amber],
          ),
          borderRadius: BorderRadius.circular(0.0),
        ),
        child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SingleChildScrollView( 
                child: Wrap(
                children: [
                  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: screenHeight * 0.02),
                Row(
                  children: [
                    const SizedBox(width:100.0),
                    FavoriteButton(
                        isFavorite: true,
                        // iconDisabledColor: Colors.white,
                        valueChanged: (_isFavorite) {
                          print('Is Favorite : $_isFavorite');
                        },
                      ),
                  ],
                ),
                Image.asset('images/prada_overalls.webp',height: 150,width: 200,),
                Text(
                  'Prada',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'Overalls\nM International',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                  maxLines: 2,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: screenHeight * 0.02),
                Row(
                  children: [
                    const SizedBox(width:100.0),
                    FavoriteButton(
                        isFavorite: true,
                        // iconDisabledColor: Colors.white,
                        valueChanged: (_isFavorite) {
                          print('Is Favorite : $_isFavorite');
                        },
                      ),
                  ],
                ),
                Image.asset('images/chanel_classic.jpeg',height: 150,width: 200,),
                Text(
                  'Chanel',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'Classic WOC\nM International',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                  maxLines: 2,
                ),
              ],
            ),
                ],
              )
              )
            ],
            ),
      ),
    );
  }
   SliverToBoxAdapter _buildImageShow(double screenHeight) {
     List<NetworkImage> images = [];
      List<String> url = ['https://firebasestorage.googleapis.com/v0/b/my-bot-5849f.appspot.com/o/louis.jpg?alt=media&token=fc0d987a-94cc-4291-a579-bf6fb87abe19',
      'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg',
      'https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg',
      ];
      List<Image> images_list = [];
      List<String> images_file = [
        'chanel-bg.webp',
        'dior-bg.webp'
      ];
      
      for(var i=0;i<images_file.length;i++){
        images_list.add(Image.asset('images/'+images_file[i],fit: BoxFit.cover,));
      }
      for(var i=0;i<url.length;i++){
        images.add(NetworkImage(url[i]));
      }
    
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 0,
        ),
        //padding: const EdgeInsets.all(10.0),
        height: screenHeight * 0.25,
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     colors: [Colors.blue, Colors.amber],
        //   ),
        //   borderRadius: BorderRadius.all(Radius.circular(20.0)),
        // ),
        child: Carousel(
                boxFit: BoxFit.fill,
                autoplay: true,
                animationCurve: Curves.fastOutSlowIn,
                animationDuration: Duration(milliseconds: 3000),
                dotSize: 6.0,
                dotIncreasedColor: Colors.blueAccent,
                dotBgColor: Colors.transparent,
                dotPosition: DotPosition.bottomRight,
                dotVerticalPadding: 10.0,
                showIndicator: true,
                indicatorBgPadding: 7.0,
                images: images_list
                ),
      ),
    );
   }
   Widget _buildSymptomItem(String path, String text) {
    return Column(
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            gradient: LinearGradient(
              colors: [
                //AppColors.backgroundColor,
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            border: Border.all(color: Colors.white),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(1, 1),
                spreadRadius: 1,
                blurRadius: 3,
              )
            ],
          ),
          padding: EdgeInsets.only(top: 15),
          child: Image.asset(path),
          margin: EdgeInsets.only(right: 20),
        ),
        SizedBox(height: 7),
        Text(
          text,
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
  @override
  Widget brands(BuildContext context, String filename) {
    //print(filename);
    var s = filename.split('-');
    return Center(
              child: Card(
                //  shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(10.0),
                //   ),
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    print('Card '+ s[0] +' tapped.');
                  },
                  // border:OutlinedBorder(
                  //    borderRadius: BorderRadius.circular(10.0),
                  // ),
                  child: Image.asset('images/'+filename+'.png',width: 100,height: 200,fit: BoxFit.contain),
                  // child: const SizedBox(
                  //   width: 100,
                  //   height: 100,
                  //   child: Container(
                  //    child: Image.asset('images/channel-logo.png',fit: BoxFit.contain),
                  //   ),  
                  ),
                ),
              );
  }
  @override
  Widget StyleCard(BuildContext context, String filename,double screenHeight) {
    //print(filename);
    var s = filename.split('-');
    return Center(
              child: Card(
                //  shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(10.0),
                //   ),
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    print('Card '+ s[0] +' tapped.');
                  },
                  child: Wrap(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height:20.0),
                    Row(
                      children: [
                        const SizedBox(width:200.0),
                        FavoriteButton(
                            isFavorite: true,
                            // iconDisabledColor: Colors.white,
                            valueChanged: (_isFavorite) {
                              print('Is Favorite : $_isFavorite');
                            },
                          ),
                      ],
                    ),
                    Image.asset('images/prada_overalls.webp',height: 150,width: 200,),
                    Text(
                      'Prada',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      'Overalls\nM International',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                      maxLines: 2,
                    ),
                  ],
                ),
              ],
            ),
                  ),
                ),
              );
  }

}