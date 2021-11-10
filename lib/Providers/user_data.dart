import 'package:flutter/cupertino.dart';

class UserData extends ChangeNotifier {
  String? name;
  String? email;
  String? token;
  String? photoUrl;
  String? id;

  changeUserDetails(String? name, String? email, String? token,
      String? photoUrl, String? id) {
    this.name = name;
    this.email = email;
    this.token = token;
    this.photoUrl = photoUrl;
    this.id = id;
    notifyListeners();
  }
}
