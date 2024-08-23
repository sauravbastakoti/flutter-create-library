// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:provider/provider.dart';

// class ForgotPasswordOtp extends StatefulWidget {
//   const ForgotPasswordOtp({super.key, required this.email});
//   final String email;

//   @override
//   State<ForgotPasswordOtp> createState() => _ForgotPasswordOtpState();
// }

// class _ForgotPasswordOtpState extends State<ForgotPasswordOtp> {
//   String? pswotpCode;
//   @override
//   Widget build(BuildContext context) {
//     /////blocPtovider to use

//     return BlocListener<OtpForgotPasswordCubit, OtpForgotPasswordState>(
//         listener: (context, state) async {
//           if (state.status == OtpForgotPasswordStatus.success) {
//             ///new screen
//           } else if (state.status == OtpForgotPasswordStatus.error) {
//             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//               content: MoreClubCustomError(
//                 error: 'Error',
//                 errorText: state.errorMessage!,
//               ),
//               behavior: SnackBarBehavior.floating,
//               backgroundColor: Colors.transparent,
//               elevation: 0,
//             ));
//           }
//         },
//         child: Scaffold(
//           appBar: AppBar(
//             title: const Text('Reset password'),
//           ),
//           body: Container(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 const SizedBox(
//                   height: 200,
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.only(left: 20),
//                   child: Text(
//                     'Verify Your OTP',
//                     style: TextStyle(
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.only(left: 20),
//                   child: Text(
//                     'Enter the verification code we just sent on your email address or phone number.',
//                     style: TextStyle(
//                       fontSize: 16,
//                       //fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 60,
//                 ),
//                 OtpTextField(
//                   numberOfFields: 6,
//                   fillColor: Colors.blue,
//                   // borderColor: mainColor,

//                   showFieldAsBox: true,

//                   onSubmit: (String verificationCode) {
//                     pswotpCode = verificationCode;
//                   }, // end onSubmit
//                 ),
//                 const SizedBox(
//                   height: 60,
//                 ),
//                 TextButton(
//                   onPressed: () async {
//                     if (pswotpCode != null && pswotpCode!.length == 6) {
//                       context
//                           .read<OtpForgotPasswordCubit>()
//                           .otpforgotpasswordverify(
//                             widget.username,
//                             pswotpCode!,
//                           );
//                     }
//                   },
//                   child: Container(
//                       alignment: Alignment.center,
//                       height: 60,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: buttonColor,
//                           boxShadow: const [
//                             BoxShadow(
//                                 //color: Colors.black.withOpacity(0.1),
//                                 )
//                           ]),
//                       child: const Text(
//                         'Verify Otp',
//                         style: TextStyle(
//                             color: mobileBackgroundColor, fontSize: 18),
//                       )),
//                 ),
//                 // Container(
//                 //   decoration: BoxDecoration(
//                 //     color:
//                 //         mainColor, // Set the background color of the container
//                 //     borderRadius: BorderRadius.circular(
//                 //         10), // Set the border radius to make it rounded
//                 //     boxShadow: [
//                 //       BoxShadow(
//                 //         color: Colors.grey
//                 //             .withOpacity(0.5), // Set the shadow color
//                 //         spreadRadius: 5, // Set how far the shadow spreads
//                 //         blurRadius:
//                 //             7, // Set the blur radius of the shadow
//                 //         offset: const Offset(
//                 //             0, 3), // Set the offset of the shadow
//                 //       ),
//                 //     ],
//                 //   ),
//                 //   child: TextButton(
//                 //     onPressed: () async {
//                 //       if (pswotpCode != null && pswotpCode!.length == 6) {
//                 //         context
//                 //             .read<OtpForgotPasswordCubit>()
//                 //             .otpforgotpasswordverify(
//                 //               widget.username,
//                 //               pswotpCode!,
//                 //             );
//                 //       }
//                 //     },
//                 //     child: const Text('Verify Otp'),
//                 //   ),
//                 // ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 const Divider(),
//                 const SizedBox(height: 40),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text('Didn\'t recieve code?'),
//                     TextButton(
//                       onPressed: () {},
//                       child: const Text(
//                         'Resend Otp',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }
