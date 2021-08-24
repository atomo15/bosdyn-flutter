import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:flutter_covid_dashboard_ui/config/palette.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      //backgroundColor: Palette.primaryColor,
      backgroundColor: Colors.amber,
      elevation: 0.0,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        iconSize: 28.0,
        onPressed: () {},
      ),
      title: Center(
        child: Text(
                  'BOSDYN',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        )
      ,
      actions: <Widget>[
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            //   child: TextFormField(
            //     decoration: InputDecoration(
            //       prefixIcon: Icon(Icons.search_rounded),
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(30.0),
            //       ),
            //       //labelText: 'Enter your username',
            //       // hintText: 'search',
            //       suffixIcon: Icon(Icons.photo_rounded),
            //     ),
                
            //   ),
            // ),
            
            // IconButton(
            //   icon: const Icon(Icons.search_rounded),
            //   iconSize: 28.0,
            //   onPressed: () {
            //     showSearch(context: context, delegate: CitySearch());
            //   },
            // ),
            IconButton(
              onPressed: (){
              _showPayload(context);
            }, 
            icon: FaIcon(FontAwesomeIcons.video)
            )
            ,
            IconButton(
              onPressed: (){
              _showSpotStatus(context);
            }, 
            icon: FaIcon(FontAwesomeIcons.robot)
            )
            ,
            IconButton(
              onPressed: (){
              _showBattery(context);
            }, 
            icon: FaIcon(FontAwesomeIcons.batteryFull)
            )
            ,
            IconButton(
              onPressed: (){
              _showTemperature(context);
            }, 
            icon: FaIcon(FontAwesomeIcons.thermometerThreeQuarters)
            )
            ,
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