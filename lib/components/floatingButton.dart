import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:project/pages/settings.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      backgroundColor: Colors.deepOrange,
      animatedIcon: AnimatedIcons.menu_close,
      overlayColor: Colors.black,
      overlayOpacity: 0.4,
      children: [
        SpeedDialChild(
          child: const Icon(Icons.add),
          label: 'Add',
          onTap: () {
            print('Add pressed!');
            // Add your action here
          },
        ),
        SpeedDialChild(
          child: const Icon(Icons.logout),
          label: 'Log out',
          onTap: () {
            Navigator.pushNamed(context, '/login');
          },
        ),
        SpeedDialChild(
          child: const Icon(Icons.settings),
          label: 'Settings',
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) {
                return SettingsModal(); // Call the SettingsModal class here
              },
            );
          },
        ),
      ],
    );
  }
}
