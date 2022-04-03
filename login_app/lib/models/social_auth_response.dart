import 'package:login_app/utils/enums.dart';

class SocialAuthResponse{
  final LoginStatus loginStatus;
  final String email;
  final String profilePic;
  final String firstName;
  final String lastName;
  final String error;
  final String authCode;

  SocialAuthResponse(
  {required this.loginStatus, required this.profilePic, required this.firstName, required this.lastName, required this.error, required this.email, required this.authCode});
}