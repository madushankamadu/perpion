import 'package:demo_app/core/components/custom_input_field.dart';
import 'package:flutter/material.dart';
import '../../colors/colors.dart';

class PersonalInformationPage extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  PersonalInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Logo
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Image.asset(
                    'assets/images/logo.jpg', // Replace with your logo's URL or asset image
                    height: 50,
                  ),
                ),
              ),

              // Personal information text with underline
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible( // Use Flexible to allow the Text widget to wrap
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        'Personal information page',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          color: Colors.black,
                        ),
                        softWrap: true,
                        maxLines: 2, // Optional: limit the maximum number of lines
                        overflow: TextOverflow.ellipsis, // Optional: add ellipsis if it exceeds max lines
                      ),
                    ),
                  ),
                ],
              ),


              // Spacer to push the form to the center
              Spacer(),

              // First Name, Last Name, and Location identification inputs
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CustomTextField(
                      labelText: 'First name',
                      controller: firstNameController,
                      bgColor: Colors.grey[300],
                      borderSide: BorderSide.none,
                      radius: 10.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CustomTextField(
                      labelText: 'Last name',
                      controller: lastNameController,
                      bgColor: Colors.grey[300],
                      borderSide: BorderSide.none,
                      radius: 10.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CustomTextField(
                      labelText: 'Location identification',
                      controller: locationController,
                      bgColor: Colors.grey[300],
                      borderSide: BorderSide.none,
                      radius: 10.0,
                    ),
                  ),
                ],
              ),

              // Spacer to balance the layout with equal top and bottom spacing
              Spacer(),

              // Next button
              Align(
                alignment: Alignment.centerRight, // Align the button to the right
                child: FractionallySizedBox(
                  widthFactor: 0.5, // Set the width to 50% of the screen
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/company_info');
                      // Add your button's functionality here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonColor,
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      'NEXT',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
