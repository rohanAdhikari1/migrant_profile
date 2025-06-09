import 'package:migrant_profile/pages/forms/GroupA_fifth.dart';
import 'package:migrant_profile/repositories/local/record_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupaFourthFormController extends GetxController {
  final RecordRepository recordRepository = RecordRepository();
  final formField = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  RxString covidHealthProblem = ''.obs;
  RxString foreignEmploymentFamilyIssue = ''.obs;
  var selectedProblems = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadIfAvailable();
  }

  void loadIfAvailable() async {
    Map<String, dynamic> records = await recordRepository
        .retrieveRecordGroupAPart4(Get.arguments);
    covidHealthProblem.value = records['covid_health_issue_type'] ?? '';
    foreignEmploymentFamilyIssue.value = records['home_problem_type'] ?? '';
    initializeFromCommaSeparatedValues(records['covid_problem_type'] ?? '');
  }

  @override
  void onClose() {
    super.onClose();
    formField.currentState?.reset();
  }

  String getCommaSeparatedValues() {
    return selectedProblems.join(',');
  }

  void initializeFromCommaSeparatedValues(String values) {
    selectedProblems.value = values.isNotEmpty ? values.split(',') : [];
  }

  void toggleSelection(String item) {
    if (selectedProblems.contains(item)) {
      selectedProblems.remove(item);
    } else {
      selectedProblems.add(item);
    }
  }

  void submit() async {
    if (formField.currentState!.validate()) {
      isLoading.value = true;
      bool c;
      try {
        c = false;
        var recordId = Get.arguments;
        await recordRepository.updateRecordGroupAPart4(
          recordId,
          covidHealthProblem.value,
          foreignEmploymentFamilyIssue.value,
          getCommaSeparatedValues(),
        );
        Get.off(GroupaFifth(), arguments: recordId);
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
