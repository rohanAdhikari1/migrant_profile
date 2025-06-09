import 'package:migrant_profile/pages/forms/GroupA_second.dart';
import 'package:migrant_profile/repositories/local/record_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupaFirstFormController extends GetxController {
  final RecordRepository recordRepository = RecordRepository();
  final formField = GlobalKey<FormState>();
  late TextEditingController nameController,
      ageController;
  RxBool isLoading = false.obs;
  RxString selectedGender = ''.obs;
  RxString selectedRelation = ''.obs;
  RxString maritalStatus = ''.obs;
  RxString educationStatus = ''.obs;
  RxString selectedCountry = ''.obs;
  RxString migratedTimes = ''.obs;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    ageController = TextEditingController();
    loadIfAvailable();
  }

  void loadIfAvailable() async {
    Map<String, dynamic> records = await recordRepository
        .retrieveRecordGroupAPart1(Get.arguments);
    nameController.text = records['name'] ?? '';
    selectedGender.value = records['gender'] ?? '';
    ageController.text = records['age']?.toString() ?? '';
    maritalStatus.value = records['marital_status'] ?? '';
    selectedCountry.value = records['migrated_country'] ?? '';
    selectedRelation.value = records['relation_to_hr'] ?? '';
    migratedTimes.value = records['migrated_times']?? '';
    educationStatus.value = records['education_status'] ?? '';
  }

  void submit() async {
    if (formField.currentState!.validate()) {
      isLoading.value = true;
      bool c;
      try {
        c = false;
        var name = nameController.text;
        var sAge = ageController.text;
        var age = int.parse(sAge);
        var country = selectedCountry.value;
        var visitTime = migratedTimes.value;
        var recordId = Get.arguments;
        await recordRepository.updateRecordGroupAPart1(
          recordId,
          name,
          age,
          country,
          visitTime,
          selectedGender.value,
          selectedRelation.value,
          maritalStatus.value,
          educationStatus.value
        );
        Get.off(GroupaSecond(), arguments: recordId);
        c = true;
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
