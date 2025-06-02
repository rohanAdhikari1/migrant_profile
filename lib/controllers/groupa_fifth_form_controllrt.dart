import 'package:survey/pages/forms/GroupA_sixth.dart';
import 'package:survey/repositories/local/record_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupaFifthFormController  extends GetxController {
  final RecordRepository recordRepository = RecordRepository();
  final formField = GlobalKey<FormState>();
  var foreignMonthlyIncome = TextEditingController();
  var previousRemittanceAmountController = TextEditingController();
  var previousRemittanceTimesController = TextEditingController();
  var childrenOutForStudyLocationController = TextEditingController();
  RxBool isLoading = false.obs;
  RxString secondMarriageGender = ''.obs;
  RxString isElderAloneOnHome = ''.obs;
  RxString isChildrenOutForStudy = ''.obs;
  RxString salaryChangedDueToCovid = ''.obs;

  var selectedRemittanceCollectMethod = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadIfAvailable();
  }

  void loadIfAvailable() async {
    Map<String, dynamic> records = await recordRepository.retrieveRecordGroupAPart5(Get.arguments);
    secondMarriageGender.value = records['remarried_gender']??'';
    isElderAloneOnHome.value = (records['is_elder_only_home']?.toString())??'';
    isChildrenOutForStudy.value = (records['is_children_out_for_study']?.toString())??'';
    childrenOutForStudyLocationController.text = records['children_study_location']??'';
    foreignMonthlyIncome.text = records['total_foreign_income'];
    salaryChangedDueToCovid.value = records['salary_change']??'';
    initializeFromCommaSeparatedValues(records['remittance_method']??'');
    previousRemittanceTimesController.text = records['previous_year_remittance_count']?.toString()??'';
    previousRemittanceAmountController.text = records['previous_year_remittance_amount']??'';
  }

  @override
  void onClose(){
    super.onClose();
    formField.currentState?.reset();
  }

  String getCommaSeparatedValues() {
    return selectedRemittanceCollectMethod.join(',');
  }

  void initializeFromCommaSeparatedValues(String values) {
    selectedRemittanceCollectMethod.value = values.isNotEmpty ? values.split(',') : [];
  }

  void toggleSelection(String item) {
    if (selectedRemittanceCollectMethod.contains(item)) {
      selectedRemittanceCollectMethod.remove(item);
    } else {
      selectedRemittanceCollectMethod.add(item);
    }
  }

  void submit() async{
    if(formField.currentState!.validate()) {
      isLoading.value = true;
      bool c;
      try {
        c=false;
        var recordId = Get.arguments;
        var previousRemittanceCount= int.parse(previousRemittanceTimesController.text);
        var previousRemittanceAmount = previousRemittanceAmountController.text;
        await recordRepository.updateRecordGroupAPart5(recordId, secondMarriageGender.value.isNotEmpty?1:0, secondMarriageGender.value, int.parse(isElderAloneOnHome.value), int.parse(isChildrenOutForStudy.value), childrenOutForStudyLocationController.text, foreignMonthlyIncome.text,salaryChangedDueToCovid.value,getCommaSeparatedValues(),previousRemittanceCount,previousRemittanceAmount);
        Get.off(GroupaSixth(),arguments: recordId);
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