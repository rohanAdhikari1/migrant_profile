import 'package:survey/services/user_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileController  extends GetxController {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController middleName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController primaryPhone = TextEditingController();
  final TextEditingController secondryPhone = TextEditingController();
  final TextEditingController address = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    initializeData();
  }

  void initializeData() async {
    UserService userService = UserService();
    Map<String, dynamic> userData = await userService.getUserData();
    firstName.text=userData['first_name'];
    middleName.text=userData['middle_name'];
    lastName.text=userData['last_name'];
    email.text=userData['email'];
    primaryPhone.text=userData['primary_phone'];
    secondryPhone.text=userData['secondary_phone'];
    address.text=userData['address'];
  }
}