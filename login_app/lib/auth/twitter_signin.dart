import 'package:login_app/models/social_auth_response.dart';
import 'package:login_app/utils/enums.dart';
import 'package:twitter_login/entity/auth_result.dart';
import 'package:twitter_login/twitter_login.dart';

const TWITTER_API_KEY = "YOUR API KEY";
const TWITTER_API_SECRET_KEY = "YOUR API SECRET KEY";
const REDIRECT_URI = "";

Future<SocialAuthResponse> twitterSignIn() async {
  LoginStatus loginStatus = LoginStatus.FAILED;
  String email = "";
  String profilePic = "";
  String firstName = "";
  String lastName = "";
  String error = "";
  String authCode = "";
  try {
    TwitterLogin twitterLogin = TwitterLogin(
      apiKey: TWITTER_API_KEY,
      apiSecretKey: TWITTER_API_SECRET_KEY,
      redirectURI: REDIRECT_URI,
    );
    AuthResult result = await twitterLogin.login();
    switch (result.status) {
      case TwitterLoginStatus.loggedIn:
        loginStatus = LoginStatus.SUCCESS;
        email = result.user?.email ?? "";
        profilePic = result.user?.thumbnailImage ?? "";
        firstName = result.user?.name.split(" ").first ?? "";
        lastName = result.user?.name.replaceFirst(firstName, "").trim() ?? "";
        authCode = result.authToken ?? "";
        break;
      case TwitterLoginStatus.cancelledByUser:
        throw Exception("Login Cancelled By User");
      case TwitterLoginStatus.error:
        throw Exception(result.errorMessage ?? "");
      case null:
        throw Exception(result.errorMessage ?? "Auth result found null");
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
