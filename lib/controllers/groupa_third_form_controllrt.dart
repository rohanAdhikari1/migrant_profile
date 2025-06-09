import 'package:migrant_profile/pages/forms/GroupA_fifth.dart';
import 'package:migrant_profile/repositories/local/record_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupaThirdFormController extends GetxController {
  final RecordRepository recordRepository = RecordRepository();
  final formField = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  RxString foreignOccupation = ''.obs;
  RxString haveProblemInForeignEmployment = ''.obs;
  RxString haveFamilyProblemInForeignEmployment = ''.obs;
  var selectedProblems = <String>[].obs;
  var selectedFamilyProblems = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadIfAvailable();
  }

  void loadIfAvailable() async {
    Map<String, dynamic> records = await recordRepository
        .retrieveRecordGroupAPart3(Get.arguments);
    foreignOccupation.value = records['foreign_occupation'];
    haveProblemInForeignEmployment.value =
        records['faced_problems_abroad']?.toString() ?? '';
    haveFamilyProblemInForeignEmployment.value =
    records['home_problem']?.toString() ?? '';
    initializeFromCommaSeparatedValues(selectedProblems,records['problem_type'] ?? '');
    initializeFromCommaSeparatedValues(selectedFamilyProblems,records['home_problem_type'] ?? '');
  }

  @override
  void onClose() {
    super.onClose();
    formField.currentState?.reset();
  }

  String getCommaSeparatedValues(var source) {
    return source.join(',');
  }

  void initializeFromCommaSeparatedValues(var source,String values) {
    source.value = values.isNotEmpty ? values.split(',') : [];
  }

  void toggleSelection(var source,String item) {
    if (source.contains(item)) {
      source.remove(item);
    } else {
      source.add(item);
    }
  }

  void submit() async {
    if (formField.currentState!.validate()) {
      isLoading.value = true;
      bool c;
      try {
        c = false;
        var abroadProblem = int.parse(haveProblemInForeignEmployment.value);
        var abroadFamilyProblem = int.parse(haveFamilyProblemInForeignEmployment.value);
        var recordId = Get.arguments;
        await recordRepository.updateRecordGroupAPart3(recordId,
            foreignOccupation.value,
            abroadProblem,
            getCommaSeparatedValues(selectedProblems),
            abroadFamilyProblem,
            getCommaSeparatedValues(selectedFamilyProblems));
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
