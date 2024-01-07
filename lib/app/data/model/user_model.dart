

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../provider/user_firebase.dart';

class UserAccount extends GetxController {
  static UserAccount? info;

  final String uid;
  final String username;
   final List<String> selectedLanguage;
    final String selectedjobs;
  final String email;
  late String imageUrl;
  final String phoneNumber;
  final String country;
  final String descrption;
  final String experience;
  final bool? isCompany;
  UserAccount({
    required this.uid,
    required this.username,
    required this.imageUrl,
    required this.phoneNumber,
    required this.descrption,
    required this.selectedLanguage,
      required this.selectedjobs,
    required this.email,
    required this.country,
    required this.experience,
    required this.isCompany,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uuid': uid,
      'username': username,
      'imageUrl': imageUrl,
      'phoneNumber': phoneNumber,
      'jobDescrption': descrption,
      'email': email,
      'country': country,
    'selectedLanguage': selectedLanguage,
     '  experience': experience,
      'selectedjobs' :selectedjobs,
      'isCompany': isCompany ?? false,
    };
  }

  factory UserAccount.formJson(Map<String, dynamic> json) {
    info = UserAccount(
        uid: json["uuid"] ?? "uuid",
        username: json['username'] ?? "UserName",
        imageUrl: json['imageUrl'] ?? "ImageUrl",
        phoneNumber: json['phoneNumber'] ?? "PhoneNumber",
        descrption: json['jobDescrption'] ?? "Dec",
        email: json['email'] ?? "Email",
        country: json['country'] ?? "Couuntry",
       selectedLanguage: json['Programing Language'] != null
          ? List<String>.from(json['Programing Language'])
          : ["Null"],
      selectedjobs: json['jobs'] ?? "SelectedJobs",
        experience: json['experience'] ?? "experience",
        isCompany: json['isCompany'] ?? false);
    return info!;
  }

  UserAccount copyWith(
      {String? uid,
      String? username,
      String? email,
      String? imageUrl,
      String? phoneNumber,
      String? descrption,
      String? country,
       String? experience,
      String? selectedjobs,
     List<String>? selectedLanguage,}) {
    return UserAccount(
      uid: uid ?? this.uid,
      username: username ?? this.username,
      imageUrl: imageUrl ?? this.imageUrl,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      descrption: descrption ?? this.descrption,
      email: email ?? this.email,
      country: country ?? this.country,
       selectedLanguage: selectedLanguage ?? this.selectedLanguage,
      selectedjobs: selectedjobs ?? this.selectedjobs,
      experience: experience ?? this.experience,
      isCompany: isCompany ?? this.isCompany,
    );
  }

  @override
  String toString() {
    return '''UserAccount [] (
      uuid: $uid,
      username: $username,
      imageUrl: $imageUrl,
      phoneNumber: $phoneNumber,
      jobDescrption: $descrption,
      email: $email,
      countrey:$country,
   selectedLanguage:$selectedLanguage,
//     selectedjobs:$selectedjobs
    experience:$experience,
    isCompany:$isCompany,
    )''';
  }

  // Future<void> updateCurrentUser() async {
  //   try {
  //     await DatabaseFirestore.updateUser(userAccount: this);
  //     update();
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print('error updating user account: $e');
  //     }
  //   }
  // }
}
