import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
    //final controller;
    final String hinttext;
    final bool obscureText;
  const MyTextField({
    super.key,
    //required this.controller,
    required this.hinttext,
    required this.obscureText,});
  
  @override
  Widget build(BuildContext context) {
       
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        obscureText: obscureText,          
       // controller: controller,
        decoration:  InputDecoration(
                  enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide( color: Colors.white)
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black)
          ),
            //fillColor: Colors.grey.shade100,
            filled: true,
            hintText: hinttext,
          ),
        ),
      );
    }
  }