import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:KrishiKranti/core/shared_prefences/locator.dart';
import 'package:KrishiKranti/cubits/register/register_cubit.dart';
import 'package:KrishiKranti/features/login_register/login_screen.dart';
import 'package:KrishiKranti/services/api_services.dart';

class RegisterScreen extends StatefulWidget {
  static String routeName = '/register';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(locator.get<ApiService>()),
      child: Builder(builder: (context) {
        return BlocListener<RegisterCubit, RegisterState>(
          listener: (context, state) async {
            if (state.status == RegisterStatus.successful) {
              showSuccessSnackbar(context, 'Form submitted successfully!');

              context.pushNamed(LoginScreen.routeName);
            } else if (state.status == RegisterStatus.error) {
              showErrorSnackbar(
                  context, '${state.errorMessage}. Please try again.');
            }
          },
          child: Scaffold(
            backgroundColor: const Color(0xFFD4FCE4),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
                  child: Column(
                    children: [
                      // Align(
                      //   alignment: Alignment.topLeft,
                      //   child: IconButton(
                      //     icon: const Icon(Icons.arrow_back),
                      //     onPressed: () {},
                      //   ),
                      // ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Sign Up',
                          style: GoogleFonts.getFont(
                            'Roboto Condensed',
                            fontWeight: FontWeight.w500,
                            fontSize: 32,
                            letterSpacing: 0.4,
                            color: const Color(0xFF000000),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      _buildTextField(
                        context,
                        controller: _usernameController,
                        label: 'Username',
                        icon: Icons.person,
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        context,
                        controller: _emailController,
                        label: 'Email',
                        icon: Icons.email,
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        context,
                        controller: _phoneController,
                        label: 'Mobile',
                        icon: Icons.phone,
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        context,
                        controller: _addressController,
                        label: 'Address',
                        icon: Icons.location_city,
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        context,
                        controller: _nameController,
                        label: 'First Name',
                        icon: Icons.person,
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        context,
                        controller: _lastNameController,
                        label: 'Last Name',
                        icon: Icons.person,
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        context,
                        controller: _passwordController,
                        label: 'Password',
                        icon: Icons.lock,
                        obscureText: true,
                      ),
                      const SizedBox(height: 40),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 19),
                        decoration: BoxDecoration(
                          color: const Color(0xC91B9527),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextButton(
                          onPressed: () {
                            context.read<RegisterCubit>().register(
                                  username: _usernameController.text,
                                  email: _emailController.text,
                                  firstName: _nameController.text,
                                  lastName: _lastNameController.text,
                                  password: _passwordController.text,
                                  address: _addressController.text,
                                  phoneNumber: _phoneController.text,
                                  password2: _passwordController.text,
                                );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Text(
                              'Sign Up',
                              style: GoogleFonts.getFont(
                                'Roboto Condensed',
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: const Color(0xFFFFFFFF),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFCF6F6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 17.5, 0, 20.5),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Existing user login here',
                        style: GoogleFonts.getFont(
                          'Roboto Condensed',
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: const Color(0xFF000000),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildTextField(BuildContext context,
      {required String label,
      required IconData icon,
      TextEditingController? controller,
      bool obscureText = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(40),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: const Color(0xFF706060)),
          hintText: label,
          hintStyle: GoogleFonts.getFont(
            'Roboto Condensed',
            fontWeight: FontWeight.w400,
            fontSize: 20,
            color: const Color(0xFF706060),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }
}

void showSuccessSnackbar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: GoogleFonts.getFont(
        'Roboto Condensed',
        color: Colors.white,
        fontSize: 16,
      ),
    ),
    backgroundColor: Colors.green, // Green color to indicate success
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(10),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showErrorSnackbar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: GoogleFonts.getFont(
        'Roboto Condensed',
        color: Colors.white,
        fontSize: 16,
      ),
    ),
    backgroundColor: Colors.red, // Red color to indicate error
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(10),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
