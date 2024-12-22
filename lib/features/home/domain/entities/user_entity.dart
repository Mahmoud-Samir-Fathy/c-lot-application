import 'package:e_commerce_app/core/asset_manager/app_images.dart';

class UserEntity {
  final String firstName;
  final String lastName;
  final String email;
  final String age;
  final String gender;
  final String image;

  UserEntity({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.age,
    required this.gender,
    required this.image,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      age: json['age'],
      gender: json['gender'],
      image: json['image'] ?? AppImages.defaultImage,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'age': age,
      'gender': gender,
      'image': image,
    };
  }
}
