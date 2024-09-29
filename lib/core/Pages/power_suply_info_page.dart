import 'package:flutter/material.dart';

import '../../colors/colors.dart';
import '../components/custom_input_field.dart';

class PowerSupplyInfoPage extends StatelessWidget {
  PowerSupplyInfoPage({super.key});

  final TextEditingController powerSourceController = TextEditingController();
  final TextEditingController batteryVoltageController = TextEditingController();
  final TextEditingController batteryCapacityController = TextEditingController();
  final TextEditingController batteryTypeController = TextEditingController();
  final TextEditingController batteryManufacturerController = TextEditingController();

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
                        'Power supply information page',
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


              // Make only the input fields scrollable
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: CustomTextField(
                          labelText: 'Power source (Battery/Grid)',
                          controller: powerSourceController,
                          bgColor: Colors.grey[300],
                          borderSide: BorderSide.none,
                          radius: 10.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: CustomTextField(
                          labelText: 'Battery voltage',
                          controller: batteryVoltageController,
                          bgColor: Colors.grey[300],
                          borderSide: BorderSide.none,
                          radius: 10.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: CustomTextField(
                          labelText: 'Battery capacity',
                          controller: batteryCapacityController,
                          bgColor: Colors.grey[300],
                          borderSide: BorderSide.none,
                          radius: 10.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: CustomTextField(
                          labelText: 'Battery type',
                          controller: batteryTypeController,
                          bgColor: Colors.grey[300],
                          borderSide: BorderSide.none,
                          radius: 10.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: CustomTextField(
                          labelText: 'Battery manufacturer',
                          controller: batteryManufacturerController,
                          bgColor: Colors.grey[300],
                          borderSide: BorderSide.none,
                          radius: 10.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Next button
              Align(
                alignment: Alignment.centerRight, // Align the button to the right
                child: FractionallySizedBox(
                  widthFactor: 0.5, // Set the width to 50% of the screen
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/sign_up');
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
                      'DONE',
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
