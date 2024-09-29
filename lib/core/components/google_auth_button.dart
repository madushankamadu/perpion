import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart'; // Make sure you have this package installed

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0), // Adding padding around the button
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,  // Set the border color
            width: 2.0,          // Set the border width
          ),
          borderRadius: BorderRadius.circular(50.0), // Set the border radius
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50.0), // Apply the radius here to clip content
          child: SignInButton(
            Buttons.Google,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8), // Custom padding
            onPressed: () {
              // Handle Google sign-in
            },
          ),
        ),
      ),
    );
  }
}
