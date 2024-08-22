import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greatticket/features/screens/settings/user_informations.dart';

class Profile extends StatelessWidget {
  static String routeName = '/profile';
  final PageController pageController;
  const Profile({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD4FCE4),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                // Handle back button press
              },
            ),
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'User Name',
                    style: GoogleFonts.getFont(
                      'Roboto Condensed',
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: const Color(0xFF000000),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'xxxxxx12345@gmail.com',
                    style: GoogleFonts.getFont(
                      'Roboto Condensed',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: const Color(0xFF706060),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildProfileOption(
                    context,
                    onPressed: () {
                      context.pushNamed(UserInformations.routeName);
                    },
                    label: 'Personal Information',
                    icon: Icons.person_outline,
                  ),
                  _buildProfileOption(
                    context,
                    onPressed: () {},
                    label: 'Order History',
                    icon: Icons.history,
                  ),
                  _buildProfileOption(
                    context,
                    onPressed: () {},
                    label: 'Notifications',
                    icon: Icons.notifications_outlined,
                  ),
                  _buildProfileOption(
                    context,
                    onPressed: () {},
                    label: 'Feedback',
                    icon: Icons.feedback_outlined,
                  ),
                  _buildProfileOption(
                    context,
                    onPressed: () {},
                    label: 'Rate Us',
                    icon: Icons.star_border,
                  ),
                  _buildProfileOption(
                    context,
                    onPressed: () {},
                    label: 'Term of Service',
                    icon: Icons.description_outlined,
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        // Handle log out button press
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: const Size.fromHeight(50),
                      ),
                      child: Text(
                        'Log Out',
                        style: GoogleFonts.getFont(
                          'Roboto Condensed',
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(
    BuildContext context, {
    required String label,
    required IconData icon,
    required VoidCallback onPressed, // Add this parameter
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF1B9527)),
        title: Text(
          label,
          style: GoogleFonts.getFont(
            'Roboto Condensed',
            fontWeight: FontWeight.w400,
            fontSize: 18,
            color: const Color(0xFF000000),
          ),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: onPressed, // Trigger the callback when tapped
      ),
    );
  }
}
