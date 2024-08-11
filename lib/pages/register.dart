import 'package:flutter/material.dart';
//import 'package:project/components/button.dart';
//import 'package:project/components/textFeild.dart';
//import 'package:project/pages/home.dart';

class Register extends StatelessWidget {
  Register({super.key});

  final userController = TextEditingController();
  final passController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Register Page'),
      ),
      body: SafeArea(child: Text('Register body')),
    );
  }
}