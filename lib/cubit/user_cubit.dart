
import 'package:dio/dio.dart';
import 'package:epic_expolre/cache/cache_helper.dart';
import 'package:epic_expolre/core/api/api_consumer.dart';
import 'package:epic_expolre/core/api/const_end_ponits.dart';
import 'package:epic_expolre/core/errors/exceptions.dart';
import 'package:epic_expolre/core/models/sign_in_model.dart';
import 'package:epic_expolre/core/models/sign_up_model.dart';
import 'package:epic_expolre/core/models/user_model.dart';
import 'package:epic_expolre/cubit/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.api) : super(UserInitial());
  final ApiConsumer api;

  //Sign in Form key
  GlobalKey<FormState> signInFormKey = GlobalKey();


  //Sign in email
  TextEditingController signInEmail = TextEditingController();

  //Sign in password
  TextEditingController signInPassword = TextEditingController();

  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();

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
      // var x = jsonDecode(jsonEncode(response));
      CacheHelper().saveData(key: ApiKey.token, value: user!.token);
      CacheHelper().saveData(key: ApiKey.id, value: user!.id);
      final signUPModel = SignUpModel.fromJson(response);
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
      print("This is id ididididid:  ${user!.id}");
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
        // data: {
        //   ApiKey.email: signInEmail.text,
        //   ApiKey.password: signInPassword.text,
        // },
        option: Options(headers: {
          'Authorization': user!.token
        }),

      );
      CacheHelper().removeData(key: ApiKey.token);
      emit(LogoutSuccess());
    } catch (e) {
      emit(LogoutFailure(errMessage: 'Logout failed'));
    }
  }
}

// getUserProfile() async {
//   try {
//     emit(GetUserLoading());
//     final response = await api.get(
//       EndPoint.getUserDataEndPoint(
//         CacheHelper().getData(key: ApiKey.id),
//       ),
//     );
//     emit(GetUserSuccess(user: UserModel.fromJson(response)));
//   } on ServerException catch (e) {
//     emit(GetUserFailure(errMessage: e.errModel.errorMessage));
//   }
// }
