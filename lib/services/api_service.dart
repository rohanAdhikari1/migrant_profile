import 'package:survey/Pages/Auth/login.dart';
import 'package:survey/services/user_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApiService{
  final Dio _dio;
  final UserService _userService = UserService();

  ApiService() : _dio = Dio() {
    _dio.options.baseUrl = 'https://gramthan.assolution.com.np/api/';
    _dio.options.connectTimeout = Duration(seconds: 5);
    _dio.options.receiveTimeout = Duration(seconds: 3);

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async  {
        var user =await  _userService.getUserData();
        options.headers['Authorization'] = 'Bearer ${user['token']}';
        options.headers['Content-Type'] = 'application/json';
        options.headers['accept'] = 'application/json';
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioException error, handler) {
        if (error.response?.statusCode == 401) {
          _userService.clearUserData();
          Get.snackbar(
            "Error",
            "Session Expired! Please ReLogin to Continue..",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
          Get.offAll(() => Login());
        }
        print(error.response);
        return handler.next(error);
      },
    ));
  }
  get dio => _dio;
}
