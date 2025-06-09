import 'package:migrant_profile/controllers/first_step_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class StepFirst extends StatelessWidget {
  const StepFirst({super.key});

  @override
  Widget build(BuildContext context) {
    final FirstStepFormController controller = Get.put(FirstStepFormController());

    return Scaffold(
        appBar: AppBar(
        title: Text('family_detail'.tr, style: TextStyle(color: Colors.white)),
    backgroundColor: Colors.blue[800],
    iconTheme: IconThemeData(color: Colors.white),
    centerTitle: true,
    ),
    body: SingleChildScrollView(
      child: SafeArea(child:Container(
        margin: EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
        child: Form(
          key: controller.formField,
          child: Column(
            spacing: 10.0,
            children: [
              Text("प्रशासनिक विवरण",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10.0,
                children: [
                  Row(
                    children: [
                      Text("${'ward_no'.tr} :",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(
                        "*",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  TextFormField(
                    controller: controller.wardController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[50],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'ward_no'.tr,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 16, horizontal: 12),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '${'ward_no'.tr} ${'required'.tr}';
                      }
                      return null;
                    },
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10.0,
                children: [
                  Row(
                    children: [
                      Text("टोल वस्तीको नाम",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(
                        "*",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  TextFormField(
                    controller: controller.address2Controller,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[50],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'टोल वस्तीको नाम',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 16, horizontal: 12),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'required'.tr;
                      }
                      return null;
                    },
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "टोलको कोड नं.",
                        style:
                        TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "*",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                  SizedBox(height: 3),
                  TextFormField(
                    // controller: controller.countryController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[50],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'टोलको कोड नं.',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 13, horizontal: 12),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'required'.tr;
                      }
                      return null;
                    },
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "घर नं.",
                        style:
                        TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "*",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                  SizedBox(height: 3),
                  TextFormField(
                    // controller: controller.countryController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[50],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'घर नं.',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 13, horizontal: 12),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'required'.tr;
                      }
                      return null;
                    },
                  )
                ],
              ),

              SizedBox(height: 4),
              Text("घरधुरी विवरण",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10.0,
                children: [
                  Text("${'family_name'.tr} :",style: TextStyle(fontWeight: FontWeight.bold)),
                  TextFormField(
                    controller: controller.nameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[50],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'family_name'.tr,
                      contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return  '${'family_name'.tr} ${'required'.tr}';
                      }
                      return null;
                    },
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5.0,
                children: [
                  Text("${'gender'.tr} :",style: TextStyle(fontWeight: FontWeight.bold)),
                  ValueListenableBuilder<String?>(
                    valueListenable: controller.selectedGender,
                    builder: (context, selectedValue, _) {
                      return Column(
                        children: [
                          RadioListTile<String>(
                            title: Text("पुरुष"),
                            value: "male",
                            groupValue: selectedValue,
                            onChanged: (value) {
                              controller.selectedGender.value = value;
                            },
                          ),
                          RadioListTile<String>(
                            title: Text("महिला"),
                            value: "female",
                            groupValue: selectedValue,
                            onChanged: (value) {
                              controller.selectedGender.value = value;
                            },
                          ),
                          RadioListTile<String>(
                            title: Text("अन्य"),
                            value: "other",
                            groupValue: selectedValue,
                            onChanged: (value) {
                              controller.selectedGender.value = value;
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10.0,
                children: [
                  Text("${'phone'.tr} :",style: TextStyle(fontWeight: FontWeight.bold)),
                  TextFormField(
                    controller: controller.phoneController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[50],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'phone'.tr,
                      contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return  '${'phone'.tr} ${'required'.tr}';
                      }
                      if (value.length != 10) {
                        return  '${'phone'.tr} ${'invalid'.tr}';
                      }
                      return null;
                    },
                  )
                ],
              ),
        ElevatedButton(
                onPressed: controller.isLoading.value?null:controller.submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                  elevation: 4,
                ),
                child: controller.isLoading.value
              ? SpinKitWave(
              color: Colors.blue[800],
                size: 26.0,
              )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'next_step'.tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 21,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    )
    );
  }
}
