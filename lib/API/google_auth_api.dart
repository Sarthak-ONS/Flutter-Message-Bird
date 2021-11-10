import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_message_bird/Providers/user_data.dart';
import 'package:flutter_message_bird/Screens/login_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class GoogleSignInApi {
  final _googleSignIn = GoogleSignIn();

  Future loginWithGoogle(context) async {
    try {
      GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account != null) {
        GoogleSignInAuthentication? auth = await account.authentication;
        print(account.displayName);
        print(account.email);
        print(account.photoUrl);
        print(account.id);
        Provider.of<UserData>(context, listen: false).changeUserDetails(
            account.displayName,
            account.email,
            auth.accessToken,
            account.photoUrl,
            account.id);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    }
  }

  Future signout(context) async {
    try {
      _googleSignIn.signOut();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const LoginScreen()),
          (route) => false);
    } catch (e) {
      print(e);
    }
  }

  Future handleAutoSignIn(context) async {
    if (await _googleSignIn.isSignedIn()) {
      GoogleSignInAccount? account = await _googleSignIn.signInSilently();
      GoogleSignInAuthentication? auth = await account!.authentication;
      //print(Provider.of<UserData>(context, listen: false).name);
      print("/////////");
      // Provider.of<UserData>(context, listen: false).changeUserDetails(
      //   account.displayName,
      //   account.email,
      //   auth.accessToken,
      //   account.photoUrl,
      // );
      print(await _googleSignIn.isSignedIn());
      return true;
    }
    return false;
  }
}
