import 'package:flutter/material.dart';

class UserModel with ChangeNotifier {
  String? userId, userName, userImage, userEmail;
  UserModel({
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.userEmail,
  });
  toJson() {
    return {
      "FullName": userName,
      "UID": userId,
      "profilePhoto": userImage,
      "Email": userEmail,
    };
  }
}
