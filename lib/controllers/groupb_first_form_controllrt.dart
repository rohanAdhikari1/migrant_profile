import 'package:survey/pages/forms/GroupB_second.dart';
import 'package:survey/repositories/local/record_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupbFirstFormController  extends GetxController {
  final RecordRepository recordRepository = RecordRepository();
  final formField = GlobalKey<FormState>();
  late TextEditingController nameController,ageController, returnMaleCount,returnFemaleCount,countryController,returnTimeController;
  RxBool isLoading = false.obs;
  RxString selectedGender = ''.obs;
  RxString selectedCaste = ''.obs;
  RxString maritalStatus = ''.obs;
  RxString returnTimeDuration = ''.obs;
  RxString returnReason= ''.obs;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    ageController = TextEditingController();
    returnMaleCount = TextEditingController();
    returnFemaleCount = TextEditingController();
    countryController = TextEditingController();
    returnTimeController = TextEditingController();
    loadIfAvailable();
  }

  void loadIfAvailable() async{
    Map<String, dynamic> records = await recordRepository.retrieveRecordGroupBPart1(Get.arguments);
    nameController.text=records['name'];
    selectedGender.value = records['gender']??'';
    selectedCaste.value = records['caste']??'';
    ageController.text = (records['age']?.toString())??'';
    maritalStatus.value = records['marital_status'];
    returnMaleCount.text = (records['total_family_returned_male']?.toString())??'';
    returnFemaleCount.text = (records['total_family_returned_female']?.toString())??'';
    returnTimeDuration.value = records['home_returned_after'];
    returnReason.value = records['home_return_reason'];
    countryController.text = records['migrated_country'];
    returnTimeController.text = (records['migrated_times']?.toString())??'';
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
        var name=nameController.text;
        var gender = selectedGender.value;
        var age = int.parse(ageController.text);
        var caste = selectedCaste.value;
        var totalFamilyReturnMale = int.parse(returnMaleCount.text);
        var totalFamilyReturnFeMale= int.parse(returnFemaleCount.text);
        var homeReturnAfter = returnTimeDuration.value;
        var homeReturnReason = returnReason.value;
        var country = countryController.text;
        var migratedTimes = int.parse(returnTimeController.text);
        await recordRepository.updateRecordGroupBPart1(recordId, name, gender, age, maritalStatus.value, caste, totalFamilyReturnMale, totalFamilyReturnFeMale, homeReturnAfter, homeReturnReason, country, migratedTimes);
        Get.off(GroupbSecond(),arguments: recordId);
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