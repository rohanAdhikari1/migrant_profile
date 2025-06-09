import 'package:migrant_profile/repositories/local/record_repository.dart';
import 'package:migrant_profile/services/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApiRepository{
  final ApiService apiService = ApiService();
  final RecordRepository recordRepository = RecordRepository();

  Future<bool> updateRecord(jsonData)async{
    try{
      var response = await apiService.dio.post('migrant',data:jsonData);
      Map<String,dynamic> decodedJson = response.data;
      if(decodedJson.isNotEmpty && response.statusCode == 200 && decodedJson['status']){
        return true;
      }else{
        Get.snackbar(
          "Error",
          "Something Went Wrong!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }on DioException catch (e){
      Get.snackbar(
        "Error",
        e.response?.data['message'] ??'An error occurred. Please try again later.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }catch(e){
      Get.snackbar(
        "Error",
        "An error occurred: ${e.toString()}",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
    return false;
  }
}