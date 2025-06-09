import 'package:migrant_profile/models/data.dart';
import 'package:migrant_profile/repositories/local/record_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DraftController extends GetxController {
  final RecordRepository recordRepository = RecordRepository();
  final RxList<DataModel> records = <DataModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    try {
      fetchFarmersRecords();
    } catch (e) {
      Get.snackbar(
        "Error",
        "An error occurred: ${e.toString()}",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> fetchFarmersRecords() async {
    var fetchedRecords = await recordRepository.getDraftRecords();
    records.assignAll(fetchedRecords);
  }
}
