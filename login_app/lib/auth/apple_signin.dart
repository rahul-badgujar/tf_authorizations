import 'package:login_app/models/social_auth_response.dart';
import 'package:login_app/utils/enums.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

Future<SocialAuthResponse> appleSignIn() async {
  LoginStatus loginStatus = LoginStatus.FAILED;
  String email = "";
  String profilePic = "";
  String firstName = "";
  String lastName = "";
  String error = "";
  String authCode = "";
  try {
    AuthorizationCredentialAppleID result =
        await SignInWithApple.getAppleIDCredential(scopes: [
      AppleIDAuthorizationScopes.email,
      AppleIDAuthorizationScopes.fullName,
    ]);
    loginStatus = LoginStatus.SUCCESS;
    email = result.email ?? "";
    firstName = result.givenName?.split(" ").first ?? "";
    lastName = result.givenName?.replaceFirst(firstName, "").trim() ?? "";
    authCode = result.authorizationCode;
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
