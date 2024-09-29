import 'package:flutter/material.dart';
import 'multi_segment_painter.dart'; // Import the painter class

class MultiSegmentCircle extends StatelessWidget {
  final List<Color> colors; // Add a property for the colors
  final List<double> percentages; // Add a property for the percentages
  final List<String> labels; // Add a property for the labels
  final double gapSize; // Gap size between segments

  MultiSegmentCircle({
    required this.colors,
    required this.percentages,
    required this.labels, // Accept labels for legend
    this.gapSize = 0.05, // Default gap size
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Circle
          Container(
            width: 200,
            height: 200,
            child: CustomPaint(
              painter: MultiSegmentCirclePainter(
                colors: colors, // Pass the colors to the painter
                percentages: percentages, // Pass the percentages to the painter
                gapSize: gapSize, // Pass the gap size to the painter
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "21,424\$",
                      style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "+3.44",
                      style: TextStyle(color: Colors.green, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Spacer to separate the circle and the legend
          SizedBox(width: 20),

          // Legend with round bullets
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(colors.length, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    // Round bullet
                    Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: colors[index], // Color for each segment
                        shape: BoxShape.circle, // Make it circular
                        border: Border.all(
                          color: Colors.white, // Border color
                          width: 2, // Border width
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '0${index+1}',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      labels[index],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white24,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
