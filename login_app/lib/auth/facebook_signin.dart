import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:login_app/models/social_auth_response.dart';
import 'package:login_app/utils/enums.dart';

Future<SocialAuthResponse> facebookSignIn() async {
  LoginStatus loginStatus = LoginStatus.FAILED;
  String email = "";
  String profilePic = "";
  String firstName = "";
  String lastName = "";
  String error = "";
  String authCode = "";
  try {
    final fb = FacebookLogin();
    FacebookLoginResult result = await fb.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);

    switch (result.status) {
      case FacebookLoginStatus.success:
        final FacebookAccessToken? accessToken = result.accessToken;
        final fbProfile = await fb.getUserProfile();
        final fbImageUrl = await fb.getProfileImageUrl(width: 100);
        final fbEmail = await fb.getUserEmail();
        loginStatus = LoginStatus.SUCCESS;
        email = fbEmail ?? "";
        profilePic = fbImageUrl ?? "";
        firstName = fbProfile?.firstName ?? "";
        lastName = fbProfile?.lastName ?? "";
        authCode = accessToken?.token ?? "";

        break;
      case FacebookLoginStatus.cancel:
        throw Exception("Login Cancelled By User");
      case FacebookLoginStatus.error:
        throw Exception(result.error.toString());
    }
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

Future<bool> facebookSignOut() async {
  try {
    final fb = FacebookLogin();
    bool isLoggedIn = await fb.isLoggedIn;
    if (isLoggedIn) {
      await fb.logOut();
    }
    return true;
  } catch (e) {
    return false;
  }
}
