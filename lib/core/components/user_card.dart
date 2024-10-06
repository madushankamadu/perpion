import 'package:demo_app/colors/colors.dart';
import 'package:flutter/material.dart';

import '../../models/user_model.dart';
import '../Pages/admin_dashboard.dart';
 // Import the User model

class UserCard extends StatelessWidget {
  final User user;

  UserCard({required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF292D36),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        title: Text(user.username, style: TextStyle(color: Colors.white)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(user.email, style: TextStyle(color: Colors.grey)),
            Text('Signup: ${user.signupDate}', style: TextStyle(color: Colors.grey)),
          ],
        ),
        trailing: InkWell(
          onTap: () {
        // Add your function here
        // Navigator.pushNamed(context, '/')
        },

        child:Chip(
          label: Text('View'),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.white, // Border color
              width: 2.0, // Border width
            ),
            borderRadius: BorderRadius.circular(8.0),),
          backgroundColor:
          user.status == 'Active' ? AppColors.primary : AppColors.primary,  // Status colors
          labelStyle: TextStyle(color: Colors.white),
        ),
      ),
    ),
    );
  }
}
