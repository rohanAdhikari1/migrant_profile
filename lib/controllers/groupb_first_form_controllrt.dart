import 'package:migrant_profile/pages/forms/GroupB_second.dart';
import 'package:migrant_profile/repositories/local/record_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupbFirstFormController extends GetxController {
  final RecordRepository recordRepository = RecordRepository();
  final formField = GlobalKey<FormState>();
  late TextEditingController nameController,
      ageController,
      phoneController,
  returnMaleCount,
  returnFeMaleCount,
      returnTimeController;
  RxBool isLoading = false.obs;
  RxString selectedGender = ''.obs;
  RxString selectedRelation = ''.obs;
  RxString selectedEducation = ''.obs;
  RxString selectedCountry = ''.obs;
  RxString maritalStatus = ''.obs;
  RxString returnTimeDuration = ''.obs;
  RxString returnReason = ''.obs;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    ageController = TextEditingController();
    returnTimeController = TextEditingController();
    phoneController = TextEditingController();
    returnMaleCount = TextEditingController();
    returnFeMaleCount = TextEditingController();
    loadIfAvailable();
  }

  void loadIfAvailable() async {
    Map<String, dynamic> records = await recordRepository
        .retrieveRecordGroupBPart1(Get.arguments);
    nameController.text = records['name']??'';
    ageController.text = (records['age']?.toString()) ?? '';
    selectedGender.value = records['gender'] ?? '';
    phoneController.text=records['contact_no']??'';
    selectedRelation.value = records['relation_to_hr'] ?? '';
    selectedEducation.value = records['education_status']??'';
    maritalStatus.value = records['marital_status']??'';
    selectedCountry.value = records['migrated_country']??'';
    returnTimeController.text = records['home_returned_after']?? '';
    returnTimeDuration.value = records['home_returned_after_duration']??'';
    returnReason.value = records['home_return_reason']??'';
    returnMaleCount.text = records['total_family_returned_male']?.toString()??'';
    returnFeMaleCount.text = records['total_family_returned_female']?.toString()??'';
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
        var recordId = Get.arguments;
        var name = nameController.text;
        var gender = selectedGender.value;
        var age = int.parse(ageController.text);
        var relation = selectedRelation.value;
        var homeReturnAfter = returnTimeController.text;
        var homeReturnDuration = returnTimeDuration.value;
        var homeReturnReason = returnReason.value;
        await recordRepository.updateRecordGroupBPart1(recordId,
            name,
            gender,
            age,
            maritalStatus.value,
            relation,
            homeReturnAfter,
            homeReturnDuration,
            homeReturnReason,
            selectedCountry.value,
            selectedEducation.value,
        int.parse(returnMaleCount.text),
        int.parse(returnFeMaleCount.text),
        phoneController.text);
        Get.off(GroupbSecond(), arguments: recordId);
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
