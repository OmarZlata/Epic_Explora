import 'package:epic_expolre/core/models/user_model.dart';

class UserState {}

final class UserInitial extends UserState {}

final class SignInSuccess extends UserState {}

final class ForgetPasswordLoading extends UserState {}

final class ForgetPasswordSuccess extends UserState {}

final class ForgetPasswordFailure extends UserState {
  final String errMessage;

  ForgetPasswordFailure({required this.errMessage});
}




final class ResetPasswordLoading extends UserState {}

final class ResetPasswordSuccess extends UserState {}

final class ResetPasswordFailure extends UserState {
  final String errMessage;

  ResetPasswordFailure({required this.errMessage});
}



final class GuiderLogOutLoading extends UserState {}

final class GuiderLogOutSuccess extends UserState {}

final class GuiderLogOutFailure extends UserState {
  final String errMessage;

  GuiderLogOutFailure({required this.errMessage});
}




final class GuiderSignInSuccess  extends UserState {}

final class GuiderSignInLoading extends UserState {}

final class GuiderSignInFailure extends UserState {
  final String errMessage;

  GuiderSignInFailure({required this.errMessage});
}




final class GuiderSignUpSuccess  extends UserState {}

final class GuiderSignUpLoading extends UserState {}

final class GuiderSignUpFailure extends UserState {
  final String errMessage;

  GuiderSignUpFailure({required this.errMessage});
}


final class VerificationLoading extends UserState {}

final class VerificationSuccess extends UserState {}

final class VerificationFailure extends UserState {
  final String errMessage;

  VerificationFailure({required this.errMessage});
}





final class UploadProfilePic extends UserState {}





final class SignInLoading extends UserState {}
final class LogoutLoading extends UserState {}

final class SignInFailure extends UserState {
  final String errMessage;

  SignInFailure({required this.errMessage});
}




final class SignUpSuccess extends UserState {
  final String message;

  SignUpSuccess({required this.message});
}

final class SignUpLoading extends UserState {}

final class LogoutSuccess extends UserState {}

final class SignUpFailure extends UserState {
  final String errMessage;

  SignUpFailure({required this.errMessage});
}

final class LogoutFailure extends UserState {
  final String errMessage;

  LogoutFailure({required this.errMessage});
}

final class GetUserSuccess extends UserState {
  final UserModel user;

  GetUserSuccess({required this.user});
}

final class GetUserLoading extends UserState {}

final class GetUserFailure extends UserState {
  final String errMessage;

  GetUserFailure({required this.errMessage});
}
