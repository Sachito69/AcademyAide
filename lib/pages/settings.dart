import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project/theme/theme_provider.dart';
import 'package:project/theme/themes.dart';


class SettingsModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.5, 
      widthFactor: 0.8,  
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Settings',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(),
            SwitchListTile(
              title: Text('Theme'),
              value: Provider.of<ThemeProvider>(context).themeData == darkMode,
              onChanged: (bool value) {
                Provider.of<ThemeProvider>(context, listen: false).toggleTheme(value);
              },
              secondary: Icon(Icons.dark_mode),
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Privacy'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help & Support'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
