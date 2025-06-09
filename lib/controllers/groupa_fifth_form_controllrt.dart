import 'package:migrant_profile/pages/forms/GroupA_sixth.dart';
import 'package:migrant_profile/repositories/local/record_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupaFifthFormController extends GetxController {
  final RecordRepository recordRepository = RecordRepository();
  final formField = GlobalKey<FormState>();
  var remittanceAmountController = TextEditingController();

  RxBool isLoading = false.obs;
  RxString secondMarriageGender = ''.obs;
  RxString isElderAloneOnHome = ''.obs;
  RxString isChildrenOutForStudy = ''.obs;
  RxString isAmountSend= ''.obs;
  RxString remittanceCount= ''.obs;
  RxString amountNotSendReason= ''.obs;
  RxString childrenOutForStudy = ''.obs;

  var selectedRemittanceCollectMethod = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadIfAvailable();
  }

  void loadIfAvailable() async {
    Map<String, dynamic> records = await recordRepository
        .retrieveRecordGroupAPart5(Get.arguments);
    secondMarriageGender.value = records['remarried_gender'] ?? '';
    isElderAloneOnHome.value =
        (records['is_elder_only_home']?.toString()) ?? '';
    isChildrenOutForStudy.value =
        (records['is_children_out_for_study']?.toString()) ?? '';
    childrenOutForStudy.value = records['children_out_for_study']??'';
    isAmountSend.value = records['have_send_money']?.toString()??'';
    amountNotSendReason.value = records['money_not_send_problem']??'';
    remittanceCount.value = records['remittance_count']??'';
    remittanceAmountController.text =  records['remittance_amount']??'';
  }

  @override
  void onClose() {
    super.onClose();
    formField.currentState?.reset();
  }

  String getCommaSeparatedValues() {
    return selectedRemittanceCollectMethod.join(',');
  }

  void initializeFromCommaSeparatedValues(String values) {
    selectedRemittanceCollectMethod.value =
        values.isNotEmpty ? values.split(',') : [];
  }

  void toggleSelection(String item) {
    if (selectedRemittanceCollectMethod.contains(item)) {
      selectedRemittanceCollectMethod.remove(item);
    } else {
      selectedRemittanceCollectMethod.add(item);
    }
  }

  void submit() async {
    if (formField.currentState!.validate()) {
      isLoading.value = true;
      bool c;
      try {
        c = false;
        var recordId = Get.arguments;
        var remittanceAmount = remittanceAmountController.text;
        await recordRepository.updateRecordGroupAPart5(recordId,
            secondMarriageGender.value,
            int.parse(isElderAloneOnHome.value),
            int.parse(isChildrenOutForStudy.value),
            childrenOutForStudy.value,
            int.parse(isAmountSend.value),
            amountNotSendReason.value,
            remittanceCount.value,
            remittanceAmount);
        Get.off(GroupaSixth(), arguments: recordId);
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
