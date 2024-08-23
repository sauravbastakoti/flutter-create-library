import 'package:flutter/material.dart';

class PredictionResultScreen extends StatelessWidget {
  final String prediction;
  final String solution;
  final VoidCallback onScanAgain;

  const PredictionResultScreen({
    super.key,
    required this.prediction,
    required this.solution,
    required this.onScanAgain,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade100,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
        color: Colors.green.shade100,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Findings',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text(
                  'Disease: ',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  prediction,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Remedy:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              solution,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.green,
              ),
            ),
            const Spacer(), // Pushes the button to the bottom
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Set button color
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  onScanAgain(); // Trigger the scan again callback
                  Navigator.pop(
                      context); // Navigate back to the previous screen
                },
                child: const Text('Scan Again'),
              ),
            ),
            const SizedBox(height: 20), // Add some spacing below the button
          ],
        ),
      ),
    );
  }
}
