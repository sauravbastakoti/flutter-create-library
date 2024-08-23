import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD8F8E1), // Light green background color
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40), // Spacing at the top
              const Text(
                "Take a photo to",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "identify",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  SizedBox(width: 4),
                  Text(
                    "the disease!",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Image placeholder
              Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage(
                        'assets/plant_image.jpg'), // Replace with your image asset
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // Continue Button
              ElevatedButton(
                onPressed: () {
                  // Handle continue action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 30),
              // Indicator dots
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.circle, size: 10, color: Colors.black),
                  SizedBox(width: 10),
                  Icon(Icons.circle, size: 10, color: Colors.grey),
                  SizedBox(width: 10),
                  Icon(Icons.circle, size: 10, color: Colors.grey),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
