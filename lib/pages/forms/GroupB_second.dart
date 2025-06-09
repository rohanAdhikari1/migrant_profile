import 'package:migrant_profile/controllers/groupb_second_form_controllrt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupbSecond extends StatefulWidget {
  const GroupbSecond({super.key});

  @override
  State<GroupbSecond> createState() => _GroupbSecondState();
}

class _GroupbSecondState extends State<GroupbSecond> {

  @override
  Widget build(BuildContext context) {
    final GroupbSecondFormController controller = Get.put(
        GroupbSecondFormController());
    return Scaffold(
      appBar: AppBar(
        title: Text('वैदेशिक रोजगारबाट फर्केका व्यक्तिहरु सँग सम्बन्धी विवरण',
            style: TextStyle(color: Colors.white, fontSize: 14)),
        backgroundColor: Colors.blue[800],
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Form(
                key: controller.formField,
                child: Column(
                  spacing: 20,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10.0,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "फेरी विदेश जाने सोचमा हुनुहुन्छ ?",
                                  style: TextStyle(fontWeight: FontWeight.bold),
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
                                isExpanded: true,
                                value: controller.wantGoAgainForeign.value
                                    .isNotEmpty ? controller.wantGoAgainForeign
                                    .value : null,
                                hint: Text("फेरी विदेश जाने सोचमा हुनुहुन्छ ?"),
                                items: [
                                  DropdownMenuItem(
                                    value: '1',
                                    child: Text('छ '),
                                  ),
                                  DropdownMenuItem(
                                    value: '0',
                                    child: Text('छैन'),
                                  ),
                                ],
                                onChanged: (value) {
                                  controller.wantGoAgainForeign.value = value!;
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
                                Expanded(
                                  child: Text(
                                    "यतपाँइ बैदेशिक रोजगारमा रहँदा कुने अपाङ्गता वा अशक्ता भई अहिलेसम्म पनि सोही अवस्थामा हुनुहुन्छ ?",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Obx(() {
                              return DropdownButtonFormField<String>(
                                isExpanded: true,
                                hint: Text(
                                    "... अवस्थामा हुनुहुन्छ ?"),
                                value: controller.isDisabled.value.isNotEmpty
                                    ? controller.isDisabled.value
                                    : null,
                                items: [
                                  DropdownMenuItem(
                                    value: 'छैन',
                                    child: Text('छैन'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'शारिरिक अपाङ्गता/अशक्त',
                                    child: Text('शारिरिक अपाङ्गता/अशक्त'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'मानसिक समस्या (तनाव, डिप्रेशन ..)',
                                    child: Text(
                                        'मानसिक समस्या (तनाव, डिप्रेशन ..)'),
                                  ),

                                ],
                                onChanged: (value) {
                                  controller.isDisabled.value = value!;
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
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return 'required'.tr;
                                //   }
                                //   return null;
                                // },
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
                                  "विदेशमा कस्तो प्रकारको काम गर्नु भयो ?",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Obx(() {
                              return DropdownButtonFormField<String>(
                                isExpanded: true,
                                hint: Text(
                                    "... काम गर्नु भयो?"),
                                value: controller.workOnForeign.value.isNotEmpty
                                    ? controller.workOnForeign.value
                                    : null,
                                items: [
                                  DropdownMenuItem(
                                    value: 'लेवर (सिप नचाहिने)',
                                    child: Text('लेवर (सिप नचाहिने)'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'सिपयुक्त कामदार',
                                    child: Text('सिपयुक्त कामदार'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'फोरम्यान',
                                    child: Text('फोरम्यान'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'सुपरभाइजर',
                                    child: Text('सुपरभाइजर'),
                                  ),
                                ],
                                onChanged: (value) {
                                  controller.workOnForeign.value = value!;
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
                                Expanded(
                                  child: Text(
                                    "वैदेशिक रोजगारमा काम गर्ने क्रममा के सम्बन्धी कामको अनुभव प्राप्त भयो?",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Obx(() {
                              return DropdownButtonFormField<String>(
                                isExpanded: true,
                                hint: Text(
                                    "... अनुभव प्राप्त भयो?"),
                                value: controller.workExperience.value
                                    .isNotEmpty
                                    ? controller.workExperience.value
                                    : null,
                                items: [
                                  DropdownMenuItem(
                                    value: 'निर्माण सम्बन्धी (कारपेन्टर, डकर्मी, पेन्टर, स्टिल फिक्सर..)',
                                    child: Text(
                                        'निर्माण सम्बन्धी (कारपेन्टर, डकर्मी, पेन्टर, स्टिल फिक्सर..)'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'ईलेक्ट्रिक तथा मेकानिकल सम्बन्धी (इलेक्ट्रिसियन, प्लम्बिङ, अटोमोबाइल, वेल्डर ..)',
                                    child: Text(
                                        'ईलेक्ट्रिक तथा मेकानिकल सम्बन्धी (इलेक्ट्रिसियन, प्लम्बिङ, अटोमोबाइल, वेल्डर ..)'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'सामानहरु उत्पादन सम्बन्धी',
                                    child: Text('सामानहरु उत्पादन सम्बन्धी'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'कृषि सम्बन्धी',
                                    child: Text('कृषि सम्बन्धी'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'ड्राईभर तथा मेसिन चलाउने',
                                    child: Text('ड्राईभर तथा मेसिन चलाउने'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'सेवा तथा व्यापार सम्बन्धी (होटल कुक वेटर व्युटी पार्लर गारमेन्ट ….)',
                                    child: Text(
                                        'सेवा तथा व्यापार सम्बन्धी (होटल कुक वेटर व्युटी पार्लर गारमेन्ट ….)'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'सुपरभाईजर, फोरम्यान',
                                    child: Text('सुपरभाईजर, फोरम्यान'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'दक्ष व्यवसाय, व्यवस्थापक',
                                    child: Text('दक्ष व्यवसाय, व्यवस्थापक'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'सुरक्षा /सेक्युरिटि गार्ड',
                                    child: Text('सुरक्षा /सेक्युरिटि गार्ड'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'अन्य (लेवर, सरसरफाइ, प्याकेजिङ, लोडिङ, डेलिभरी …)',
                                    child: Text(
                                        'अन्य (लेवर, सरसरफाइ, प्याकेजिङ, लोडिङ, डेलिभरी …)'),
                                  ),
                                ],
                                onChanged: (value) {
                                  controller.workExperience.value = value!;
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
                                Expanded(
                                  child: Text(
                                    "नेपालमा फर्किएपछि कुनै सिप तालिम लिनु भएको छ ? छ भने कस्तो ?",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Obx(() {
                              return DropdownButtonFormField<String>(
                                isExpanded: true,
                                hint: Text(
                                    "कस्तो ?"),
                                value: controller.skillTrainingAfterReturn.value
                                    .isNotEmpty
                                    ? controller.skillTrainingAfterReturn.value
                                    : null,
                                items: [
                                  DropdownMenuItem(
                                    value: 'लिएको छैन',
                                    child: Text('लिएको छैन'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'प्राविधिक सिप तालिम (३ महिना सम्मको)',
                                    child: Text(
                                        'प्राविधिक सिप तालिम (३ महिना सम्मको)'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'व्यवसायिक सिप तालिम (३ महिना भन्दा माथिको)',
                                    child: Text(
                                        'व्यवसायिक सिप तालिम (३ महिना भन्दा माथिको)'),
                                  ),

                                ],
                                onChanged: (value) {
                                  controller.skillTrainingAfterReturn.value =
                                  value!;
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
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return 'required'.tr;
                                //   }
                                //   return null;
                                // },
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
                                  "आजभोली के गर्दै हुनुहुन्छ?",
                                  style: TextStyle(fontWeight: FontWeight.bold),
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
                                isExpanded: true,
                                hint: Text("आजभोली के गर्दै हुनुहुन्छ?"),
                                value: controller.currentWorking.value
                                    .isNotEmpty
                                    ? controller.currentWorking.value
                                    : null,
                                items: [
                                  DropdownMenuItem(
                                    value: 'फुर्सदमा छ कुनै काम छैन',
                                    child: Text('फुर्सदमा छ कुनै काम छैन'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'आफ्नै व्यवसायमा लागेको छ',
                                    child: Text('आफ्नै व्यवसायमा लागेको छ'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'जागिरमा लागेको छ',
                                    child: Text('जागिरमा लागेको छ'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'अन्य काममा लागेको छ',
                                    child: Text('अन्य काममा लागेको छ'),
                                  ),
                                ],
                                onChanged: (value) {
                                  controller.currentWorking.value = value!;
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
                        //dependent
                        Obx(() {
                          return controller.currentWorking=='आफ्नै व्यवसायमा लागेको छ'?
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "यदि आफ्नै व्यवसायमा लाग्नु भएको छ भने कस्तो व्यवसाय सञ्चालन गरि रहनु भएको छ ?",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
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
                                  isExpanded: true,
                                  hint: Text("... रहनु भएको छ ?"),
                                  value: controller.businessType.value
                                      .isNotEmpty
                                      ? controller.businessType.value
                                      : null,
                                  items: [
                                    DropdownMenuItem(
                                      value: 'कृषि व्यवसाय',
                                      child: Text('कृषि व्यवसाय'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'व्यापार व्यवसाय',
                                      child: Text('व्यापार व्यवसाय'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'व्यवसायिक कार्य गर्ने (इलेक्ट्रिसियन, प्लम्बर, मिस्त्री …)',
                                      child: Text(
                                          'व्यवसायिक कार्य गर्ने (इलेक्ट्रिसियन, प्लम्बर, मिस्त्री …)'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'अन्य',
                                      child: Text('अन्य'),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    controller.businessType.value = value!;
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
                          ):SizedBox();
                        }),

                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   spacing: 10.0,
                        //   children: [
                        //     Column(
                        //       children: [
                        //         Row(
                        //           children: [
                        //             Text(
                        //                 "जागिर गर्दै हुनुहुन्छ भने के जागिर पाउनु भएको छ ?",
                        //                 style: TextStyle(
                        //                     fontWeight: FontWeight.bold)),
                        //           ],
                        //         ),
                        //       ],
                        //     ),
                        //     TextFormField(
                        //       controller: controller.occupationController,
                        //       decoration: InputDecoration(
                        //         filled: true,
                        //         fillColor: Colors.blue[50],
                        //         border: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(12),
                        //           borderSide: BorderSide.none,
                        //         ),
                        //         hintText: 'जागिरको नाम',
                        //         contentPadding: EdgeInsets.symmetric(
                        //             vertical: 16, horizontal: 12),
                        //       ),
                        //       // validator: (value) {
                        //       //   if (value == null || value.isEmpty) {
                        //       //     return 'व्यक्तिको नाम ${'required'.tr}';
                        //       //   }
                        //       //   return null;
                        //       // },
                        //     )
                        //   ],
                        // ),
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   spacing: 10.0,
                        //   children: [
                        //     Column(
                        //       children: [
                        //         Row(
                        //           children: [
                        //             Text(
                        //                 "बिदेशमा काम गर्दा के सिप तालिम सिकेर गएको हो ?",
                        //                 style: TextStyle(
                        //                     fontWeight: FontWeight.bold)),
                        //           ],
                        //         ),
                        //       ],
                        //     ),
                        //     TextFormField(
                        //       controller: controller.skillNameController,
                        //       decoration: InputDecoration(
                        //         filled: true,
                        //         fillColor: Colors.blue[50],
                        //         border: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(12),
                        //           borderSide: BorderSide.none,
                        //         ),
                        //         hintText: 'तालिमको नाम',
                        //         contentPadding: EdgeInsets.symmetric(
                        //             vertical: 16, horizontal: 12),
                        //       ),
                        //       // validator: (value) {
                        //       //   if (value == null || value.isEmpty) {
                        //       //     return 'व्यक्तिको नाम ${'required'.tr}';
                        //       //   }
                        //       //   return null;
                        //       // },
                        //     )
                        //   ],
                        // ),
                        // Column(
                        //   children: [
                        //     Row(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         Expanded(
                        //           child: Text(
                        //             "सिप सिकेर जानु भएको थियो वा विदेशमा रहदा केहि सीप सिक्नु भएको छ ?",
                        //             style: TextStyle(
                        //               fontSize: 14,
                        //               fontWeight: FontWeight.bold,
                        //             ),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //     Obx(() {
                        //       return Column(
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         children: [
                        //           Row(
                        //             children: [
                        //               Expanded(
                        //                 child: Row(
                        //                   children: [
                        //                     Checkbox(
                        //                       value: controller
                        //                           .selectedSkillBeforeMigration
                        //                           .contains('प्लम्वर'),
                        //                       onChanged: (_) {
                        //                         controller.toggleSelection(
                        //                             'प्लम्वर');
                        //                       },
                        //                     ),
                        //                     Text('प्लम्वर'),
                        //                   ],
                        //                 ),
                        //               ),
                        //               Expanded(
                        //                 child: Row(
                        //                   children: [
                        //                     Checkbox(
                        //                       value: controller
                        //                           .selectedSkillBeforeMigration
                        //                           .contains('स्काफफोल्डङ'),
                        //                       onChanged: (_) {
                        //                         controller.toggleSelection(
                        //                             'स्काफफोल्डङ');
                        //                       },
                        //                     ),
                        //                     Text('स्काफफोल्डङ'),
                        //                   ],
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //           Row(
                        //             children: [
                        //               Expanded(
                        //                 child: Row(
                        //                   children: [
                        //                     Checkbox(
                        //                       value: controller
                        //                           .selectedSkillBeforeMigration
                        //                           .contains('कार्पेन्टर'),
                        //                       onChanged: (_) {
                        //                         controller.toggleSelection(
                        //                             'कार्पेन्टर');
                        //                       },
                        //                     ),
                        //                     Text('कार्पेन्टर'),
                        //                   ],
                        //                 ),
                        //               ),
                        //               Expanded(
                        //                 child: Row(
                        //                   children: [
                        //                     Checkbox(
                        //                       value: controller
                        //                           .selectedSkillBeforeMigration
                        //                           .contains('मेसन'),
                        //                       onChanged: (_) {
                        //                         controller.toggleSelection(
                        //                             'मेसन');
                        //                       },
                        //                     ),
                        //                     Text('मेसन'),
                        //                   ],
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //           Row(
                        //             children: [
                        //               Expanded(
                        //                 child: Row(
                        //                   children: [
                        //                     Checkbox(
                        //                       value: controller
                        //                           .selectedSkillBeforeMigration
                        //                           .contains('ईलेक्टिसीयन'),
                        //                       onChanged: (_) {
                        //                         controller.toggleSelection(
                        //                             'ईलेक्टिसीयन');
                        //                       },
                        //                     ),
                        //                     Text('ईलेक्टिसीयन'),
                        //                   ],
                        //                 ),
                        //               ),
                        //               Expanded(
                        //                 child: Row(
                        //                   children: [
                        //                     Checkbox(
                        //                       value: controller
                        //                           .selectedSkillBeforeMigration
                        //                           .contains('क्लिनर'),
                        //                       onChanged: (_) {
                        //                         controller.toggleSelection(
                        //                             'क्लिनर');
                        //                       },
                        //                     ),
                        //                     Text('क्लिनर'),
                        //                   ],
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //           Row(
                        //             children: [
                        //               Expanded(
                        //                 child: Row(
                        //                   children: [
                        //                     Checkbox(
                        //                       value: controller
                        //                           .selectedSkillBeforeMigration
                        //                           .contains('स्टील फिक्चर'),
                        //                       onChanged: (_) {
                        //                         controller.toggleSelection(
                        //                             'स्टील फिक्चर');
                        //                       },
                        //                     ),
                        //                     Text('स्टील फिक्चर'),
                        //                   ],
                        //                 ),
                        //               ),
                        //               Expanded(
                        //                 child: Row(
                        //                   children: [
                        //                     Checkbox(
                        //                       value: controller
                        //                           .selectedSkillBeforeMigration
                        //                           .contains('कुक'),
                        //                       onChanged: (_) {
                        //                         controller.toggleSelection(
                        //                             'कुक');
                        //                       },
                        //                     ),
                        //                     Text('कुक'),
                        //                   ],
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //           Row(
                        //             children: [
                        //               Expanded(
                        //                 child: Row(
                        //                   children: [
                        //                     Checkbox(
                        //                       value: controller
                        //                           .selectedSkillBeforeMigration
                        //                           .contains('कृषि'),
                        //                       onChanged: (_) {
                        //                         controller.toggleSelection(
                        //                             'कृषि');
                        //                       },
                        //                     ),
                        //                     Text('कृषि'),
                        //                   ],
                        //                 ),
                        //               ),
                        //               Expanded(
                        //                 child: Row(
                        //                   children: [
                        //                     Checkbox(
                        //                       value: controller
                        //                           .selectedSkillBeforeMigration
                        //                           .contains('वेटर'),
                        //                       onChanged: (_) {
                        //                         controller.toggleSelection(
                        //                             'वेटर');
                        //                       },
                        //                     ),
                        //                     Text('वेटर'),
                        //                   ],
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //           Row(
                        //             children: [
                        //               Expanded(
                        //                 child: Row(
                        //                   children: [
                        //                     Checkbox(
                        //                       value: controller
                        //                           .selectedSkillBeforeMigration
                        //                           .contains('सेक्यरीटी गार्ड'),
                        //                       onChanged: (_) {
                        //                         controller.toggleSelection(
                        //                             'सेक्यरीटी गार्ड');
                        //                       },
                        //                     ),
                        //                     Text('सेक्यरीटी गार्ड'),
                        //                   ],
                        //                 ),
                        //               ),
                        //               Expanded(
                        //                 child: Row(
                        //                   children: [
                        //                     Checkbox(
                        //                       value: controller
                        //                           .selectedSkillBeforeMigration
                        //                           .contains('वेल्डर'),
                        //                       onChanged: (_) {
                        //                         controller.toggleSelection(
                        //                             'वेल्डर');
                        //                       },
                        //                     ),
                        //                     Text('वेल्डर'),
                        //                   ],
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //           Row(
                        //             children: [
                        //               Expanded(
                        //                 child: Row(
                        //                   children: [
                        //                     Checkbox(
                        //                       value: controller
                        //                           .selectedSkillBeforeMigration
                        //                           .contains('अन्य'),
                        //                       onChanged: (_) {
                        //                         controller.toggleSelection(
                        //                             'अन्य');
                        //                       },
                        //                     ),
                        //                     Text('अन्य'),
                        //                   ],
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ],
                        //       );
                        //     }),
                        //   ],
                        // ),
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     Row(
                        //       children: [
                        //         Text(
                        //           "सिप परिक्षण सम्बन्धी तपाईलाई केहि जानकारी छ ?",
                        //           style: TextStyle(fontWeight: FontWeight.bold),
                        //         ),
                        //         Text(
                        //           "*",
                        //           style: TextStyle(color: Colors.red),
                        //         ),
                        //       ],
                        //     ),
                        //     SizedBox(height: 4),
                        //     Obx(() {
                        //       return DropdownButtonFormField<String>(
                        //         value: controller.knowAboutSkillTest.value
                        //             .isNotEmpty ? controller.knowAboutSkillTest
                        //             .value : null,
                        //         isExpanded: true,
                        //         hint: Text(
                        //             "सिप परिक्षण ... जानकारी छ?"),
                        //         items: [
                        //           DropdownMenuItem(
                        //             value: '1',
                        //             child: Text('छ '),
                        //           ),
                        //           DropdownMenuItem(
                        //             value: '0',
                        //             child: Text('छैन'),
                        //           ),
                        //         ],
                        //         onChanged: (value) {
                        //           controller.knowAboutSkillTest.value = value!;
                        //         },
                        //         decoration: InputDecoration(
                        //           filled: true,
                        //           fillColor: Colors.blue[50],
                        //           border: OutlineInputBorder(
                        //             borderRadius: BorderRadius.circular(12),
                        //             borderSide: BorderSide.none,
                        //           ),
                        //           contentPadding: EdgeInsets.symmetric(
                        //               vertical: 12, horizontal: 8),
                        //         ),
                        //         validator: (value) {
                        //           if (value == null || value.isEmpty) {
                        //             return 'required'.tr;
                        //           }
                        //           return null;
                        //         },
                        //       );
                        //     }),
                        //   ],
                        // ),
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     Row(
                        //       children: [
                        //         Text(
                        //           "थाहा छ भने सीप परिक्षण गर्नु भएको छ ?",
                        //           style: TextStyle(fontWeight: FontWeight.bold),
                        //         ),
                        //       ],
                        //     ),
                        //     SizedBox(height: 4),
                        //     Obx(() {
                        //       return DropdownButtonFormField<String>(
                        //         isExpanded: true,
                        //         value: controller.doneSkillTest.value.isNotEmpty
                        //             ? controller.doneSkillTest.value
                        //             : null,
                        //         hint: Text(
                        //             "थाहा छ भने सीप परिक्षण गर्नु भएको छ ?"),
                        //         items: [
                        //           DropdownMenuItem(
                        //             value: '1',
                        //             child: Text('छ '),
                        //           ),
                        //           DropdownMenuItem(
                        //             value: '0',
                        //             child: Text('छैन'),
                        //           ),
                        //         ],
                        //         onChanged: (value) {
                        //           controller.doneSkillTest.value = value!;
                        //         },
                        //         decoration: InputDecoration(
                        //           filled: true,
                        //           fillColor: Colors.blue[50],
                        //           border: OutlineInputBorder(
                        //             borderRadius: BorderRadius.circular(12),
                        //             borderSide: BorderSide.none,
                        //           ),
                        //           contentPadding: EdgeInsets.symmetric(
                        //               vertical: 12, horizontal: 8),
                        //         ),
                        //         // validator: (value) {
                        //         //   if (value == null || value.isEmpty) {
                        //         //     return 'required'.tr;
                        //         //   }
                        //         //   return null;
                        //         // },
                        //       );
                        //     }),
                        //   ],
                        // ),
                        //
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     Row(
                        //       children: [
                        //         Text(
                        //           "यदि छैन भने सीप परिक्षण गर्ने सोंचमा हुनुहुन्छ ?",
                        //           style: TextStyle(fontWeight: FontWeight.bold),
                        //         ),
                        //       ],
                        //     ),
                        //     SizedBox(height: 4),
                        //     Obx(() {
                        //       return DropdownButtonFormField<String>(
                        //         isExpanded: true,
                        //         hint: Text(
                        //             "यदि छैन भने ... हुनुहुन्छ?"),
                        //         value: controller.wantSkillTest.value.isNotEmpty
                        //             ? controller.wantSkillTest.value
                        //             : null,
                        //         items: [
                        //           DropdownMenuItem(
                        //             value: '1',
                        //             child: Text('छ '),
                        //           ),
                        //           DropdownMenuItem(
                        //             value: '0',
                        //             child: Text('छैन'),
                        //           ),
                        //         ],
                        //         onChanged: (value) {
                        //           controller.wantSkillTest.value = value!;
                        //         },
                        //         decoration: InputDecoration(
                        //           filled: true,
                        //           fillColor: Colors.blue[50],
                        //           border: OutlineInputBorder(
                        //             borderRadius: BorderRadius.circular(12),
                        //             borderSide: BorderSide.none,
                        //           ),
                        //           contentPadding: EdgeInsets.symmetric(
                        //               vertical: 12, horizontal: 8),
                        //         ),
                        //         // validator: (value) {
                        //         //   if (value == null || value.isEmpty) {
                        //         //     return 'required'.tr;
                        //         //   }
                        //         //   return null;
                        //         // },
                        //       );
                        //     }),
                        //   ],
                        // ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: controller.submit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[800],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                        elevation: 4,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'अघि बढ्नुहोस',
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
            ),
          ),
        ),
      ),
    );
  }
}
