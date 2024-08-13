import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greatticket/features/login_register/register_screen.dart';
import 'package:greatticket/features/screens/dashboard.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _secureText = true;
  @override
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      resizeToAvoidBottomInset: false,
      body: ListView(
        shrinkWrap: true,
        children: [
          // SizedBox(height: 20,),
          const SizedBox(
            //height: MediaQuery.of(context).size.width / 3,
            //  width: MediaQuery.of(context).size.width / 3,
            child: Image(
              image: AssetImage('lib/assets/splash.png'),
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.95,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                  // bottomLeft: const Radius.circular(40.0),
                  // bottomRight: const Radius.circular(40.0),
                )),
            child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //
                    Column(
                      children: [
                        Text(
                          'LOGIN',
                          style: GoogleFonts.montserrat(
                              fontSize: 25,
                              // color: mainColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 5,
                    ),

                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                // controller: emailController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '*required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    labelText: 'Email/Phone',
                                    labelStyle:
                                        const TextStyle(color: Colors.black),
                                    hintText: 'Enter email/phone',
                                    prefixIcon: const Icon(
                                      Icons.mail,
                                      color: Colors.black,
                                    )),
                                textInputAction: TextInputAction.next),
                            const SizedBox(
                              height: 16,
                            ),
                            TextFormField(
                              //   controller: passwordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '*required';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                labelText: 'Password',
                                labelStyle:
                                    const TextStyle(color: Colors.black),
                                hintText: 'Password',
                                prefixIcon: const Icon(
                                  Icons.key,
                                  color: Colors.black,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _secureText = !_secureText;
                                    });
                                  },
                                  icon: Icon(_secureText
                                      ? Icons.remove_red_eye
                                      : Icons.remove_red_eye_outlined),
                                  color: Colors.black,
                                ),
                              ),
                              obscureText: _secureText,
                              onFieldSubmitted: (value) {
                                if (_formKey.currentState!.validate()) {
                                  //    _onLoading();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 8.0),
                        Text("Remember Me",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            )),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            context.pushNamed(DashboardScreen.routeName);
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 5,
                    ),
                    TextButton(
                        onPressed: () async {
                          context.pushNamed(RegisterScreen.routeName);
                        },
                        child: const Text(
                          'Forgot Password ?',
                          style: TextStyle(fontSize: 16),
                        )),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: 'Don\'t have an account?',
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' Register Now',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
