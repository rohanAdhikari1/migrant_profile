import 'package:survey/controllers/first_step_form_controller.dart';
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10.0,
                children: [
                  Text("विवरण संकलन प्रकार छान्नुहोस् :",style: TextStyle(fontWeight: FontWeight.bold)),
                  ValueListenableBuilder<String?>(
                    valueListenable: controller.selectedMode,
                    builder: (context, selectedValue, _) {
                      return Column(
                        children: [
                          RadioListTile<String>(
                            title: Text("वैदेशिक रोजगारमा रहेका व्यक्तिहरुसंग सम्बन्धि विवरण"),
                            value: "current",
                            groupValue: selectedValue,
                            onChanged: (value) {
                              controller.selectedMode.value = value;
                            },
                          ),
                          RadioListTile<String>(
                            title: Text("वैदेशिक रोजगारबाट फर्केका व्यक्तिहरु सँग सम्बन्धी विवरण"),
                            value: "return",
                            groupValue: selectedValue,
                            onChanged: (value) {
                              controller.selectedMode.value = value;
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10.0,
                children: [
                  Text("${'occupation'.tr} :",style: TextStyle(fontWeight: FontWeight.bold)),
                  TextFormField(
                    controller: controller.occupationController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[50],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'occupation'.tr,
                      contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return  '${'occupation'.tr} ${'required'.tr}';
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
                      Text(
                        "तपाईको परिवारमा जम्मा कति जना हुनुहुन्छ ?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "*",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: controller.maleTController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.blue[50],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                12), // Rounded corners
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'पुरुष',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 12),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'required'.tr;
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  TextFormField(
                    controller: controller.femaleTController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[50],
                      border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(12), // Rounded corners
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'महिला',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 16, horizontal: 12),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'required'.tr;
                      }
                      return null;
                    },
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10.0,
                children: [
                  Row(
                    children: [
                      Text(
                        "तपाईको परिवारबाट कति जना वैदेशिक रोजगारमा गएका छन् ?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "*",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: controller.maleIController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.blue[50],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                12), // Rounded corners
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'पुरुष',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 12),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'required'.tr;
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: controller.femaleIController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[50],
                      border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(12), // Rounded corners
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'महिला',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 16, horizontal: 12),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'required'.tr;
                      }
                      return null;
                    },
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10.0,
                children: [
                  Row(
                    children: [
                      Text(
                        "ठेगाना",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "*",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  TextFormField(
                    controller: controller.addressController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[50],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "ठेगाना",
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
