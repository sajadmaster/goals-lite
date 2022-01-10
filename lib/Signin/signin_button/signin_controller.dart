import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:goals_lite/Dashboard/dashboard_main_view.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class SignIn {
  onPressAppleButton(context) async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    ).then((credential) {
      // print("Sajad credential: $credential");

      final credentialFirebase = OAuthProvider("apple.com").credential(
          accessToken: credential.authorizationCode,
          idToken: credential.identityToken);

      auth.signInWithCredential(credentialFirebase).then((userObj) async {
        print('sajad Firebase user uid: ${userObj.user!.uid}');
        // print('sajad Firebase user displayName: ${userObj.user!.displayName}');
        // print('sajad Firebase user email: ${userObj.user!.email}');
        // print('sajad Firebase user isAnonymous: ${userObj.user!.isAnonymous}');
        // print('sajad Firebase user phoneNumber: ${userObj.user!.phoneNumber}');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DashboardPage()),
        );
        // print(userObj.user!.email);
        // print(userObj.user!.displayName);
      }).catchError((error) {
        // dismiss loading
        // print('Apple Login Error 2: ${error.toString()}');
      });
      print(credential);
    }).catchError((err) {
      // print("Apple Login Error 3: ${err.toString()}");
    });
  }
}
