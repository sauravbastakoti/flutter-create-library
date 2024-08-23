import 'package:equatable/equatable.dart';

class ProfileModel extends Equatable {
  final String? username;
  final String? email;
  final String? address;
  final String? phone;

  const ProfileModel({
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
  });

  // Factory constructor to create an instance from JSON
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      username: json['username'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      phone: json['phon_number']
          as String?, // Assuming 'phon_number' is the correct key in JSON
    );
  }

  @override
  List<Object?> get props => [username, email, address, phone];
}
