import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController{
  RxBool isLoading = false.obs;
  final formField = GlobalKey<FormState>();
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  final error = "".obs;

  void change(){
    if(formField.currentState!.validate()){
      print("Validated");
    }
  }
}
