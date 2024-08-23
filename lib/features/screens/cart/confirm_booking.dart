import 'package:flutter/material.dart';

class ConfirmBookingPage extends StatelessWidget {
  final String name;
  final String date;
  final String time;
  final String price;

  const ConfirmBookingPage({
    super.key,
    required this.name,
    required this.date,
    required this.time,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back action
          },
        ),
        title: const Text('Confirm Booking'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Booking details form
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Booking Details'),
                  const SizedBox(height: 10),
                  Text('Name: $name'),
                  Text('Date: $date'),
                  Text('Time: $time'),
                  Text('Price: $price'),
                  // You can add more details here
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Confirm Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle booking confirmation
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Confirm Booking'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
