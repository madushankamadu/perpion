import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../colors/colors.dart';
import '../components/half_gauge.dart';
import '../components/multiple_presentage_indicator.dart'; // Add this dependency in pubspec.yaml

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor, // Match background color
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Profile Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundImage: AssetImage('assets/profile.jpg'), // Use your profile image asset
                        ),
                        SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Robert Ross',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Dashboard',
                              style: TextStyle(
                                color: Colors.grey[400],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Icon(Icons.settings, color: Colors.white),
                  ],
                ),

                SizedBox(height: 20),

                // Circular Chart - Balance or Percentage
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        MultiSegmentCircle(
                          colors: [Colors.red, Colors.blue, Colors.green], // Colors for the segments
                          percentages: [0.25, 0.5, 0.25], // Percentages for the segments
                          labels: ['Rent', 'Savings', 'Expenses'], // Labels for the legend
                          gapSize: 0.1, // Optional: Set the gap size between segments
                        ),
                      ],
                    ),
                    Column(
                      children: [],
                    )
                  ],
                ),

                SizedBox(height: 30),

                // Bar Charts for Items
                _buildBarChart(),

                SizedBox(height: 20),
                _buildItemCards(),

                SizedBox(height: 20),

                // Gauge for Item 01
                HalfGauge(),

                // Bottom Section for Extra Items

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBarChart() {
    return SizedBox(
      height: 150,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        series: <CartesianSeries>[
          ColumnSeries<SalesData, String>(
            dataSource: <SalesData>[
              SalesData('Item 01', 35),
              SalesData('Item 02', 28),
              SalesData('Item 03', 34),
              SalesData('Item 04', 32),
            ],
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales,
            color: Colors.redAccent,
          ),
          ColumnSeries<SalesData, String>(
            dataSource: <SalesData>[
              SalesData('Item 01', 30),
              SalesData('Item 02', 33),
              SalesData('Item 03', 29),
              SalesData('Item 04', 37),
            ],
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }

  Widget _buildGauge() {
    return Center(
      child: CircularPercentIndicator(
        radius: 100.0,
        lineWidth: 10.0,
        percent: 0.5, // Adjust this value for percentage
        center: Text(
          "50%",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24.0),
        ),
        progressColor: Colors.blueAccent,
        backgroundColor: Colors.grey,
      ),
    );
  }

  Widget _buildItemCards() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildItemCard('Item 01'),
        _buildItemCard('Item 02'),
        _buildItemCard('Item 03'),
      ],
    );
  }

  Widget _buildItemCard(String label) {
    return Container(
      width: 80,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

// Sales data model for the bar chart
class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
