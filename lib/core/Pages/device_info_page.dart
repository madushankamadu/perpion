
import 'package:flutter/material.dart';

import '../../colors/colors.dart';
import '../components/custom_input_field.dart';

class DeviceInfoPage extends StatelessWidget {
  DeviceInfoPage({super.key});

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  // Add a list of types for the dropdown
  final List<String> types = ['type 1', 'type 2', 'type 3'];
  String? selectedType; // To store the selected type value
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
                        'Device information page',
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
                      labelText: 'Add Device',
                      controller: firstNameController,
                      bgColor: Colors.grey[300],
                      borderSide: BorderSide.none,
                      radius: 10.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Device type',
                        filled: true,
                        fillColor: Colors.grey[300],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      value: selectedType,
                      isExpanded: true,
                      icon: Icon(Icons.arrow_drop_down), // Dropdown arrow icon
                      style: TextStyle( // Text style for dropdown items
                        color: Colors.black,
                        fontSize: 16,
                      ),// Makes sure the dropdown expands to full width
                      items: types.map((String type) {
                        return DropdownMenuItem<String>(
                          value: type,
                          child: Text(type),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        selectedType = newValue!;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CustomTextField(
                      labelText: 'Unique device (add)',
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
                      Navigator.pushNamed(context, '/power_info');
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
