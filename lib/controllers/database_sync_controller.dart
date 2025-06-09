import 'package:migrant_profile/controllers/home_controller.dart';
import 'package:migrant_profile/models/data.dart';
import 'package:migrant_profile/repositories/api_repository.dart';
import 'package:migrant_profile/repositories/local/record_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatabaseSyncController extends GetxController {
  final RecordRepository recordRepository = RecordRepository();
  final ApiRepository apiRepository = ApiRepository();
  final RxList<DataModel> listItems = <DataModel>[].obs;
  RxSet<int> selectedItems = RxSet<int>();
  RxSet<int> syncItems = RxSet<int>();
  RxBool isLoading = false.obs;
  bool get isAllSelected => listItems.length == selectedItems.length;

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
    var records = await recordRepository.getCompletedRecords();
    listItems.assignAll(records);
  }

  void toggleSelectAll() {
    if (isAllSelected) {
      selectedItems.clear();
    } else {
      selectedItems.addAll(listItems.map((item) => item.id));
    }
    update();
  }

  void toggleSelection(int id) {
    if (selectedItems.contains(id)) {
      selectedItems.remove(id);
    } else {
      selectedItems.add(id);
    }
    update();
  }

  void syncData() async {
    isLoading.value = true;
    if (selectedItems.isNotEmpty) {
      for (var itemId in selectedItems) {
        var record = await recordRepository.retrieveRecord(itemId);
        var houseRepresentative = await recordRepository
            .retrieveHouseRepresentative(record['house_representative_id']);
        var recordJson = {
          'house_representative_name': houseRepresentative['name'],
          'house_representative_gender': houseRepresentative['gender'],
          'house_representative_contact_no': houseRepresentative['contact_no'],
          'house_representative_occupation': houseRepresentative['occupation'],
          'house_representative_address': houseRepresentative['address'],
          'family_memeber_count':
              houseRepresentative['family_members_male_count'] ??
              0 + houseRepresentative['family_members_female_count'] ??
              0 + houseRepresentative['family_members_other_count'] ??
              0,
          'family_members_male_count':
              houseRepresentative['family_members_male_count'],
          'family_members_female_count':
              houseRepresentative['family_members_female_count'],
          'family_members_other_count':
              houseRepresentative['family_members_other_count'],
          'family_migration_count':
              houseRepresentative['family_migration_count'],
          'family_members_migration_male_count':
              houseRepresentative['family_members_migration_male_count'],
          'family_members_migration_female_count':
              houseRepresentative['family_members_migration_female_count'],
          'family_members_migration_other_count':
              houseRepresentative['family_members_migration_other_count'],
          'ward_no': houseRepresentative['ward_no'],
          'address_1': houseRepresentative['address_1'],
          'address_2': houseRepresentative['address_2'],
          'house_no': houseRepresentative['house_no '],
          ...record,
        };
        print(recordJson);
        var c = await apiRepository.updateRecord(recordJson);
        if (c) {
          recordRepository.deleteRecord(itemId);
          syncItems.add(itemId);
        }
      }
      if (syncItems.length == selectedItems.length) {
        Get.snackbar(
          "Success!",
          "Data Synced Completely!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green[400],
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          "Warning!",
          "Something Went Wrong! All Data are the Synced",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.yellow[400],
          colorText: Colors.white,
        );
      }
      final homeController = Get.find<HomeController>();
      await homeController.refreshCounts();
      fetchFarmersRecords();
    }
    isLoading.value = false;
  }
}
