import 'package:flutter/material.dart';
import 'package:project/components/button.dart';
import 'package:project/components/textFeild.dart';
//import 'package:project/pages/home.dart';

class Register extends StatelessWidget {
  Register({super.key});

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

             const MyTextField(
                //controller: userController,
                hinttext: 'Username',
                obscureText: false,
              ),

              const SizedBox(height: 15.0),

               const MyTextField(
                //controller: userController,
                hinttext: 'Last name',
                obscureText: false,
              ),

              const SizedBox(height: 15.0),


              // username textfield
               const MyTextField(
                //controller: userController,
                hinttext: 'E-mail',
                obscureText: false,
              ),
               const SizedBox(height: 15.0),

              // password textfield
               const MyTextField(
                //controller: passController,
                hinttext: 'Password',
                obscureText: false,
              ),
              ///
            
   

              const SizedBox(height: 25.0),
         
              MyButton(
                buttonText: 'Sign Up',
                onTap: () {
                  Navigator.pushNamed(context, '/login');
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
