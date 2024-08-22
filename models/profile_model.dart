// {
//     "username": "user5",
//     "email": "user@example5.com",
//     "address": "123 Main... St",
//     "phone_number": "+1234567890"
// }

import 'package:equatable/equatable.dart';

class ProfileModel extends Equatable {
  final String username;
  final String email;
  final String address;
  final String phoneNumber;

  const ProfileModel(
      {required this.username,
      required this.email,
      required this.address,
      required this.phoneNumber});
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      username: json['username'],
      email: json['email'],
      address: json['address'],
      phoneNumber: json['phone_number'],
    );
  }
  @override
  List<Object?> get props => [username, email, address, phoneNumber];
}
