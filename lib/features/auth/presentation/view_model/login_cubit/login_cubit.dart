import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import 'package:shared_preferences/shared_preferences.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.dio) : super(LoginInitial());

  final Dio dio;

  Future<void> login({
    required String username,
    required String password,
  }) async {
    emit(LoginLoading());
    final prefs = await SharedPreferences.getInstance();

    try {
      final res = await dio.post(
        "https://dummyjson.com/auth/login",
        data: {"username": username, "password": password},
        options: Options(headers: {"Content-Type": "application/json"}),
      );
      
      if(res.statusCode == 200){
        final token = res.data["accessToken"] as String;
        debugPrint("Token: ${token.runtimeType}");

        await prefs.remove("token");
        await prefs.setString("token", token);
         emit(LoginSuccess());
      }else{
        emit(LoginFailure("Login failed"));
        return;
      }
     
    } catch (e) {
      emit(LoginFailure(e.toString()));
      return;
    }
  }

  void logout() async {
    emit(LoginLoading());
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("token");
    emit(LoginInitial()); 
  }
}
