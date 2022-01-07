import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class SignIn {
  onPressAppleButton({onResult(bool st, String error)?}) async {
    await Firebase.initializeApp();
    final FirebaseAuth auth = FirebaseAuth.instance;

    SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    ).then((credential) {
      print("APPLE=====>");

      final credentialFirebase = OAuthProvider("apple.com").credential(
          accessToken: credential.authorizationCode,
          idToken: credential.identityToken);

      auth.signInWithCredential(credentialFirebase).then((userObj) async {
        print(userObj.user!.uid);
      }).catchError((error) {
        // dismiss loading
        print(error.toString());
        onResult!(false, error.toString());
      });

      print(credential);
    }).catchError((err) {
      print("APPLE=====> ${err.toString()}");
    });
  }
}
