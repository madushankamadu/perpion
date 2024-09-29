import 'package:flutter/material.dart';
import 'package:gauge_indicator/gauge_indicator.dart';

class HalfGauge extends StatelessWidget {
  const HalfGauge({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            AnimatedRadialGauge(
              duration: const Duration(seconds: 1),
              curve: Curves.elasticOut,
              radius: 100,
              value: 50,
              axis: GaugeAxis(
                min: 0,
                max: 100,
                degrees: 180,
                style: const GaugeAxisStyle(
                  thickness: 10,
                  background: Color(0xFFDFE2EC),
                  segmentSpacing: 4,
                ),
                pointer: GaugePointer.needle(
                  borderRadius: 0,
                  width: 10,
                  height: 70,
                  color: Colors.white24,
                ),
                progressBar: const GaugeProgressBar.rounded(
                  color: Color(0xFFB4C2F8),
                ),
                segments: [
                  const GaugeSegment(
                    from: 0,
                    to: 15.0,
                    color: Color(0xFFD9DEEB),
                    cornerRadius: Radius.zero,
                  ),
                  const GaugeSegment(
                    from: 30,
                    to: 66.6,
                    color: Color(0xFFB4C2F8),
                    cornerRadius: Radius.zero,
                  ),
                  const GaugeSegment(
                    from: 66.6,
                    to: 100,
                    color: Color(0xFF8FC4D0),
                    cornerRadius: Radius.zero,
                  ),
                ],
              ),
            ),
            // Pointer value label
            Positioned(
              child: AnimatedBuilder(
                animation: const AlwaysStoppedAnimation(50), // Replace with your dynamic value
                builder: (context, child) {
                  return Text(
                    '50%', // Display current value
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        // Start label
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 60), // Adjust as needed
              child: Text(
                '0%',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 60), // Adjust as needed
              child: Text(
                '100%',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
