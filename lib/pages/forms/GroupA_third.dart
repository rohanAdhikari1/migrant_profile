import 'package:migrant_profile/controllers/groupa_third_form_controllrt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupaThird extends StatefulWidget {
  const GroupaThird({super.key});

  @override
  State<GroupaThird> createState() => _GroupaThirdState();
}

class _GroupaThirdState extends State<GroupaThird> {

  final problemOptions = [
    'भने अनुसारको काम नपाएको',
    'भने अनुसारको तलब नपाएको',
    'भने अनुसारको काम र तलब दुवै नपाएको',
    'मालिकले नेपाल फर्कन नदिएको',
    'मेडिकल फेल भएको',
    'लामो समयदेखि तलब नपाएको',
    'कम्पनीले बस्न दिएको तर खाना नदिएको',
  ];

  final familyProblemOptions = [
    'परिवारमा त्यस्तो कुनै समस्या छैन',
    'पारिवारिक बेमेल',
    'कोहि दोश्रो व्यक्तिसँग आरोप तथा लान्छाना लागेको',
    'दोश्रो विवाह गरेको',
    'परिवारसँग लामो समयसम्म सम्पर्क नभएको',
    'विदेशबाट लामो समयदेखि पैसा नपठाएको',
    'वालबच्चाहरु मात्र घरमा बस्नु परेको',
    'वृद्ध वुवा आमा मात्र घरमा भएको',
    'गम्भिर मानसिक चिन्ता वा बेला बेलामा बेहोस हुने समस्या'
  ];

