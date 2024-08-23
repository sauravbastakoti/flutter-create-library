import 'package:KrishiKranti/core/shared_prefences/locator.dart';
import 'package:KrishiKranti/cubits/profile/profile_cubit.dart';
import 'package:KrishiKranti/features/forgot_password/change_password.dart';
import 'package:KrishiKranti/features/forgot_password/forgot_password.dart';
import 'package:KrishiKranti/features/notifications.dart';
import 'package:KrishiKranti/features/screens/settings/order_history.dart';
import 'package:KrishiKranti/features/screens/settings/user_informations.dart';
import 'package:KrishiKranti/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  static String routeName = '/profile';
  final PageController pageController;
  const Profile({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfileCubit(locator.get<ApiService>())..loadUserAllDetails(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xFFD4FCE4),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                            state.profileModel?.username.toString() ??
                                'user 14',
                            style: GoogleFonts.getFont(
                              'Roboto Condensed',
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: const Color(0xFF000000),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            state.profileModel?.email.toString() ??
                                'user@gmail.com',
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
                            onPressed: () {
                              Get.to(const MyOrdersPage());
                            },
                            label: 'Order History',
                            icon: Icons.history,
                          ),
                          _buildProfileOption(
                            context,
                            onPressed: () {
                              Get.to(NotificationsPage());
                            },
                            label: 'Notifications',
                            icon: Icons.notifications_outlined,
                          ),
                          _buildProfileOption(
                            context,
                            onPressed: () {
                              Get.to(const ChangePassword());
                            },
                            label: 'Change Password',
                            icon: Icons.feedback_outlined,
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
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
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
