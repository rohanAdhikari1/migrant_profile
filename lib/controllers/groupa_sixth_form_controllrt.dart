import 'package:migrant_profile/pages/forms/location_form.dart';
import 'package:migrant_profile/repositories/local/record_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupaSixthFormController extends GetxController {
  final RecordRepository recordRepository = RecordRepository();
  final formField = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  RxString landFromRemittance = ''.obs;
  RxString landFromRemittanceLocation = ''.obs;
  RxString remittanceSavedSource = ''.obs;
  RxString migrationPlanLocation = ''.obs;
  RxString planAfterReturn = ''.obs;

  var  selectedRemittanceCollectMethod = <String>[].obs;
  var selectedRemittanceSpend = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadIfAvailable();
  }

  void loadIfAvailable() async {
    Map<String, dynamic> records = await recordRepository
        .retrieveRecordGroupAPart6(Get.arguments);
    initializeFromCommaSeparatedValues(selectedRemittanceSpend,
    records['remittance_spend_source'] ?? '',
    );
    landFromRemittance.value = records['is_land_purchased']?.toString() ?? '';
    landFromRemittanceLocation.value = records['land_purchased_location'] ?? '';
    remittanceSavedSource.value = records['remittance_saving_method'] ?? '';
    migrationPlanLocation.value = records['migration_plan_location'] ?? '';
    planAfterReturn.value = records['plan_after_return'] ?? '';
    initializeFromCommaSeparatedValues(selectedRemittanceCollectMethod,
    records['remittance_collect_method'] ?? '',
    );
  }

  @override
  void onClose() {
    super.onClose();
    formField.currentState?.reset();
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

  void submit() async {
    if (formField.currentState!.validate()) {
      isLoading.value = true;
      bool c;
      try {
        c = false;
        var recordId = Get.arguments;
        await recordRepository.updateRecordGroupAPart6(recordId,
            getCommaSeparatedValues(selectedRemittanceSpend),
            int.parse(landFromRemittance.value),
            landFromRemittanceLocation.value,
            remittanceSavedSource.value,
            migrationPlanLocation.value, 
            planAfterReturn.value,
            getCommaSeparatedValues(selectedRemittanceCollectMethod));
        Get.off(LocationForm(), arguments: recordId);
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
