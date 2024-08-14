import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DaysOfWeekBar extends StatefulWidget {
  final List<String> daysOfWeek;
  final Function(int) onDaySelected;
  final int initialSelectedIndex;

  DaysOfWeekBar({
    Key? key,
    required this.daysOfWeek,
    required this.onDaySelected,
    this.initialSelectedIndex = 0,
  }) : super(key: key);

  @override
  _DaysOfWeekBarState createState() => _DaysOfWeekBarState();
}

class _DaysOfWeekBarState extends State<DaysOfWeekBar> {
  int selectedDayIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedDayIndex = widget.initialSelectedIndex;
  }

  List<DateTime> getCurrentWeekDates() {
    DateTime now = DateTime.now();
    int currentDay = now.weekday % 7;
    DateTime sunday = now.subtract(Duration(days: currentDay));

    return List.generate(7, (index) => sunday.add(Duration(days: index)));
  }

  @override
  Widget build(BuildContext context) {
    List<DateTime> weekDates = getCurrentWeekDates();

    return SizedBox(
      height: 100.0,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.2, initialPage: selectedDayIndex),
        itemCount: widget.daysOfWeek.length,
        itemBuilder: (context, index) {
          DateTime date = weekDates[index];
          bool isSelected = index == selectedDayIndex;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedDayIndex = index;
              });
              widget.onDaySelected(index);
            },
            child: Container(
              width: 70.0,
              margin: const EdgeInsets.all(3.0),
              decoration: isSelected
                  ? BoxDecoration(
                      border: Border.all(color: Colors.red, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    )
                  : null,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.daysOfWeek[index],
                      style: TextStyle(
                        fontSize: 19.0,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      DateFormat('MM/dd').format(date),
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        color: isSelected ? Colors.red : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
