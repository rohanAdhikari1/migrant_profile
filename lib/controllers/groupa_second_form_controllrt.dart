import 'package:survey/pages/forms/GroupA_third.dart';
import 'package:survey/repositories/local/record_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupaSecondFormController  extends GetxController {
  final RecordRepository recordRepository = RecordRepository();
  final formField = GlobalKey<FormState>();
  late TextEditingController skillNameController;
  RxBool isLoading = false.obs;
  RxString isSkilled = ''.obs;
  RxString havePermission = ''.obs;
  RxString permissionSourceMethod = ''.obs;
  RxString haveDocumentInHome = ''.obs;
  var selectedDocuments = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    skillNameController = TextEditingController();
    loadIfAvailable();
  }

  void loadIfAvailable() async{
    Map<String, dynamic> records = await recordRepository.retrieveRecordGroupAPart2(Get.arguments);
    isSkilled.value = (records['is_skilled']?.toString())??'';
    havePermission.value = (records['have_communication_permission']?.toString())??'';
    permissionSourceMethod.value = records['communication_permission_method']??'';
    haveDocumentInHome.value = (records['have_document_in_home']?.toString())??'';
    skillNameController.text = records['skilled_occupation']??'';
    initializeFromCommaSeparatedValues(records['document_type']??'');
  }

  @override
  void onClose(){
    super.onClose();
    formField.currentState?.reset();
  }

  String getCommaSeparatedValues() {
    return selectedDocuments.join(',');
  }

  void initializeFromCommaSeparatedValues(String values) {
    selectedDocuments.value = values.isNotEmpty ? values.split(',') : [];
  }

  void toggleSelection(String item) {
    if (selectedDocuments.contains(item)) {
      selectedDocuments.remove(item);
    } else {
      selectedDocuments.add(item);
    }
  }

  void submit() async{
    if(formField.currentState!.validate()) {
      isLoading.value = true;
      bool c;
      try {
        c=false;
        var sIsSkilled = isSkilled.value;
        var sHavePermission = havePermission.value;
        var sHaveDocumentInHome = haveDocumentInHome.value;

        var skillName = skillNameController.text;
        var isSkilledInt = int.parse(sIsSkilled);
        var havePermissionInt = int.parse(sHavePermission);
        var documents = getCommaSeparatedValues();
        var haveDocumentInHomeInt = int.parse(sHaveDocumentInHome);
        var recordId = Get.arguments;
        await recordRepository.updateRecordGroupAPart2(recordId, isSkilledInt, skillName, havePermissionInt, permissionSourceMethod.value, haveDocumentInHomeInt, documents);
        Get.off(GroupaThird(),arguments: recordId);
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