import 'package:survey/Pages/home_page.dart';
import 'package:survey/controllers/home_controller.dart';
import 'package:survey/repositories/local/record_repository.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';

class LocationFormController extends GetxController{
  Location location = Location();
  bool _serviceEnabled=false;
  PermissionStatus? _permissionGranted;
  final locationData = Rx<LocationData?>(null);
  final formField = GlobalKey<FormState>();
  late TextEditingController longitudeController,latitudeController;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    longitudeController = TextEditingController();
    latitudeController = TextEditingController();
  }

  void requestLocationPermission() async{
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    locationData.value = await location.getLocation();
    longitudeController.text=locationData.value?.longitude?.toString()??'';
    latitudeController.text=locationData.value?.latitude?.toString()??'';
  }

  void submit() async {
    if(formField.currentState!.validate()) {
      var recordRepository = RecordRepository();
      var farmerRecordId = Get.arguments;
      await recordRepository.updateLocation(farmerRecordId,longitudeController.text,latitudeController.text);
        Get.snackbar(
          'Saved',
          'Data is successfully saved! You can sync now',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: Duration(seconds: 3),
        );
      final homeController = Get.find<HomeController>();
      await homeController.refreshCounts();
      Get.offAll(HomePage());
    }
  }
}