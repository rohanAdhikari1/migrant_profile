import 'package:migrant_profile/controllers/home_controller.dart';
import 'package:migrant_profile/pages/forms/GroupA_first.dart';
import 'package:migrant_profile/pages/forms/GroupB_first.dart';
import 'package:migrant_profile/repositories/local/record_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondStepFormController extends GetxController {
  final RecordRepository recordRepository = RecordRepository();
  final formField = GlobalKey<FormState>();
  late TextEditingController nameController,maleTController,
  femaleTController,
  maleIController,
  femaleIController;
  RxString relationToHr = ''.obs;
  RxString motherTongue = ''.obs;
  RxString religion = ''.obs;
  RxString selectedOccupation = ''.obs;
  late ValueNotifier<String?> selectedMode;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    maleIController = TextEditingController();
    femaleIController = TextEditingController();
    maleTController = TextEditingController();
    femaleTController = TextEditingController();
    selectedMode = ValueNotifier<String?>('current');
  }

  @override
  void onClose() {
    super.onClose();
    formField.currentState?.reset();
  }

  void submit() async {
    if (formField.currentState!.validate()) {
      isLoading.value = true;
      bool c;
      try {
        c = false;
        var name = nameController.text;
        var sTotalMale = maleTController.text;
        var totalMale = int.parse(sTotalMale);
        var sTotalFemale = femaleTController.text;
        var totalFemale = int.parse(sTotalFemale);
        var sCountMale = maleIController.text;
        var countMale = int.parse(sCountMale);
        var sCountFemale = femaleIController.text;
        var countFemale = int.parse(sCountFemale);
        var recordId = Get.arguments;
        var rid = await recordRepository.insertRecordPart2(recordId,
            totalMale, totalFemale, countMale, countFemale,
            selectedMode.value??'',
            selectedOccupation.value,
            name,
            relationToHr.value,
            '',
            motherTongue.value,
            religion.value);
        final homeController = Get.find<HomeController>();
        homeController.refreshCounts();
        if (selectedMode.value == 'current') {
          Get.off(GroupaFirst(), arguments: rid);
        } else {
          Get.off(GroupbFirst(), arguments: rid);
        }
        c = rid >= 1 ? true : false;
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
