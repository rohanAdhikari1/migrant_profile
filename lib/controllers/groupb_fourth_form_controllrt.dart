import 'package:survey/pages/forms/GroupB_third.dart';
import 'package:survey/pages/forms/groupB_fourth.dart';
import 'package:survey/pages/forms/location_form.dart';
import 'package:survey/repositories/local/record_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupbFourthFormController  extends GetxController {
  final RecordRepository recordRepository = RecordRepository();
  final formField = GlobalKey<FormState>();
  late TextEditingController employeeOnBusinessController;
  RxBool isLoading = false.obs;

  RxString businessHelpFromGovernment = ''.obs;
  RxString expectedHelpFromGovernment = ''.obs;

  var selectedDifficultiesInBusiness= <String>[].obs;


  @override
  void onInit() {
    super.onInit();
    employeeOnBusinessController = TextEditingController();
    loadIfAvailable();
  }

  String getCommaSeparatedValues() {
    return selectedDifficultiesInBusiness.join(',');
  }

  void initializeFromCommaSeparatedValues(String values) {
    selectedDifficultiesInBusiness.value = values.isNotEmpty ? values.split(',') : [];
  }

  void toggleSelection(String item) {
    if (selectedDifficultiesInBusiness.contains(item)) {
      selectedDifficultiesInBusiness.remove(item);
    } else {
      selectedDifficultiesInBusiness.add(item);
    }
  }

  void loadIfAvailable() async{
    Map<String, dynamic> records = await recordRepository.retrieveRecordGroupBPart4(Get.arguments);
    employeeOnBusinessController.text = records['employees_on_current_business']?.toString()??'';
    businessHelpFromGovernment.value = records['business_help_government']??'';
    expectedHelpFromGovernment.value = records['want_help_type_from_business']??'';
    initializeFromCommaSeparatedValues(records['difficulties_to_start_business']??'');
  }

  @override
  void onClose(){
    super.onClose();
    employeeOnBusinessController.dispose();
    formField.currentState?.reset();
  }

  void submit() async{
    if(formField.currentState!.validate()) {
      isLoading.value = true;
      bool c;
      try {
        c=false;
        var recordId = Get.arguments;
        var employeeOnBusiness = int.parse(employeeOnBusinessController.text);
        await recordRepository.updateRecordGroupBPart4(recordId, employeeOnBusiness, businessHelpFromGovernment.value, expectedHelpFromGovernment.value,getCommaSeparatedValues());
        Get.off(LocationForm(),arguments: recordId);
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