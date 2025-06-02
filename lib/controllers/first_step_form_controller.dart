import 'package:survey/controllers/home_controller.dart';
import 'package:survey/pages/forms/GroupA_first.dart';
import 'package:survey/pages/forms/GroupB_first.dart';
import 'package:survey/repositories/local/record_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstStepFormController  extends GetxController {
  final RecordRepository recordRepository = RecordRepository();
  final formField = GlobalKey<FormState>();
  late TextEditingController nameController,wardController,phoneController,occupationController,maleTController,femaleTController
  ,maleIController,femaleIController,addressController,address2Controller;
  late ValueNotifier<String?> selectedGender,selectedMode;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    wardController = TextEditingController();
    phoneController = TextEditingController();
    occupationController = TextEditingController();
    maleIController = TextEditingController();
    femaleIController = TextEditingController();
    maleTController = TextEditingController();
    femaleTController = TextEditingController();
    addressController = TextEditingController();
    address2Controller = TextEditingController();
    selectedGender = ValueNotifier<String?>('male');
    selectedMode = ValueNotifier<String?>('current');
  }

  @override
  void onClose(){
    super.onClose();
    formField.currentState?.reset();
  }

  void submit() async{
    if(formField.currentState!.validate()) {
      isLoading.value = true;
      bool c;
      try {
        c=false;
        var name = nameController.text;
        var ward = wardController.text;
        var gender = selectedGender.value.toString();
        var phone = phoneController.text;
        var occupation = occupationController.text;
        var sTotalMale = maleTController.text;
        var totalMale = int.parse(sTotalMale);
        var sTotalFemale = femaleTController.text;
        var totalFemale = int.parse(sTotalFemale);
        var sCountMale = maleIController.text;
        var countMale = int.parse(sCountMale);
        var sCountFemale = femaleIController.text;
        var countFemale = int.parse(sCountFemale);
        var address1 = addressController.text;
        var address2 = address2Controller.text;
        var rid = await recordRepository.insertRecordPart1(name,address1,selectedMode.value.toString(),address2,ward,gender,phone,occupation,totalMale,totalFemale,countMale,countFemale);
          final homeController = Get.find<HomeController>();
          homeController.refreshCounts();
          if(selectedMode.value == 'current'){
            Get.off(GroupaFirst(),arguments: rid);
          }else{
            Get.off(GroupbFirst(),arguments: rid);
          }
          c= rid>=1?true:false;
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