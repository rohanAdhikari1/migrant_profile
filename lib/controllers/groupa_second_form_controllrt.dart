import 'package:migrant_profile/pages/forms/GroupA_third.dart';
import 'package:migrant_profile/repositories/local/record_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupaSecondFormController extends GetxController {
  final RecordRepository recordRepository = RecordRepository();
  final formField = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  RxString travelMethod = ''.obs;
  RxString travelRoute = ''.obs;
  RxString selectedVisa = ''.obs;
  RxString isSkilled = ''.obs;
  RxString havePermission = ''.obs;
  RxString haveDocumentInHome = ''.obs;
  RxString amountPaidForFe = ''.obs;
  RxString amountPaidForFeMedium = ''.obs;

  // late TextEditingController skillNameController;
  // RxString permissionSourceMethod = ''.obs;
  // var selectedDocuments = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    // skillNameController = TextEditingController();
    loadIfAvailable();
  }

  void loadIfAvailable() async {
    Map<String, dynamic> records = await recordRepository
        .retrieveRecordGroupAPart2(Get.arguments);
    travelMethod.value = records['travel_method'] ?? '';
    travelRoute.value = records['travel_road'] ?? '';
    selectedVisa.value = records['visa_type']??'';
    isSkilled.value = (records['is_skilled']?.toString()) ?? '';
    havePermission.value =
        (records['have_communication_permission']?.toString()) ?? '';
    haveDocumentInHome.value = records['have_document_in_home']?? '';
    amountPaidForFe.value = records['fe_fee'] ?? '';
    amountPaidForFeMedium.value = records['fe_fee_paid_method'] ?? '';
    // initializeFromCommaSeparatedValues(records['document_type'] ?? '');
  }

  @override
  void onClose() {
    super.onClose();
    formField.currentState?.reset();
  }

  // String getCommaSeparatedValues() {
  //   return selectedDocuments.join(',');
  // }
  //
  // void initializeFromCommaSeparatedValues(String values) {
  //   selectedDocuments.value = values.isNotEmpty ? values.split(',') : [];
  // }
  //
  // void toggleSelection(String item) {
  //   if (selectedDocuments.contains(item)) {
  //     selectedDocuments.remove(item);
  //   } else {
  //     selectedDocuments.add(item);
  //   }
  // }

  void submit() async {
    if (formField.currentState!.validate()) {
      isLoading.value = true;
      bool c;
      try {
        c = false;
        var sIsSkilled = isSkilled.value;
        var sHavePermission = havePermission.value;
        var sHaveDocumentInHome = haveDocumentInHome.value;
        var isSkilledInt = int.parse(sIsSkilled);
        var havePermissionInt = int.parse(sHavePermission);
        var recordId = Get.arguments;
        await recordRepository.updateRecordGroupAPart2(recordId,
            travelMethod.value,
            travelRoute.value,
            selectedVisa.value,
            amountPaidForFe.value,
            amountPaidForFeMedium.value,
            isSkilledInt,
            havePermissionInt,
            sHaveDocumentInHome);
        Get.off(GroupaThird(), arguments: recordId);
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
