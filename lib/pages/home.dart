import 'package:flutter/material.dart';
import 'package:project/components/floatingButton.dart';
import 'package:project/components/weekBar.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<String> daysOfWeek = [
    'Sun', 'Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat'
  ];

  final List<String> hoursOfDay = List.generate(24, (index) {
    if (index == 0) {
      return '12 AM';
    } else if (index == 12) {
      return '12 NN';
    } else if (index < 12) {
      return '${index} AM';
    } else {
      return '${index - 12} PM';
    }
  });

  int selectedDayIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          DaysOfWeekBar(
            daysOfWeek: daysOfWeek,
            initialSelectedIndex: selectedDayIndex,
            onDaySelected: (index) {
              setState(() {
                selectedDayIndex = index;
              });
            },
          ),
          Expanded(
            child: PageView.builder(
              scrollDirection: Axis.vertical,
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
      floatingActionButton: const CustomFloatingActionButton(),
    );
  }
}
