import 'package:survey/pages/forms/GroupB_third.dart';
import 'package:survey/repositories/local/record_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupbSecondFormController  extends GetxController {
  final RecordRepository recordRepository = RecordRepository();
  final formField = GlobalKey<FormState>();
  late TextEditingController occupationController,skillNameController;
  RxBool isLoading = false.obs;
  RxString wantGoAgainForeign = ''.obs;
  RxString currentWorking = ''.obs;
  RxString knowAboutSkillTest = ''.obs;
  RxString doneSkillTest = ''.obs;
  RxString wantSkillTest = ''.obs;
  // skill_before_migration
  var selectedSkillBeforeMigration = <String>[].obs;

  @override
  void onInit() {
    skillNameController = TextEditingController();
    occupationController = TextEditingController();
    loadIfAvailable();
    super.onInit();
  }

  void loadIfAvailable() async{
    Map<String, dynamic> records = await recordRepository.retrieveRecordGroupBPart2(Get.arguments);
    print(records);
    wantGoAgainForeign.value = records['want_to_go_again']?.toString()??'';
    occupationController.text=records['employed_as']??'';
    skillNameController.text = records['skill_before_migration']??'';
    currentWorking.value=records['occupation_now']??'';
    knowAboutSkillTest.value = records['know_skill_test']?.toString()??'';
    doneSkillTest.value = records['have_done_skill_test']?.toString()??'';
    wantSkillTest.value = records['want_to_skill_test']?.toString()??'';
    initializeFromCommaSeparatedValues(records['skilled_occupation']??'');
  }

  String getCommaSeparatedValues() {
    return selectedSkillBeforeMigration.join(',');
  }

  void initializeFromCommaSeparatedValues(String values) {
    selectedSkillBeforeMigration.value = values.isNotEmpty ? values.split(',') : [];
  }

  void toggleSelection(String item) {
    if (selectedSkillBeforeMigration.contains(item)) {
      selectedSkillBeforeMigration.remove(item);
    } else {
      selectedSkillBeforeMigration.add(item);
    }
  }

  @override
  void onClose(){
    super.onClose();
    formField.currentState?.reset();
  }

  void submit() async{
    if(formField.currentState!.validate()) {
      isLoading.value = true;
      bool c;
      try {
        c=false;
        var recordId = Get.arguments;
        var wantTogoAgain = int.parse(wantGoAgainForeign.value);
        var knowSkillTest = int.parse(knowAboutSkillTest.value);
        var haveDoneSkillTest = int.parse(doneSkillTest.value);
        var wantSkillTestInt = int.parse(wantSkillTest.value);
        await recordRepository.updateRecordGroupBPart2(recordId, wantTogoAgain, currentWorking.value, occupationController.text, skillNameController.text, getCommaSeparatedValues(), knowSkillTest, haveDoneSkillTest, wantSkillTestInt);
        Get.off(GroupbThird(),arguments: recordId);
        c=true;
      } catch (e) {
        print(e);
        c = false;
      }
      if(!c){
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