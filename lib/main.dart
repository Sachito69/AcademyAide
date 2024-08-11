import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project/theme/theme_provider.dart';
import 'package:project/pages/home.dart';
import 'package:project/pages/login.dart';
import 'package:project/pages/register.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //final themeProvider = Provider.of<ThemeProvider>(context);
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: Homepage(),
     home: LoginPage(),
      title: 'Flutter Demo',
      theme: Provider.of<ThemeProvider>(context).themeData, // Make sure this method exists in ThemeProvider
      routes: {
        '/homepage':(context) => Homepage(),
        '/register':(context)=> Register(),
        '/login':(context) => LoginPage()
      },
    );
  }
}
