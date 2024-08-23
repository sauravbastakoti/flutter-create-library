// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:KrishiKranti/features/loginScreenLoginScreen_register/register_screen.dart';
// import 'package:KrishiKranti/features/screens/dashboard.dart';

// class LoginScreenScreen extends StatefulWidget {
//   static String routeName = '/loginScreenLoginScreen';
//   const LoginScreenScreen({super.key});

//   @override
//   State<LoginScreenScreen> createState() => _LoginScreenScreenState();
// }

// class _LoginScreenScreenState extends State<LoginScreenScreen> {
//   bool _secureText = true;
//   @override
//   final _formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueGrey,
//       resizeToAvoidBottomInset: false,
//       body: ListView(
//         shrinkWrap: true,
//         children: [
//           // SizedBox(height: 20,),
//           const SizedBox(
//             //height: MediaQuery.of(context).size.width / 3,
//             //  width: MediaQuery.of(context).size.width / 3,
//             child: Image(
//               image: AssetImage('lib/assets/splash.png'),
//               fit: BoxFit.contain,
//             ),
//           ),
//           SizedBox(
//             height: MediaQuery.of(context).size.height * 0.2,
//           ),
//           Container(
//             height: MediaQuery.of(context).size.height * 0.95,
//             decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(40.0),
//                   topRight: Radius.circular(40.0),
//                   // bottomLeft: const Radius.circular(40.0),
//                   // bottomRight: const Radius.circular(40.0),
//                 )),
//             child: SingleChildScrollView(
//                 padding: EdgeInsets.only(
//                     bottom: MediaQuery.of(context).viewInsets.bottom),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   // crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     //
//                     Column(
//                       children: [
//                         Text(
//                           'LOGINScreenLoginScreen',
//                           style: GoogleFonts.montserrat(
//                               fontSize: 25,
//                               // color: mainColor,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),

//                     const SizedBox(
//                       height: 5,
//                     ),

//                     Form(
//                       key: _formKey,
//                       child: Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Column(
//                           children: [
//                             TextFormField(
//                                 keyboardType: TextInputType.visiblePassword,
//                                 // controller: emailController,
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return '*required';
//                                   }
//                                   return null;
//                                 },
//                                 decoration: InputDecoration(
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(12),
//                                     ),
//                                     labelText: 'Email/Phone',
//                                     labelStyle:
//                                         const TextStyle(color: Colors.black),
//                                     hintText: 'Enter email/phone',
//                                     prefixIcon: const Icon(
//                                       Icons.mail,
//                                       color: Colors.black,
//                                     )),
//                                 textInputAction: TextInputAction.next),
//                             const SizedBox(
//                               height: 16,
//                             ),
//                             TextFormField(
//                               //   controller: passwordController,
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return '*required';
//                                 }
//                                 return null;
//                               },
//                               decoration: InputDecoration(
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                                 labelText: 'Password',
//                                 labelStyle:
//                                     const TextStyle(color: Colors.black),
//                                 hintText: 'Password',
//                                 prefixIcon: const Icon(
//                                   Icons.key,
//                                   color: Colors.black,
//                                 ),
//                                 suffixIcon: IconButton(
//                                   onPressed: () {
//                                     setState(() {
//                                       _secureText = !_secureText;
//                                     });
//                                   },
//                                   icon: Icon(_secureText
//                                       ? Icons.remove_red_eye
//                                       : Icons.remove_red_eye_outlined),
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               obscureText: _secureText,
//                               onFieldSubmitted: (value) {
//                                 if (_formKey.currentState!.validate()) {
//                                   //    _onLoading();
//                                 }
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     const Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         SizedBox(width: 8.0),
//                         Text("Remember Me",
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 15,
//                             )),
//                       ],
//                     ),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width,
//                       child: Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: ElevatedButton(
//                           style: ButtonStyle(
//                             shape: WidgetStateProperty.all(
//                               RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(15.0),
//                               ),
//                             ),
//                           ),
//                           onPressed: () {
//                             context.pushNamed(DashboardScreen.routeName);
//                           },
//                           child: const Text(
//                             'LoginScreen',
//                             style: TextStyle(
//                               fontSize: 15,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),

//                     const SizedBox(
//                       height: 5,
//                     ),
//                     TextButton(
//                         onPressed: () async {
//                           context.pushNamed(RegisterScreen.routeName);
//                         },
//                         child: const Text(
//                           'Forgot Password ?',
//                           style: TextStyle(fontSize: 16),
//                         )),
//                     Center(
//                       child: RichText(
//                         text: TextSpan(
//                           text: 'Don\'t have an account?',
//                           style: const TextStyle(
//                               color: Colors.black, fontSize: 16),
//                           children: <TextSpan>[
//                             TextSpan(
//                               text: ' Register Now',
//                               style: const TextStyle(
//                                   fontWeight: FontWeight.w600, fontSize: 16),
//                               recognizer: TapGestureRecognizer()..onTap = () {},
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 100,
//                     ),
//                   ],
//                 )),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:KrishiKranti/core/shared_prefences/locator.dart';
import 'package:KrishiKranti/core/shared_prefences/shared_prefences_service.dart';
import 'package:KrishiKranti/cubits/login/login_cubit.dart';
import 'package:KrishiKranti/features/login_register/register_screen.dart';
import 'package:KrishiKranti/features/screens/dashboard.dart';
import 'package:KrishiKranti/services/api_services.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = '/loginScreenLoginScreen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(locator.get<ApiService>()),
      child: Builder(builder: (context) {
        return BlocListener<LoginCubit, LoginState>(
          listener: (context, state) async {
            if (state.status == LoginStatus.loggedIn) {
              print("Login successful, token: ${state.key}");
              await locator.get<SharedPreferencesService>().setToken(state.key);
              context.goNamed(DashboardScreen.routeName);
            } else if (state.status == LoginStatus.error) {
              //snack bar
              //
            }
          },
          child: Scaffold(
            backgroundColor: const Color(0xFFD4FCE4),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () {},
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.pushNamed(DashboardScreen.routeName);
                          },
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Login ',
                              style: GoogleFonts.getFont(
                                'Roboto Condensed',
                                fontWeight: FontWeight.w500,
                                fontSize: 32,
                                letterSpacing: 0.4,
                                color: const Color(0xFF000000),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        _buildTextField(
                          context,
                          controller: _email,
                          label: 'Username',
                          icon: Icons.person,
                        ),
                        const SizedBox(height: 20),
                        _buildTextField(
                          context,
                          controller: _password,
                          label: 'Password',
                          icon: Icons.lock,
                          obscureText: true,
                        ),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Forget Password?',
                            style: GoogleFonts.getFont(
                              'Roboto Condensed',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: const Color(0xFF000000),
                            ),
                          ),
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
                              context.read<LoginCubit>().login(
                                    _email.text,
                                    _password.text,
                                  );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Text(
                                'LoginScreen',
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
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(RegisterScreen.routeName);
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFCF6F6),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 17.5, 0, 20.5),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'New user sign up here',
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
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildTextField(BuildContext context,
      {required String label,
      required IconData icon,
      bool obscureText = false,
      TextEditingController? controller}) {
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
