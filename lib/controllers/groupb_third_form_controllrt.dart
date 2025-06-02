import 'package:survey/pages/forms/groupB_fourth.dart';
import 'package:survey/repositories/local/record_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupbThirdFormController  extends GetxController {
  final RecordRepository recordRepository = RecordRepository();
  final formField = GlobalKey<FormState>();
  late TextEditingController savedForeignIncomeController;
  RxBool isLoading = false.obs;
  RxString wantToStartBusiness = ''.obs;
  RxString haveCurrentBusiness = ''.obs;

  var selectedRemittanceSpendSource = <String>[].obs;
  var selectedBusinessPlan = <String>[].obs;
  var selectedCurrentBusiness = <String>[].obs;


  @override
  void onInit() {
    super.onInit();
    savedForeignIncomeController = TextEditingController();
    loadIfAvailable();
  }

  void loadIfAvailable() async{
    Map<String, dynamic> records = await recordRepository.retrieveRecordGroupBPart3(Get.arguments);
    savedForeignIncomeController.text = records['saved_foreign_income'];
    wantToStartBusiness.value = records['plan_to_business'].toString();
    haveCurrentBusiness.value = records['doing_business'].toString();
    initializeFromCommaSeparatedValues(selectedRemittanceSpendSource, records['remittance_spend_source']);
    initializeFromCommaSeparatedValues(selectedBusinessPlan, records['business_plan']);
    initializeFromCommaSeparatedValues(selectedCurrentBusiness, records['current_business']);
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


  @override
  void onClose(){
    super.onClose();
    savedForeignIncomeController.dispose();
    formField.currentState?.reset();
  }

  void submit() async{
    if(formField.currentState!.validate()) {
      isLoading.value = true;
      bool c;
      try {
        c=false;
        var recordId = Get.arguments;
        var savedForeignIncome = savedForeignIncomeController.text;
        var planToBusiness =int.parse(wantToStartBusiness.value);
        var doingBusiness = int.parse(haveCurrentBusiness.value);
        await recordRepository.updateRecordGroupBPart3(recordId, savedForeignIncome, planToBusiness, doingBusiness,getCommaSeparatedValues(selectedRemittanceSpendSource),getCommaSeparatedValues(selectedBusinessPlan),getCommaSeparatedValues(selectedCurrentBusiness));
        Get.off(GroupbFourth(),arguments: recordId);
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