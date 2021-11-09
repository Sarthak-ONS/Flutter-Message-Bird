import 'package:flutter/cupertino.dart';

class UserData extends ChangeNotifier {
  String? name;
  String? email;
  String? token;
  String? photoUrl;

  changeUserDetails(
      String? name, String? email, String? token, String? photoUrl) {
    this.name = name;
    this.email = email;
    this.token = token;
    this.photoUrl = photoUrl;
    notifyListeners();
  }
}
