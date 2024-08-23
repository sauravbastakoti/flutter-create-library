import 'package:KrishiKranti/core/shared_prefences/locator.dart';
import 'package:KrishiKranti/cubits/otp_verify/otp_verify_cubit.dart';
import 'package:KrishiKranti/features/forgot_password/otp_page/otp_page.dart';
import 'package:KrishiKranti/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OtpForgotPasswordCubit(locator.get<ApiService>()),
      child: Builder(builder: (context) {
        return BlocListener<OtpForgotPasswordCubit, OtpForgotPasswordState>(
          listener: (context, state) {
            if (state.status == OtpForgotPasswordStatus.success) {
              //  Get.to(ForgotPasswordOtp(email: _emailController.text));
            }
          },
          child: Scaffold(
            backgroundColor: Colors.green.shade50,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    const SizedBox(height: 40),
                    const Icon(
                      Icons.lock_outline,
                      size: 100,
                      color: Colors.green,
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      'Enter Email Address',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Forget Password',
                        labelStyle: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<OtpForgotPasswordCubit>()
                            .otpforgotpasswordverify(_emailController.text);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Send',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
