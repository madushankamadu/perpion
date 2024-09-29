import 'package:demo_app/core/components/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

import '../components/google_auth_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Logo
              Center(
                child: Image.asset(
                  'assets/images/logo.jpg', // Path to your logo
                  height: 100.0, // Adjust the size as needed
                ),
              ),
              const SizedBox(height: 8.0),
              // Subtitle
              const Center(
                child: Text(
                  'Step Into the Future with Perpion',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(height: 32.0),

              Text(
                'New User?',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w400),
              ),
              Text(
                'Register Here',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 32.0),

              // Email field
              CustomTextField(
                labelText: 'Email',
                prefixIcon: Icons.email,
                controller: emailController,
                bgColor: Colors.grey[200],
                borderSide: BorderSide.none,
                radius: 50.0,
              ),
              SizedBox(height: 16.0),

              // Password field
              CustomTextField(
                isPasswordField: true,
                labelText: 'Password',
                prefixIcon: Icons.lock,
                controller: passwordController,
                bgColor: Colors.grey[200],
                borderSide: BorderSide.none,
                radius: 50.0,
              ),
              SizedBox(height: 16.0),

              // Confirm Password field
              CustomTextField(
                labelText: 'Confirm Password',
                prefixIcon: Icons.lock,
                isPasswordField: true,
                controller: confirmPasswordController,
                bgColor: Colors.grey[200],
                borderSide: BorderSide.none,
                radius: 50.0,
              ),
              SizedBox(height: 24.0),

              // Signup button (shortened to half the screen width)
              Center(
                child: FractionallySizedBox(
                  widthFactor: 0.7, // Set the width to half of the screen
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blueAccent, Colors.purpleAccent],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/personal_info');
                        // Handle the button press action
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: Text(
                        'Signup',
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16.0),

              // Or text
              Center(
                child: Text(
                  'or',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              SizedBox(height: 16.0),

              // Google sign-in button (shortened to half the screen width)
              Center(
                child: FractionallySizedBox(
                  widthFactor: 0.7, // Set the width to half of the screen
                  child: SignInScreen(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
