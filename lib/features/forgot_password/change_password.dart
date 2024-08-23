import 'dart:developer';

import 'package:KrishiKranti/core/shared_prefences/locator.dart';
import 'package:KrishiKranti/cubits/change_password/change_password_cubit.dart';
import 'package:KrishiKranti/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ChangePassword extends StatefulWidget {
  static String routeName = 'ChangePassword';
  final String? token;

  const ChangePassword({super.key, this.token});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => ChangePasswordCubit(locator.get<ApiService>()),
      child: BlocListener<ChangePasswordCubit, ChangePasswordState>(
        listener: (context, state) {
          if (state.status == ChangePasswordStatus.success) {
            context.pop();

            // Add a popup if needed
          } else if (state.status == ChangePasswordStatus.error) {}
        },
        child: Scaffold(
          backgroundColor: const Color(0xFFD4FCE4),
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: const Text('Change Password'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                // Image.asset(
                //   UiAssets.changePassword,
                //   filterQuality: FilterQuality.high,
                // ),
                Padding(
                  padding: EdgeInsets.all(size.width * 0.03),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Change Password',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PrimaryFormField(
                              onSaved: (value) {},
                              title: 'Password',
                              isPassword: true,
                              controller: passwordController,
                              hintTxt: 'Enter Password',
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            PrimaryFormField(
                              title: 'Confirm Password',
                              isPassword: true,
                              controller: confirmPasswordController,
                              hintTxt: 'Enter Confirm Password',
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                          ],
                        ),
                        BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
                          builder: (context, state) {
                            if (state.status == ChangePasswordStatus.loading) {
                              return const CircularProgressIndicator();
                            }
                            return SizedBox(
                              width: double.infinity,
                              height: size.height * 0.07,
                              child: ElevatedButton(
                                onPressed: () {
                                  context
                                      .read<ChangePasswordCubit>()
                                      .changePasswordverify(
                                        passwordController.text,
                                        confirmPasswordController.text,
                                      );
                                },
                                child: const Text(
                                  'Change Password',
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PrimaryFormField extends StatelessWidget {
  final String title;
  final bool isPassword;
  final TextEditingController controller;
  final String hintTxt;
  final FormFieldValidator<String>? validator;
  final void Function(String?)? onSaved;

  const PrimaryFormField({
    super.key,
    required this.title,
    required this.controller,
    required this.hintTxt,
    this.isPassword = false,
    this.validator,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          TextFormField(
            controller: controller,
            obscureText: isPassword,
            decoration: InputDecoration(
              hintText: hintTxt,
              border: const OutlineInputBorder(),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            ),
            validator: validator,
            onSaved: onSaved,
          ),
        ],
      ),
    );
  }
}
