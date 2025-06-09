import 'package:migrant_profile/pages/forms/GroupB_third.dart';
import 'package:migrant_profile/repositories/local/record_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupbSecondFormController extends GetxController {
  final RecordRepository recordRepository = RecordRepository();
  final formField = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  RxString isDisabled = ''.obs;
  RxString wantGoAgainForeign = ''.obs;
  RxString workOnForeign = ''.obs;
  RxString workExperience = ''.obs;
  RxString skillTrainingAfterReturn = ''.obs;
  RxString currentWorking = ''.obs;
  RxString businessType = ''.obs;

  @override
  void onInit() {
    loadIfAvailable();
    super.onInit();
  }

  void loadIfAvailable() async {
    Map<String, dynamic> records = await recordRepository
        .retrieveRecordGroupBPart2(Get.arguments);
    wantGoAgainForeign.value = records['want_to_go_again']?.toString() ?? '';
    isDisabled.value = records['is_disabled_on_foreign']??'';
    workOnForeign.value = records['work_on_foreign'] ?? '';
    workExperience.value = records['work_exp_on_fe'] ?? '';
    skillTrainingAfterReturn.value = records['skill_training_after_return'] ?? '';
    currentWorking.value = records['occupation_now'] ?? '';
    businessType.value = records['business_type'] ?? '';
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
        var wantTogoAgain = int.parse(wantGoAgainForeign.value);
        await recordRepository.updateRecordGroupBPart2(recordId,
            wantTogoAgain,
            isDisabled.value,
            workOnForeign.value,
            workExperience.value,
            skillTrainingAfterReturn.value,
            currentWorking.value,
            businessType.value);
        Get.off(GroupbThird(), arguments: recordId);
        c = true;
      } catch (e) {
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
