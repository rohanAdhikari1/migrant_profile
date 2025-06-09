import 'package:migrant_profile/pages/forms/groupB_fourth.dart';
import 'package:migrant_profile/repositories/local/record_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupbThirdFormController extends GetxController {
  final RecordRepository recordRepository = RecordRepository();
  final formField = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  RxString desiredWorkArea=''.obs;
  var needForEmpOnNepal = <String>[].obs;
  var selectedBusinessProblem = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadIfAvailable();
  }

  void loadIfAvailable() async {
    Map<String, dynamic> records = await recordRepository
        .retrieveRecordGroupBPart3(Get.arguments);
    initializeFromCommaSeparatedValues(
      selectedBusinessProblem,
      records['difficulties_to_start_business'],
    );
    desiredWorkArea.value =records['desired_or_current_work_area_in_nepal']??'';
    initializeFromCommaSeparatedValues(
      needForEmpOnNepal,
      records['requirements_for_employment_in_nepal']??'',
    );
  }

  String getCommaSeparatedValues(var source) {
    return source.join(',');
  }

  void initializeFromCommaSeparatedValues(var source, String values) {
    source.value = values.isNotEmpty ? values.split(',') : [];
  }

  void toggleSelection(var source, String item) {
    if (source.contains(item)) {
      source.remove(item);
    } else {
      source.add(item);
    }
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
        await recordRepository.updateRecordGroupBPart3(recordId,
            getCommaSeparatedValues(selectedBusinessProblem),
            desiredWorkArea.value,
           getCommaSeparatedValues( needForEmpOnNepal));
        Get.off(GroupbFourth(), arguments: recordId);
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
