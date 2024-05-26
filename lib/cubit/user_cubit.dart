import 'package:dio/dio.dart';
import 'package:epic_expolre/cache/cache_helper.dart';
import 'package:epic_expolre/core/api/api_consumer.dart';
import 'package:epic_expolre/core/api/const_end_ponits.dart';
import 'package:epic_expolre/core/errors/exceptions.dart';
import 'package:epic_expolre/core/models/sign_in_model.dart';
import 'package:epic_expolre/core/models/sign_up_model.dart';
import 'package:epic_expolre/core/models/user_model.dart';
import 'package:epic_expolre/core/models/verification_model.dart';
import 'package:epic_expolre/cubit/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.api) : super(UserInitial());
  final ApiConsumer api;

  GlobalKey<FormState> resstPasswordFormKey = GlobalKey();
  GlobalKey<FormState> paymentFormKey = GlobalKey();
  GlobalKey<FormState> ForgetPasswordFormKey = GlobalKey();

  GlobalKey<FormState> VerificationFormkey = GlobalKey();

  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmNewPassword = TextEditingController();
  //Sign in email
  TextEditingController signInEmail = TextEditingController();

  TextEditingController otp = TextEditingController();
  TextEditingController resetPasswordEmail = TextEditingController();

  //Sign in password
  TextEditingController signInPassword = TextEditingController();

  //Sign Up Form key

  //Profile Pic
  //Sign up name
  TextEditingController signUpName = TextEditingController();

  //Sign up phone number
  TextEditingController signUpPhoneNumber = TextEditingController();

  //Sign up email
  TextEditingController signUpEmail = TextEditingController();

  //Sign up password
  TextEditingController signUpPassword = TextEditingController();

  //Sign up confirm password
  TextEditingController confirmPassword = TextEditingController();
  SignInModel? user;
  VerificationModel? verificationModel;

  signUp() async {
    try {
      emit(SignUpLoading());
      final response = await api.post(
        EndPoint.register,
        isFromData: true,
        data: {
          ApiKey.name: signUpName.text,
          ApiKey.email: signUpEmail.text,
          ApiKey.password: signUpPassword.text,
          ApiKey.confirmPassword: confirmPassword.text,
        },
      );
      final signUPModel = SignUpModel.fromJson(response);
      // CacheHelper().saveData(key: ApiKey.token, value: user!.token);
      // CacheHelper().saveData(key: ApiKey.id, value: user!.id);
      print("SignUp Done And ID is :${user!.id}");
      emit(SignUpSuccess(message: signUPModel.message));
    } on ServerException catch (e) {
      emit(SignUpFailure(errMessage: e.errModel.errorMessage));
    }
  }

  signIn() async {
    try {
      emit(SignInLoading());
      final response = await api.post(
        EndPoint.signIn,
        data: {
          ApiKey.email: signInEmail.text,
          ApiKey.password: signInPassword.text,
        },
      );
      user = SignInModel.fromJson(response);
      CacheHelper().saveData(key: ApiKey.token, value: user!.token);
      CacheHelper().saveData(key: ApiKey.id, value: user!.id);
      print("LogIn Done And ID is :  ${user!.id}");
      emit(SignInSuccess());
    } on ServerException catch (e) {
      emit(SignInFailure(errMessage: e.errModel.errorMessage));
    }
  }

  logout() async {
    try {
      emit(LogoutLoading());
      final response = await api.post(
        EndPoint.logout,
        option: Options(headers: {
          'Authorization': 'Bearer ${user!.token}',
        }),
      );
      CacheHelper().removeData(key: ApiKey.token);
      emit(LogoutSuccess());
    } on ServerException catch (e) {
      emit(LogoutFailure(errMessage: e.errModel.errorMessage));
    }
  }

  forgotPassword() async {
    try {
      emit(ForgetPasswordLoading());
      final response = await api.post(
        EndPoint.forgot_password,
        data: {
          ApiKey.email: resetPasswordEmail.text,
        },
      );
      verificationModel = VerificationModel.fromJson(response);
      CacheHelper()
          .saveData(key: ApiKey.otp, value: verificationModel!.token[0].otp);
      emit(ForgetPasswordSuccess());
    } on ServerException catch (e) {
      emit(ForgetPasswordFailure(errMessage: e.errModel.errorMessage));
    }
  }

  resetPassword() async {
    try {
      emit(ResetPasswordLoading());
      final response = await api.put(
        EndPoint.reset_password,
        data: {
          ApiKey.email: resetPasswordEmail.text,
          'otp': CacheHelper().getData(key: ApiKey.token),
          ApiKey.newPassword: newPassword.text,
          ApiKey.confirmNewPassword: confirmNewPassword.text
        },
      );
      emit(ResetPasswordSuccess());
    } on ServerException catch (e) {
      emit(ResetPasswordFailure(errMessage: e.errModel.errorMessage));
    }
  }
}
