import 'package:migrant_profile/controllers/groupa_second_form_controllrt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupaSecond extends StatefulWidget {
  const GroupaSecond({super.key});

  @override
  State<GroupaSecond> createState() => _GroupaSecondState();
}

class _GroupaSecondState extends State<GroupaSecond> {

  final List<String> _documentOptions = [
    'पासपोर्ट',
    'सम्झौता पत्र',
    'विमाको कागज',
    'मेडिकल कागज',
    'पैसा तिरेको भर्पाई',
    'श्रम स्विकृति',
    'युजर आइडी र पासवर्ड',
  ];


  @override
  Widget build(BuildContext context) {
    final GroupaSecondFormController controller = Get.put(
        GroupaSecondFormController());
    return Scaffold(
      appBar: AppBar(
        // title: Text('vaccine_detail'.tr, style: TextStyle(color: Colors.white)),
        title: Text('वैदेशिक रोजगारमा रहेका व्यक्तिहरुसंग सम्बन्धि विवरण',
            style: TextStyle(color: Colors.white, fontSize: 15)),
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
                  spacing: 30,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10.0,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 10.0,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text("कुन माध्यमबाट जानु भएको हो ?",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Text("*",
                                        style: TextStyle(
                                          color: Colors.red,
                                        ))
                                  ],
                                ),
                                Obx(() {
                                  return DropdownButtonFormField<String>(
                                    value: controller.travelMethod.value
                                        .isNotEmpty ? controller.travelMethod
                                        .value : null,
                                    hint: Text("कुन माध्यमबाट जानु भएको हो ?"),
                                    items: [
                                      DropdownMenuItem(
                                        value: 'मेनपावर कम्पनी',
                                        child: Text('मेनपावर कम्पनी'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'एजेन्ट',
                                        child: Text('एजेन्ट'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'सरकारी माध्यम (जि.टु.जी.)',
                                        child: Text('सरकारी माध्यम (जि.टु.जी.)'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'व्यक्तिगत',
                                        child: Text('व्यक्तिगत'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'आफन्त मार्फत',
                                        child: Text('आफन्त मार्फत'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'थाहा छैन',
                                        child: Text('थाहा छैन'),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      controller.travelMethod.value = value!;
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
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "कुन वाटो भएर गएको हो ?",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "*",
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Obx(() {
                                  return DropdownButtonFormField<String>(
                                    value: controller.travelRoute.value
                                        .isNotEmpty ? controller.travelRoute
                                        .value : null,
                                    hint: Text(
                                        "कुन वाटो भएर गएको हो ?"),
                                    items: [
                                      DropdownMenuItem(
                                        value: 'नेपालको विमानस्थल',
                                        child: Text('नेपालको विमानस्थल'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'भारतवाट',
                                        child: Text('भारतवाट'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'अन्यमुलुक हुदै',
                                        child: Text('अन्यमुलुक हुदै'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'थाहा छैन',
                                        child: Text('थाहा छैन'),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      controller.travelRoute.value = value!;
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
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "कुन भिषामा गएर काम गरिरहनु भएको छ ?",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "*",
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Obx(() {
                                  return DropdownButtonFormField<String>(
                                    value: controller.selectedVisa.value
                                        .isNotEmpty ? controller.selectedVisa
                                        .value : null,
                                    hint: Text("कुन भिषामा ?"),
                                    items: [
                                      DropdownMenuItem(
                                        value: 'वर्किङ भिषा (काम गर्ने भिषा)',
                                        child: Text('वर्किङ भिषा (काम गर्ने भिषा)'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'भिजिट भिषा (भ्रमण भिषा)',
                                        child: Text('भिजिट भिषा (भ्रमण भिषा)'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'स्टुडेन्ट भिषा (पढ्न जाने भिषा)',
                                        child: Text('स्टुडेन्ट भिषा (पढ्न जाने भिषा)'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'थाहा छैन',
                                        child: Text('थाहा छैन'),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      controller.selectedVisa.value = value!;
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
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        softWrap: true,
                                        "विदेशजाने क्रममा तयार गरिएका कागजपत्रहरु (पासपोर्ट, सम्झौता पत्र, बीमा, मेडीकल, श्रम स्वकृति..) को प्रतिलिपी घररमा छाडेकावा पठएका छन्?",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "*",
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Obx(() {
                                  return DropdownButtonFormField<String>(
                                    value: controller.haveDocumentInHome.value.isNotEmpty?controller.haveDocumentInHome.value:null,
                                    hint: Text("घर परिवारमा ... पासवर्ड छाडेको छ?"),
                                    items: [
                                      DropdownMenuItem(
                                        value: 'छ',
                                        child: Text('छ'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'छैन',
                                        child: Text('छैन'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'थाहा छैन',
                                        child: Text('थाहा छैन'),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      controller.haveDocumentInHome.value =
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
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                          softWrap: true,
                                          "उहाँ वैदेशिक रोजगारमा जानु पूर्व कुनै सीप तालिम लिनु भएको थियो ?",
                                          style: TextStyle(fontWeight: FontWeight.bold)),
                                    ),
                                    Text("*",
                                        style: TextStyle(
                                          color: Colors.red,
                                        ))
                                  ],
                                ),
                                Obx(() {
                                  return DropdownButtonFormField<String>(
                                    value: controller.isSkilled.value.isNotEmpty?controller.isSkilled.value:null,
                                    hint: Text("थियो/ थिएन?"),
                                    items: [
                                      DropdownMenuItem(
                                        value: '1',
                                        child: Text('थियो'),
                                      ),
                                      DropdownMenuItem(
                                        value: '0',
                                        child: Text('थिएन'),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      controller.isSkilled.value = value!;
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
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "विदेश जानु अघि वैदेशिक रोजगार सम्बन्धी कुनै सूचना, जानकारी तथा परामर्ष लिनु भएको थियो?",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "*",
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Obx(() {
                                  return DropdownButtonFormField<String>(
                                    value: controller.havePermission.value.isNotEmpty?controller.havePermission.value:null,
                                    hint: Text("विदेश जानु अघि ... थियो?"),
                                    items: [
                                      DropdownMenuItem(
                                        value: '1',
                                        child: Text('थियो'),
                                      ),
                                      DropdownMenuItem(
                                        value: '0',
                                        child: Text('थिएन'),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      controller.havePermission.value = value!;
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
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        softWrap: true,
                                        "ववैदेशिक रोजगारमा जाँदा कति रकम तिर्नु भएको थियो ?",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "*",
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Obx(() {
                                  return DropdownButtonFormField<String>(
                                    value: controller.amountPaidForFe.value.isNotEmpty?controller.amountPaidForFe.value:null,
                                    hint: Text("... थियो?"),
                                    items: [
                                      DropdownMenuItem(
                                        value: 'upto 10000',
                                        child: Text('रु. १०,००० सम्म'),
                                      ),
                                      DropdownMenuItem(
                                        value: '10000-50000',
                                        child: Text('रु. १०,००० देखि ५०,००० सम्म'),
                                      ),
                                      DropdownMenuItem(
                                        value: '50000-100000',
                                        child: Text('रु. ५०,००० देखि १,००,००० सम्म'),
                                      ),
                                      DropdownMenuItem(
                                        value: '100000-200000',
                                        child: Text('रु. १,००,००० देखि २,००,००० सम्म'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'more than 200000',
                                        child: Text('रु. २,००,००० भन्दा बढी'),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      controller.amountPaidForFe.value =
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
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        softWrap: true,
                                        "सो रकम निम्न मध्ये कुन श्रोतबाट धेरै रकम बुझाउनु भयो ?",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "*",
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Obx(() {
                                  return DropdownButtonFormField<String>(
                                    value: controller.amountPaidForFeMedium.value.isNotEmpty?controller.amountPaidForFeMedium.value:null,
                                    hint: Text("... बुझाउनु भयो?"),
                                    items: [
                                      DropdownMenuItem(
                                        value: 'afantabata-sapati',
                                        child: Text('आफन्तबाट सापटी लिएर'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'rin-liera',
                                        child: Text('ऋण लिएर (व्याज तिर्ने गरी)'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'jagga-bechera',
                                        child: Text('जग्गा वा सम्पत्ति बेचेर'),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      controller.amountPaidForFeMedium.value =
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

                            // Column(
                            //   children: [
                            //     Row(
                            //       children: [
                            //         Text("सिप सिकेर गएको भए सिपको नाम ",
                            //             style: TextStyle(
                            //                 fontWeight: FontWeight.bold)),
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
                            //         hintText: 'सिपको नाम',
                            //         contentPadding: EdgeInsets.symmetric(
                            //             vertical: 16, horizontal: 12),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // Column(
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   children: [
                            //     Wrap(
                            //       children: [
                            //         Text(
                            //           'यदि सूचना लिएर गएको हो भने कुन माध्यमबाट सूचना केन्द्र पुग्नु भएको हो ?',
                            //           style: TextStyle(
                            //               fontWeight: FontWeight.bold),
                            //         ),
                            //       ],
                            //     ),
                            //     Obx(() {
                            //       return DropdownButtonFormField<String>(
                            //         value: controller.permissionSourceMethod
                            //             .value.isNotEmpty?controller.permissionSourceMethod
                            //             .value:null,
                            //         hint:  Text('यदि सूचना लिएर ... भएको हो ?'),
                            //         items: [
                            //           DropdownMenuItem(
                            //             value: 'रिटर्नी स्वय,स्वयंसेवक',
                            //             child: Text('रिटर्नी स्वय,स्वयंसेवक'),
                            //           ),
                            //           DropdownMenuItem(
                            //             value: 'साथीभाई तथा पारिवारिक सदस्य ',
                            //             child:
                            //             Text('साथीभाई तथा पारिवारिक सदस्य '),
                            //           ),
                            //           DropdownMenuItem(
                            //             value: 'म्यानपावर कम्पनि',
                            //             child: Text('म्यानपावर कम्पनि'),
                            //           ),
                            //           DropdownMenuItem(
                            //             value: 'विद्यार्थी तथा शिक्षक',
                            //             child: Text('विद्यार्थी तथा शिक्षक'),
                            //           ),
                            //           DropdownMenuItem(
                            //             value: 'रेडियो',
                            //             child: Text('रेडियो'),
                            //           ),
                            //           DropdownMenuItem(
                            //             value: 'अन्य',
                            //             child: Text('अन्य'),
                            //           ),
                            //         ],
                            //         onChanged: (value) {
                            //           controller.permissionSourceMethod.value =
                            //           value!;
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
                            //       );
                            //     }),
                            //   ],
                            // ),
                            // Column(
                            //   children: [
                            //     Row(
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: [
                            //         Expanded(
                            //           child: Text(
                            //             "डकुमेन्टको फोटोकपी छाडेको छ भने के के छाडेको छ ?",
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
                            //         crossAxisAlignment: CrossAxisAlignment
                            //             .start,
                            //         children:
                            //         _documentOptions.map((option) {
                            //           return Row(
                            //             children: [
                            //               Expanded(
                            //                 child: Row(
                            //                   children: [
                            //                     Checkbox(
                            //                       value: controller
                            //                           .selectedDocuments
                            //                           .contains(
                            //                           option),
                            //                       onChanged: (_) =>
                            //                           controller
                            //                               .toggleSelection(
                            //                               option),
                            //                     ),
                            //                     Text(option),
                            //                   ],
                            //                 ),
                            //               ),
                            //             ],
                            //           );
                            //         }).toList(),
                            //       );
                            //     }),
                            //   ],
                            // ),

                          ],
                        ),
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
