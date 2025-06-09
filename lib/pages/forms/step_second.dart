import 'package:migrant_profile/controllers/first_step_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:migrant_profile/controllers/second_step_form_controller.dart';

class StepSecond extends StatelessWidget {
  const StepSecond({super.key});

  @override
  Widget build(BuildContext context) {
    final SecondStepFormController controller = Get.put(SecondStepFormController());

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
                  Text("सूचनादाताको बिवरण",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
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
                    children: [
                      Row(
                        children: [
                          Text(
                            "घरमुलीसँगको नाता",
                            style:
                            TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "*",
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Obx(() {
                        return DropdownButtonFormField<String>(
                          hint: Text("घरमुलीसँगको नाता"),
                          value: controller.relationToHr.value
                              .isNotEmpty ? controller.relationToHr
                              .value : null,
                          items: [
                            DropdownMenuItem(
                              value: 'आफै',
                              child: Text('आफै'),
                            ),
                            DropdownMenuItem(
                              value: 'परिवारको सदस्य',
                              child: Text('परिवारको सदस्य'),
                            ),
                            DropdownMenuItem(
                              value: 'आफन्त',
                              child: Text('आफन्त'),
                            ),
                            DropdownMenuItem(
                              value: 'छिमेकी',
                              child: Text('छिमेकी'),
                            ),
                          ],
                          onChanged: (value) {
                            controller.relationToHr.value = value!;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blue[50],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 8),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'required'.tr;
                            }
                            return null;
                          },
                        );
                      }),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "मातृभाषा",
                            style:
                            TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "*",
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Obx(() {
                        return DropdownButtonFormField<String>(
                          hint: Text("मातृभाषा"),
                          value: controller.motherTongue.value
                              .isNotEmpty ? controller.motherTongue
                              .value : null,
                          items: [
                            DropdownMenuItem(
                              value: 'नेपाली',
                              child: Text('नेपाली'),
                            ),
                            DropdownMenuItem(
                              value: 'तामाङ',
                              child: Text('तामाङ'),
                            ),
                            DropdownMenuItem(
                              value: 'मगर',
                              child: Text('मगर'),
                            ),
                            DropdownMenuItem(
                              value: 'थामी',
                              child: Text('थामी'),
                            ),
                            DropdownMenuItem(
                              value: 'नेवारी',
                              child: Text('नेवारी'),
                            ),
                            DropdownMenuItem(
                              value: 'सुनुवार',
                              child: Text('सुनुवार'),
                            ),
                            DropdownMenuItem(
                              value: 'शेर्पा',
                              child: Text('शेर्पा'),
                            ),
                            DropdownMenuItem(
                              value: 'माझी',
                              child: Text('माझी'),
                            ),
                            DropdownMenuItem(
                              value: 'गुरुङ',
                              child: Text('गुरुङ'),
                            ),
                            DropdownMenuItem(
                              value: 'राई',
                              child: Text('राई'),
                            ),
                            DropdownMenuItem(
                              value: 'लिम्बु',
                              child: Text('लिम्बु'),
                            ),
                            DropdownMenuItem(
                              value: 'मैथिली',
                              child: Text('मैथिली'),
                            ),
                            DropdownMenuItem(
                              value: 'हिन्दी',
                              child: Text('हिन्दी'),
                            ),
                            DropdownMenuItem(
                              value: 'भोजपरी (भोजपुरी)',
                              child: Text('भोजपरी (भोजपुरी)'),
                            ),
                            DropdownMenuItem(
                              value: 'अवधी (मुश्लिम)',
                              child: Text('अवधी (मुश्लिम)'),
                            ),
                            DropdownMenuItem(
                              value: 'बजिका',
                              child: Text('बजिका'),
                            ),
                            DropdownMenuItem(
                              value: 'अन्य',
                              child: Text('अन्य'),
                            ),
                          ],
                          onChanged: (value) {
                            controller.motherTongue.value = value!;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blue[50],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 8),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'required'.tr;
                            }
                            return null;
                          },
                        );
                      }),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "धर्म",
                            style:
                            TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "*",
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Obx(() {
                        return DropdownButtonFormField<String>(
                          hint: Text("मातृभाषा"),
                          value: controller.religion.value
                              .isNotEmpty ? controller.religion
                              .value : null,
                          items: [
                            DropdownMenuItem(
                              value: 'हिन्दू',
                              child: Text('हिन्दू'),
                            ),
                            DropdownMenuItem(
                              value: 'बौद्ध',
                              child: Text('बौद्ध'),
                            ),
                            DropdownMenuItem(
                              value: 'इस्लाम',
                              child: Text('इस्लाम'),
                            ),
                            DropdownMenuItem(
                              value: 'क्रिश्चियन',
                              child: Text('क्रिश्चियन'),
                            ),
                            DropdownMenuItem(
                              value: 'किराँत',
                              child: Text('किराँत'),
                            ),
                            DropdownMenuItem(
                              value: 'अन्य',
                              child: Text('अन्य'),
                            ),
                          ],
                          onChanged: (value) {
                            controller.religion.value = value!;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blue[50],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 8),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'required'.tr;
                            }
                            return null;
                          },
                        );
                      }),
                    ],
                  ),



                  SizedBox(height: 4),
                  Text("पारिवारिक बिवरण",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
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
                      Text("हालतपाँइको घरको मुख्य पेशा के हो ?W",style: TextStyle(fontWeight: FontWeight.bold)),
                      Obx(() {
                        return DropdownButtonFormField<String>(
                          hint: Text("ुख्य पेशा के हो ?"),
                          value: controller.selectedOccupation.value
                              .isNotEmpty ? controller.selectedOccupation
                              .value : null,
                          items: [
                            DropdownMenuItem(
                              value: 'कृषि',
                              child: Text('कृषि'),
                            ),
                            DropdownMenuItem(
                              value: 'जागिर',
                              child: Text('जागिर'),
                            ),
                            DropdownMenuItem(
                              value: 'उद्योग तथा व्यापार',
                              child: Text('उद्योग तथा व्यापार'),
                            ),
                            DropdownMenuItem(
                              value: 'ज्याला मजदुरी',
                              child: Text('ज्याला मजदुरी'),
                            ),
                            DropdownMenuItem(
                              value: 'वैदेशशिक रोजगारी',
                              child: Text('वैदेशशिक रोजगारी'),
                            ),
                            DropdownMenuItem(
                              value: 'व्यवसायिक कार्य (इलेक्ट्रिसियन, प्लम्बर, मिस्त्री …)',
                              child: Text('व्यवसायिक कार्य (इलेक्ट्रिसियन, प्लम्बर, मिस्त्री …)'),
                            ),
                            DropdownMenuItem(
                              value: 'अन्य',
                              child: Text('अन्य'),
                            ),
                          ],
                          onChanged: (value) {
                            controller.selectedOccupation.value = value!;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blue[50],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 8),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'required'.tr;
                            }
                            return null;
                          },
                        );
                      }),
                    ],
                  ),

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
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   spacing: 10.0,
                  //   children: [
                  //     Row(
                  //       children: [
                  //         Text(
                  //           "ठेगाना",
                  //           style: TextStyle(fontWeight: FontWeight.bold),
                  //         ),
                  //         Text(
                  //           "*",
                  //           style: TextStyle(
                  //             color: Colors.red,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //     TextFormField(
                  //       controller: controller.addressController,
                  //       keyboardType: TextInputType.text,
                  //       decoration: InputDecoration(
                  //         filled: true,
                  //         fillColor: Colors.blue[50],
                  //         border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(12),
                  //           borderSide: BorderSide.none,
                  //         ),
                  //         hintText: "ठेगाना",
                  //         contentPadding: EdgeInsets.symmetric(
                  //             vertical: 16, horizontal: 12),
                  //       ),
                  //       validator: (value) {
                  //         if (value == null || value.isEmpty) {
                  //           return 'required'.tr;
                  //         }
                  //         return null;
                  //       },
                  //     )
                  //   ],
                  // ),
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
