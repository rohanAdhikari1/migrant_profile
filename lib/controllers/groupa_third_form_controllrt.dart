import 'package:survey/pages/forms/GroupA_fourth.dart';
import 'package:survey/repositories/local/record_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupaThirdFormController  extends GetxController {
  final RecordRepository recordRepository = RecordRepository();
  final formField = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  RxString travelMethod = ''.obs;
  RxString travelRoute = ''.obs;
  RxString paidAmount = ''.obs;
  RxString paidSource = ''.obs;
  RxString loanSource = ''.obs;
  RxString loanInterest = ''.obs;
  RxString isLoanPaid = ''.obs;
  RxString loanPaidTime = ''.obs;
  RxString haveProblemInForeignEmployment = ''.obs;
  var selectedProblems = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadIfAvailable();
  }

  void loadIfAvailable() async{
    Map<String, dynamic> records = await recordRepository.retrieveRecordGroupAPart3(Get.arguments);
    travelMethod.value=records['travel_method']??'';
    travelRoute.value=records['travel_road']??'';
    paidAmount.value = records['travel_fee']??'';
    paidSource.value = records['expense_source_abroad']??'';
    loanSource.value = records['loan_taken_from']??'';
    loanInterest.value = records['interest_rate_on_loan']??'';
    isLoanPaid.value = records['is_loan_fully_repaid']?.toString()??'';
    loanPaidTime.value = records['loan_repayment_duration']??'';
    haveProblemInForeignEmployment.value = records['faced_problems_abroad']?.toString()??'';
    initializeFromCommaSeparatedValues(records['problem_type']??'');
  }

  @override
  void onClose(){
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

  void submit() async{
    if(formField.currentState!.validate()) {
      isLoading.value = true;
      bool c;
      try {
        c=false;
        var isLoanPaidInt = int.parse(isLoanPaid.value);
        var abroadProblem = int.parse(haveProblemInForeignEmployment.value);
        var recordId = Get.arguments;
        await recordRepository.updateRecordGroupAPart3(recordId, travelMethod.value, travelRoute.value, paidAmount.value, paidSource.value, loanSource.value, loanInterest.value, isLoanPaidInt, loanPaidTime.value,abroadProblem,getCommaSeparatedValues());
        Get.off(GroupaFourth(),arguments: recordId);
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