  @override
  Widget build(BuildContext context) {
    final GroupaThirdFormController controller = Get.put(
        GroupaThirdFormController());
    return Scaffold(
      appBar: AppBar(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "हाल विदेशमा कस्तो काम गर्दै हुनुहुन्छ?",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Obx(() {
                                  return DropdownButtonFormField<String>(
                                    value: controller.foreignOccupation.value
                                        .isNotEmpty
                                        ? controller.foreignOccupation.value
                                        : null,
                                    hint: Text(
                                        "हाल विदेशमा कस्तो काम गर्दै हुनुहुन्छ?"),
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
                                      DropdownMenuItem(
                                        value: 'थाहा छैन',
                                        child: Text('थाहा छैन'),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      controller.foreignOccupation.value = value!;
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
                                        "वैदेशिक रोजगारमा रहँदा हालसम्म केहि समस्या भोग्नु भएको छ ?",
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
                                    value: controller
                                        .haveProblemInForeignEmployment
                                        .value.isNotEmpty ? controller
                                        .haveProblemInForeignEmployment
                                        .value : null,
                                    hint: Text(
                                        "वैदेशिक रोजगारको ... थियो?"),
                                    items: [
                                      DropdownMenuItem(
                                        value: '1',
                                        child: Text('छ'),
                                      ),
                                      DropdownMenuItem(
                                        value: '0',
                                        child: Text('छैन'),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      controller.haveProblemInForeignEmployment
                                          .value = value!;
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
                            Obx(() {
                              return controller.haveProblemInForeignEmployment.value == '1'?
                                 Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "निम्न मध्ये कुन कुन समस्या भोग्नु परेको छ ?",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Obx(() {
                                          return Column(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children:
                                            problemOptions.map((option) {
                                              return Row(
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      children: [
                                                        Checkbox(
                                                          value: controller
                                                              .selectedProblems
                                                              .contains(
                                                              option),
                                                          onChanged: (_) =>
                                                              controller
                                                                  .toggleSelection(controller.selectedProblems,
                                                                  option),
                                                        ),
                                                        Text(option),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              );
                                            }).toList(),
                                          );
                                        }),
                                      ],
                                    ),
                                  ],
                                ): SizedBox(height: 1);
                            }),
                            Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "वैदेशिक रोजगारका क्रममा विदेश रहँदा पारिवारिक समस्या भोग्नु भएको छ ?",
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
                                    value: controller
                                        .haveFamilyProblemInForeignEmployment
                                        .value.isNotEmpty ? controller
                                        .haveFamilyProblemInForeignEmployment
                                        .value : null,
                                    hint: Text(
                                        "वैदेशिक रोजगारको ... थियो?"),
                                    items: [
                                      DropdownMenuItem(
                                        value: '1',
                                        child: Text('छ'),
                                      ),
                                      DropdownMenuItem(
                                        value: '0',
                                        child: Text('छैन'),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      controller.haveFamilyProblemInForeignEmployment
                                          .value = value!;
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
                            Obx(() {
                              return controller.haveFamilyProblemInForeignEmployment.value == '1'?
                              Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "निम्न मध्ये कुन कुन पारिवारिक समस्या भोग्नु भएको छ ?",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Obx(() {
                                        return Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children:
                                          familyProblemOptions.map((option) {
                                            return Row(
                                              children: [
                                                Expanded(
                                                  child: Row(
                                                    children: [
                                                      Checkbox(
                                                        value: controller
                                                            .selectedFamilyProblems
                                                            .contains(
                                                            option),
                                                        onChanged: (_) =>
                                                            controller
                                                                .toggleSelection(controller.selectedFamilyProblems,
                                                                option),
                                                      ),
                                                      Text(option),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            );
                                          }).toList(),
                                        );
                                      }),
                                    ],
                                  ),
                                ],
                              ): SizedBox(height: 1);
                            })



                            // Column(
                            //   children: [
                            //     Row(
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: [
                            //         Expanded(
                            //           child: Text(
                            //             "विदेश जादा ऋण लिएको हो भने कहाँवाट लिनु भएको हो ?",
                            //             style: TextStyle(
                            //               fontSize: 14,
                            //               fontWeight: FontWeight.bold,
                            //             ),
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //     Obx(() {
                            //       return DropdownButtonFormField<String>(
                            //         value: controller.loanSource.value
                            //             .isNotEmpty
                            //             ? controller.loanSource.value
                            //             : null,
                            //         hint: Text(
                            //             "विदेश जादा ऋण ... लिनु भएको हो ?"),
                            //         items: [
                            //           DropdownMenuItem(
                            //             value: 'आफन्त तथा साथीभाइ',
                            //             child: Text('आफन्त तथा साथीभाइ'),
                            //           ),
                            //           DropdownMenuItem(
                            //             value: 'बचत समूह',
                            //             child: Text('बचत समूह'),
                            //           ),
                            //           DropdownMenuItem(
                            //             value: 'सहकारी',
                            //             child: Text('सहकारी'),
                            //           ),
                            //           DropdownMenuItem(
                            //             value: 'बैंक',
                            //             child: Text('बैंक'),
                            //           ),
                            //           DropdownMenuItem(
                            //             value: 'साहुमहाजन',
                            //             child: Text('साहुमहाजन'),
                            //           ),
                            //         ],
                            //         onChanged: (value) {
                            //           controller.loanSource.value = value!;
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
                            //             "विदेश जादा ऋण लिएको हो भने व्याज कति तिर्नुपर्छ ?",
                            //             style: TextStyle(
                            //               fontSize: 14,
                            //               fontWeight: FontWeight.bold,
                            //             ),
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //     Obx(() {
                            //       return DropdownButtonFormField<String>(
                            //         value: controller.loanInterest.value
                            //             .isNotEmpty ? controller.loanInterest
                            //             .value : null,
                            //         hint: Text(
                            //             "विदेश जादा ऋण ... व्याज कति तिर्नुपर्छ ?"),
                            //         items: [
                            //           DropdownMenuItem(
                            //             value: '१० प्रतिशत भन्दा कम',
                            //             child: Text('१० प्रतिशत भन्दा कम'),
                            //           ),
                            //           DropdownMenuItem(
                            //             value: '१० प्रतिशत देखि १५ प्रतिशत',
                            //             child: Text(
                            //                 '१० प्रतिशत देखि १५ प्रतिशत'),
                            //           ),
                            //           DropdownMenuItem(
                            //             value: '१६ प्रतिशत देखि १८ प्रतिशत',
                            //             child: Text(
                            //                 '१६ प्रतिशत देखि १८ प्रतिशत'),
                            //           ),
                            //           DropdownMenuItem(
                            //             value: '१९ प्रतिशत देखि २४ प्रतिशत',
                            //             child: Text(
                            //                 '१९ प्रतिशत देखि २४ प्रतिशत'),
                            //           ),
                            //           DropdownMenuItem(
                            //             value: '२५ प्रतिशत देखि ३६ प्रतिशत',
                            //             child: Text(
                            //                 '२५ प्रतिशत देखि ३६ प्रतिशत'),
                            //           ),
                            //           DropdownMenuItem(
                            //             value: 'सो भन्दा माथि',
                            //             child: Text('सो भन्दा माथि'),
                            //           ),
                            //         ],
                            //         onChanged: (value) {
                            //           controller.loanInterest.value = value!;
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
                            //
                            // Row(
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   children: [
                            //     Expanded(
                            //       flex: 1,
                            //       child: Column(
                            //         crossAxisAlignment:
                            //         CrossAxisAlignment.start,
                            //         children: [
                            //           Row(
                            //             children: [
                            //               Text(
                            //                 'ऋण तिरिसक्नु भयो ?',
                            //                 style: TextStyle(
                            //                     fontWeight: FontWeight.bold),
                            //               ),
                            //             ],
                            //           ),
                            //           SizedBox(height: 4),
                            //           Obx(() {
                            //             return DropdownButtonFormField<String>(
                            //               value: controller.isLoanPaid.value
                            //                   .isNotEmpty ? controller
                            //                   .isLoanPaid
                            //                   .value : null,
                            //               hint: Text("भयो ?"),
                            //               items: [
                            //                 DropdownMenuItem(
                            //                   value: '1',
                            //                   child: Text('छ'),
                            //                 ),
                            //                 DropdownMenuItem(
                            //                   value: '0',
                            //                   child: Text('छैन'),
                            //                 ),
                            //               ],
                            //               onChanged: (value) {
                            //                 controller.isLoanPaid.value =
                            //                 value!;
                            //               },
                            //               decoration: InputDecoration(
                            //                 filled: true,
                            //                 fillColor: Colors.blue[50],
                            //                 border: OutlineInputBorder(
                            //                   borderRadius:
                            //                   BorderRadius.circular(12),
                            //                   borderSide: BorderSide.none,
                            //                 ),
                            //                 contentPadding: EdgeInsets
                            //                     .symmetric(
                            //                     vertical: 12, horizontal: 8),
                            //               ),
                            //               // validator: (value) {
                            //               //   if (value == null || value.isEmpty) {
                            //               //     return '${'farmer_gender'.tr} ${'required'.tr}';
                            //               //   }
                            //               //   return null;
                            //               // },
                            //             );
                            //           }),
                            //         ],
                            //       ),
                            //     ),
                            //     SizedBox(width: 15),
                            //     Expanded(
                            //       flex: 1,
                            //       child: Column(
                            //         crossAxisAlignment:
                            //         CrossAxisAlignment.start,
                            //         children: [
                            //           Row(
                            //             children: [
                            //               Text(
                            //                 "छ भने कति समयमा ?",
                            //                 style: TextStyle(
                            //                     fontWeight: FontWeight.bold),
                            //               ),
                            //             ],
                            //           ),
                            //           // SizedBox(height: 2),
                            //           Obx(() {
                            //             return DropdownButtonFormField<String>(
                            //               hint: Text("कति?"),
                            //               value: controller.loanPaidTime.value
                            //                   .isNotEmpty ? controller
                            //                   .loanPaidTime.value : null,
                            //               items: [
                            //                 DropdownMenuItem(
                            //                   value: '३ महिना भित्र',
                            //                   child: Text('३ महिना भित्र'),
                            //                 ),
                            //                 DropdownMenuItem(
                            //                   value: '६ महिना भित्र',
                            //                   child: Text('६ महिना भित्र'),
                            //                 ),
                            //                 DropdownMenuItem(
                            //                   value: '९ महिना भित्र',
                            //                   child: Text('९ महिना भित्र'),
                            //                 ),
                            //                 DropdownMenuItem(
                            //                   value: '१२ महिना भित्र',
                            //                   child: Text('१२ महिना भित्र'),
                            //                 ),
                            //                 DropdownMenuItem(
                            //                   value: '१८महिना भित्र',
                            //                   child: Text('१८ महिना भित्र'),
                            //                 ),
                            //                 DropdownMenuItem(
                            //                   value: '१८ भन्दा बढि',
                            //                   child: Text('१८ भन्दा बढि'),
                            //                 ),
                            //               ],
                            //               onChanged: (value) {
                            //                 controller.loanPaidTime.value =
                            //                 value!;
                            //               },
                            //               decoration: InputDecoration(
                            //                 filled: true,
                            //                 fillColor: Colors.blue[50],
                            //                 border: OutlineInputBorder(
                            //                   borderRadius:
                            //                   BorderRadius.circular(12),
                            //                   borderSide: BorderSide.none,
                            //                 ),
                            //                 contentPadding: EdgeInsets
                            //                     .symmetric(
                            //                     vertical: 12, horizontal: 8),
                            //               ),
                            //               // validator: (value) {
                            //               //   if (value == null || value.isEmpty) {
                            //               //     return '${'farmer_gender'.tr} ${'required'.tr}';
                            //               //   }
                            //               //   return null;
                            //               // },
                            //             );
                            //           }),
                            //         ],
                            //       ),
                            //     ),
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
