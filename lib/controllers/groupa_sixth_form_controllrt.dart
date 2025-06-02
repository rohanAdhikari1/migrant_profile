import 'package:survey/pages/forms/location_form.dart';
import 'package:survey/repositories/local/record_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupaSixthFormController  extends GetxController {
  final RecordRepository recordRepository = RecordRepository();
  final formField = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  RxString remittanceSavedSource = ''.obs;
  RxString planAfterReturn = ''.obs;
  RxString landFromRemittance = ''.obs;
  RxString landFromRemittanceLocation = ''.obs;
  RxString migrationPlanLocation = ''.obs;

  var selectedRemittanceSpend = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadIfAvailable();
  }

  void loadIfAvailable() async {
    Map<String, dynamic> records = await recordRepository.retrieveRecordGroupAPart6(Get.arguments);
    remittanceSavedSource.value = records['remittance_saving_method']??'';
    landFromRemittance.value = records['is_land_purchased']?.toString()??'';
    landFromRemittanceLocation.value = records['land_purchased_location']??'';
    migrationPlanLocation.value = records['migration_plan_location']??'';
    planAfterReturn.value = records['plan_after_return']??'';
    initializeFromCommaSeparatedValues(records['remittance_spend_source']??'');
  }

  @override
  void onClose(){
    super.onClose();
    formField.currentState?.reset();
  }

  String getCommaSeparatedValues() {
    return selectedRemittanceSpend.join(',');
  }

  void initializeFromCommaSeparatedValues(String values) {
    selectedRemittanceSpend.value = values.isNotEmpty ? values.split(',') : [];
  }

  void toggleSelection(String item) {
    if (selectedRemittanceSpend.contains(item)) {
      selectedRemittanceSpend.remove(item);
    } else {
      selectedRemittanceSpend.add(item);
    }
  }

  void submit() async{
    if(formField.currentState!.validate()) {
      isLoading.value = true;
      bool c;
      try {
        c=false;
        var recordId = Get.arguments;
        await recordRepository.updateRecordGroupAPart6(recordId, remittanceSavedSource.value, planAfterReturn.string, int.parse(landFromRemittance.value), landFromRemittanceLocation.value, migrationPlanLocation.value,getCommaSeparatedValues());
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