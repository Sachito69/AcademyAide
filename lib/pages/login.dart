import 'package:flutter/material.dart';
import 'package:project/components/button.dart';
import 'package:project/components/textFeild.dart';
//import 'package:project/pages/home.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final userController = TextEditingController();
  final passController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.grey[300],
      body:  SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              const SizedBox(height: 55.0),

              const Icon(Icons.lock,
              size: 100,

              ),

              const SizedBox(height: 35.0),

               Text('Welcome back you\'ve been missed!',
              style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 16,

              ),
              ),

              const SizedBox(height: 15.0),

              // title
              // Add your title widget here, if any

              // username textfield
               const MyTextField(
                //controller: userController,
                hinttext: 'Username',
                obscureText: false,
              ),
               const SizedBox(height: 25.0),

              // password textfield
               const MyTextField(
                //controller: passController,
                hinttext: 'Password',
                obscureText: true,
              ),
              ///
            
                Padding(
  padding: EdgeInsets.all(8.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('Don\'t have an account?'),
      //SizedBox(width: 4),
      TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/register'); // Assuming you have a route named '/register'
        },
        child: Text(
          'Register',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
      ),
    ],
  ),
),

              const SizedBox(height: 25.0),
              // login button
              MyButton(
                onTap: () {
                  Navigator.pushNamed(context, '/homepage');
                },
              ),

              ///
              
              ///
              ///
            ],
          ),
        ),
      ),
    );
  }
}
