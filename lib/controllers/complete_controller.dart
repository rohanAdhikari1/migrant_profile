import 'package:survey/models/data.dart';
import 'package:survey/repositories/local/record_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteController  extends GetxController {
  RecordRepository recordRepository = RecordRepository();
  final RxList<DataModel> records = <DataModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    try{
      fetchFarmersRecords();
    }catch(e){
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
    var fetchedRecords = await recordRepository.getCompletedRecords();
    records.assignAll(fetchedRecords);
  }
}