import 'package:demo_app/colors/colors.dart';
import 'package:flutter/material.dart';
import '../../models/user_model.dart';
import '../components/user_card.dart';  // Import the UserCard widget

class DashboardScreen extends StatelessWidget {
  final List<User> allCompanies = [
    User('John Doe', 'john@example.com', '2023-01-01', 'Active'),
    User('Michael Brown', 'michael@example.com', '2021-11-23', 'Active'),
    User('Jane Smith', 'jane@example.com', '2022-05-12', 'Inactive'),
    User('Emily Davis', 'emily@example.com', '2020-06-15', 'Inactive'),
    // Add more active users as needed
  ];


  final List<User> allUsers = [
    User('John Doe', 'john@example.com', '2023-01-01', 'Active'),
    User('Jane Smith', 'jane@example.com', '2022-05-12', 'Inactive'),
    User('Michael Brown', 'michael@example.com', '2021-11-23', 'Active'),
    User('Emily Davis', 'emily@example.com', '2020-06-15', 'Inactive'),
    // Add more users as needed
  ];


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        backgroundColor: AppColors.primary, // Set dark background color
        appBar: AppBar(
          title: Text('Admin Dashboard'), // Set the title of the AppBar
          backgroundColor: Color(0xFF1F1B24), // Set the background color of the AppBar
          bottom: TabBar(
            isScrollable: true, // Allow tabs to be scrollable
            indicatorColor: Colors.blueAccent, // Change the color of the indicator
            indicatorWeight: 4.0, // Set the thickness of the indicator
            labelColor: Colors.white, // Color of the selected tab text
            unselectedLabelColor: Colors.grey, // Color of unselected tab text
            labelStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold), // Set the font style
            tabs: [
              Tab(child: Text('All Users')),
              Tab(child: Text('Companies')),
            ],
          ),
        ),
        body: TabBarView(
          children: [

            _buildUserList(allUsers),
            _buildUserList(allCompanies),
          ],
        ),
        floatingActionButton: Stack(
          alignment: Alignment.bottomRight,
          children: [
            // Add Company Info Button
            Positioned(
              bottom: 80, // Position it above the Add User button
              right: 0,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/company_info');
                  // Logic for adding company info
                  print('Add Company Info button pressed');
                },
                backgroundColor: AppColors.listItemColor, // Change color as needed
                child: Icon(Icons.add_business, color: AppColors.background,), // Icon for the button
              ),
            ),
            // Add User Button
            Positioned(
              bottom: 16, // Position it at the bottom
              right: 0,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/user_add');
                  // Logic for adding a user
                  print('Add User button pressed');
                },
                backgroundColor: AppColors.listItemColor, // Change color as needed
                child: Icon(Icons.person_add, color: AppColors.background), // Add icon for the button
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserList(List<User> users) {
    return Padding(
      padding: EdgeInsets.all(4.0), // Add padding for spacing around the list
      child: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return UserCard(user: users[index]); // Use UserCard widget here
        },
      ),
    );
  }
}

