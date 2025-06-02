import 'package:survey/pages/forms/GroupA_second.dart';
import 'package:survey/repositories/local/record_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupaFirstFormController  extends GetxController {
  final RecordRepository recordRepository = RecordRepository();
  final formField = GlobalKey<FormState>();
  late TextEditingController nameController,ageController,countryController,visitTimeController,foreignOccupationController;
  RxBool isLoading = false.obs;
  RxString selectedGender = ''.obs;
  RxString selectedCaste = ''.obs;
  RxString maritalStatus = ''.obs;
  RxString contactTimes = ''.obs;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    ageController = TextEditingController();
    countryController = TextEditingController();
    visitTimeController = TextEditingController();
    foreignOccupationController = TextEditingController();
    loadIfAvailable();
  }

  void loadIfAvailable() async{
    Map<String, dynamic> records = await recordRepository.retrieveRecordGroupAPart1(Get.arguments);
    nameController.text = records['name']??'';
    selectedGender.value = records['gender']??'';
    ageController.text = records['age']?.toString()??'';
    maritalStatus.value = records['marital_status']??'';
    countryController.text = records['migrated_country']??'';
    selectedCaste.value = records['caste']??'';
    foreignOccupationController.text = records['foreign_occupation']??'';
    contactTimes.value=records['home_contact_times']??'';
    visitTimeController.text = records['migrated_times']?.toString()??'';
  }

  void submit() async{
    if(formField.currentState!.validate()) {
      isLoading.value = true;
      bool c;
      try {
        c=false;
        var name = nameController.text;
        var sAge = ageController.text;
        var age = int.parse(sAge);
        var country = countryController.text;
        var visitTime = visitTimeController.text;
        var foreignOccu = foreignOccupationController.text;
        var recordId= Get.arguments;
        await recordRepository.updateRecordGroupAPart1(recordId,name,age,country,visitTime,foreignOccu,selectedGender.value,
        selectedCaste.value,maritalStatus.value,contactTimes.value);
        Get.off(GroupaSecond(),arguments: recordId);
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