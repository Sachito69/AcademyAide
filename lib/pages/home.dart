import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:project/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:project/pages/settings.dart';



class Homepage extends StatelessWidget {
  final List<String> daysOfWeek = [
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thur',
    'Fri',
    'Sat'
  ];

final List<String> hoursOfDay = List.generate(25, (index) 
{ if (index == 0) { return '1 AM'; } 
else if (index == 12) { return '12 NN'; } 
else if (index < 12) { return '${index +1} AM'; }
 else { return '${index - 12} PM'; } });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
          
            height: 70.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: daysOfWeek.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 70.0,
                  margin: const EdgeInsets.all(3.0),
                  
                  child: Center(
                    child: Text(
                      daysOfWeek[index],
                      style: const TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: hoursOfDay.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(hoursOfDay[index]),
                );
              },
            ),
          ),
        ],
      ),
     floatingActionButton: SpeedDial(
  backgroundColor: Colors.deepOrange,
  animatedIcon: AnimatedIcons.menu_close,
  overlayColor: Colors.black,
  overlayOpacity: 0.4,
  children: [
   /* 
   SpeedDialChild(
      child: Icon(Icons.sunny),
      label: 'Dark Mode',
      onTap: () {
        Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
      },
    ),
    */

    SpeedDialChild(
      child: Icon(Icons.add),
      label: 'Add',
      onTap: () {
        print('add pressed!');
      },
    ),
    SpeedDialChild(
      child: Icon(Icons.logout),
      label: 'Log out',
      onTap: () {
        Navigator.pushNamed(context, '/login');
      },
    ),
    SpeedDialChild(
      child: Icon(Icons.settings),
      label: 'Settings',
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true, // Allows the modal to be more freely sized
          backgroundColor: Colors.transparent, // Makes the background transparent
          builder: (context) {
            return SettingsModal(); // Call the SettingsModal class here
          },
        );
      },
    ),
  ],
)
);
  }}