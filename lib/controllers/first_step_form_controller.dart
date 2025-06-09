import 'package:migrant_profile/controllers/home_controller.dart';
import 'package:migrant_profile/pages/forms/GroupA_first.dart';
import 'package:migrant_profile/pages/forms/GroupB_first.dart';
import 'package:migrant_profile/pages/forms/step_second.dart';
import 'package:migrant_profile/repositories/local/record_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstStepFormController extends GetxController {
  final RecordRepository recordRepository = RecordRepository();
  final formField = GlobalKey<FormState>();
  late TextEditingController nameController,
      wardController,
      phoneController,
      addressController,
      address2Controller;
  late ValueNotifier<String?> selectedGender;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    wardController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();
    address2Controller = TextEditingController();
    selectedGender = ValueNotifier<String?>('male');
  }

  @override
  void onClose() {
    super.onClose();
    formField.currentState?.reset();
  }

  void submit() async {
    if (formField.currentState!.validate()) {
      isLoading.value = true;
      bool c;
      try {
        c = false;
        var name = nameController.text;
        var ward = wardController.text;
        var gender = selectedGender.value.toString();
        var phone = phoneController.text;
        var address1 = addressController.text;
        var address2 = address2Controller.text;
        var rid = await recordRepository.insertRecordPart1(name,
            address1,
            address2,
            ward,
            gender,
            phone);
        final homeController = Get.find<HomeController>();
        homeController.refreshCounts();
        Get.off(StepSecond(), arguments: rid);
        c = rid >= 1 ? true : false;
      } catch (e) {
        print(e);
        c = false;
      }
      if (!c) {
        Get.snackbar(
          "Error",
          "Something Went Wrong! Please try again later.",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
      isLoading.value = false;
    }
  }
}
