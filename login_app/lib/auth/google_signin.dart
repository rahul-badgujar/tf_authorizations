import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_app/models/social_auth_response.dart';
import 'package:login_app/utils/enums.dart';
import 'package:twitter_login/twitter_login.dart';

Future<SocialAuthResponse> googleSignIn() async {
  LoginStatus loginStatus = LoginStatus.FAILED;
  String email = "";
  String profilePic = "";
  String firstName = "";
  String lastName = "";
  String error = "";
  String authCode = "";
  try {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    GoogleSignInAccount? result = await _googleSignIn.signIn();
    if (result == null) {
      throw Exception("Some Error Occurred, Please Try Again Later.");
    }
    loginStatus = LoginStatus.SUCCESS;
    email = result.email;
    profilePic = result.photoUrl ?? "";
    firstName = result.displayName?.split(" ").first ?? "";
    lastName = result.displayName?.replaceFirst(firstName, "").trim() ?? "";
    authCode = result.serverAuthCode ?? "";
  } catch (e) {
    loginStatus = LoginStatus.FAILED;
    error = e.toString();
  }
  return SocialAuthResponse(
    loginStatus: loginStatus,
    email: email,
    profilePic: profilePic,
    firstName: firstName,
    lastName: lastName,
    error: error,
    authCode: authCode,
  );
}

Future<bool> googleSignOut() async {
  try {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    bool isSignedIn = await _googleSignIn.isSignedIn();
    if (isSignedIn) {
      GoogleSignInAccount? result = await _googleSignIn.signOut();
      if (result == null) {
        throw Exception("Some Error Occurred, Please Try Again Later.");
      }
    }
    return true;
  } catch (e) {
    return false;
  }
}
