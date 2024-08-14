import 'package:flutter/material.dart';
import 'package:project/components/floatingButton.dart';
import 'package:project/components/weekBar.dart';
import 'package:intl/intl.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<String> daysOfWeek = [
    'Sun', 'Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat'
  ];

  // Generate a list of the next 30 days starting from today
  final List<DateTime> dates = List.generate(
    30,
    (index) => DateTime.now().add(Duration(days: index)),
  );

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
              itemCount: dates.length,
              onPageChanged: (index) {
                setState(() {
                  selectedDayIndex = index;
                });
              },
              itemBuilder: (context, index) {
                DateTime date = dates[index];
                return Column(
                  children: [
                    Text(
                      DateFormat('EEEE, MMMM d, y').format(date),
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 24,
                        itemBuilder: (context, hourIndex) {
                          String hour = _getFormattedHour(hourIndex);
                          return ListTile(
                            title: Text(hour),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: const CustomFloatingActionButton(),
    );
  }

  String _getFormattedHour(int hourIndex) {
    if (hourIndex == 0) {
      return '12 AM';
    } else if (hourIndex == 12) {
      return '12 NN';
    } else if (hourIndex < 12) {
      return '${hourIndex} AM';
    } else {
      return '${hourIndex - 12} PM';
    }
  }
}
