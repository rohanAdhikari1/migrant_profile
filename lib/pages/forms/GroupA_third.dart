import 'package:survey/controllers/groupa_third_form_controllrt.dart';
import 'package:survey/pages/forms/GroupA_fourth.dart';
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
                                  children: [
                                    Text("कुन माध्यमबाट गएको हो ?",
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
                                    hint: Text("कुन माध्यमबाट गएको हो ?"),
                                    items: [
                                      DropdownMenuItem(
                                        value: 'एजेन्ट मार्फत',
                                        child: Text('एजेन्ट मार्फत'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'म्यानपावर कम्पनि मार्फत',
                                        child: Text('म्यानपावर कम्पनि मार्फत'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'आफन्त मार्फत',
                                        child: Text('आफन्त मार्फत'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'G to G मार्फत',
                                        child: Text('G to G मार्फत'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'कन्सल्टेन्सी मार्फत',
                                        child: Text('कन्सल्टेन्सी मार्फत'),
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
                            //       // controller: controller.nameController,
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
                                      "विदेश जादा कति रकम तिर्नु भयो ?",
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
                                    value: controller.paidAmount.value
                                        .isNotEmpty ? controller.paidAmount
                                        .value : null,
                                    hint: Text(
                                        "विदेश जादा कति रकम तिर्नु भयो ?"),
                                    items: [
                                      DropdownMenuItem(
                                        value: 'फ्री भिषा फ्री टिकटमा',
                                        child: Text('फ्री भिषा फ्री टिकटमा'),
                                      ),
                                      DropdownMenuItem(
                                        value: '११ देखि ५० हजार',
                                        child: Text('११ देखि ५० हजार'),
                                      ),
                                      DropdownMenuItem(
                                        value: '५१ देखि ८० हजार',
                                        child: Text('५१ देखि ८० हजार'),
                                      ),
                                      DropdownMenuItem(
                                        value: '८१ हजार देखि १ लाख सम्म',
                                        child: Text('८१ हजार देखि १ लाख सम्म'),
                                      ),
                                      DropdownMenuItem(
                                        value: '१ लाख १ हजार देखि १ लाख  ५० हजार',
                                        child: Text(
                                            '१ लाख १ हजार देखि १ लाख  ५० हजार'),
                                      ),
                                      DropdownMenuItem(
                                        value: '१ लाख ५१ हजार देखि २ लाख',
                                        child: Text('१ लाख ५१ हजार देखि २ लाख'),
                                      ),
                                      DropdownMenuItem(
                                        value: '२ लाख देखि माथि',
                                        child: Text('२ लाख देखि माथि'),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      controller.paidAmount.value = value!;
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
                                        "विदेश जादा लागेको मुख्य लागतको स्रोत ?",
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
                                    value: controller.paidSource.value
                                        .isNotEmpty
                                        ? controller.paidSource.value
                                        : null,
                                    hint: Text(
                                        "विदेश जादा लागेको मुख्य लागतको स्रोत ?"),
                                    items: [
                                      DropdownMenuItem(
                                        value: 'आफ्नै स्रोत',
                                        child: Text('आफ्नै स्रोत'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'सम्पति  बेचेर',
                                        child: Text('सम्पति  बेचेर'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'ऋण सापटी लिएर',
                                        child: Text('ऋण सापटी लिएर'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'थाहा छैन',
                                        child: Text('थाहा छैन'),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      controller.paidSource.value = value!;
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
                                        "विदेश जादा ऋण लिएको हो भने कहाँवाट लिनु भएको हो ?",
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
                                    value: controller.loanSource.value
                                        .isNotEmpty
                                        ? controller.loanSource.value
                                        : null,
                                    hint: Text(
                                        "विदेश जादा ऋण ... लिनु भएको हो ?"),
                                    items: [
                                      DropdownMenuItem(
                                        value: 'आफन्त तथा साथीभाइ',
                                        child: Text('आफन्त तथा साथीभाइ'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'बचत समूह',
                                        child: Text('बचत समूह'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'सहकारी',
                                        child: Text('सहकारी'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'बैंक',
                                        child: Text('बैंक'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'साहुमहाजन',
                                        child: Text('साहुमहाजन'),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      controller.loanSource.value = value!;
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
                                        "विदेश जादा ऋण लिएको हो भने व्याज कति तिर्नुपर्छ ?",
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
                                    value: controller.loanInterest.value
                                        .isNotEmpty ? controller.loanInterest
                                        .value : null,
                                    hint: Text(
                                        "विदेश जादा ऋण ... व्याज कति तिर्नुपर्छ ?"),
                                    items: [
                                      DropdownMenuItem(
                                        value: '१० प्रतिशत भन्दा कम',
                                        child: Text('१० प्रतिशत भन्दा कम'),
                                      ),
                                      DropdownMenuItem(
                                        value: '१० प्रतिशत देखि १५ प्रतिशत',
                                        child: Text(
                                            '१० प्रतिशत देखि १५ प्रतिशत'),
                                      ),
                                      DropdownMenuItem(
                                        value: '१६ प्रतिशत देखि १८ प्रतिशत',
                                        child: Text(
                                            '१६ प्रतिशत देखि १८ प्रतिशत'),
                                      ),
                                      DropdownMenuItem(
                                        value: '१९ प्रतिशत देखि २४ प्रतिशत',
                                        child: Text(
                                            '१९ प्रतिशत देखि २४ प्रतिशत'),
                                      ),
                                      DropdownMenuItem(
                                        value: '२५ प्रतिशत देखि ३६ प्रतिशत',
                                        child: Text(
                                            '२५ प्रतिशत देखि ३६ प्रतिशत'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'सो भन्दा माथि',
                                        child: Text('सो भन्दा माथि'),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      controller.loanInterest.value = value!;
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

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'ऋण तिरिसक्नु भयो ?',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 4),
                                      Obx(() {
                                        return DropdownButtonFormField<String>(
                                          value: controller.isLoanPaid.value
                                              .isNotEmpty ? controller
                                              .isLoanPaid
                                              .value : null,
                                          hint: Text("भयो ?"),
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
                                            controller.isLoanPaid.value =
                                            value!;
                                          },
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.blue[50],
                                            border: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(12),
                                              borderSide: BorderSide.none,
                                            ),
                                            contentPadding: EdgeInsets
                                                .symmetric(
                                                vertical: 12, horizontal: 8),
                                          ),
                                          // validator: (value) {
                                          //   if (value == null || value.isEmpty) {
                                          //     return '${'farmer_gender'.tr} ${'required'.tr}';
                                          //   }
                                          //   return null;
                                          // },
                                        );
                                      }),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 15),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "छ भने कति समयमा ?",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      // SizedBox(height: 2),
                                      Obx(() {
                                        return DropdownButtonFormField<String>(
                                          hint: Text("कति?"),
                                          value: controller.loanPaidTime.value.isNotEmpty?controller.loanPaidTime.value:null,
                                          items: [
                                            DropdownMenuItem(
                                              value: '३ महिना भित्र',
                                              child: Text('३ महिना भित्र'),
                                            ),
                                            DropdownMenuItem(
                                              value: '६ महिना भित्र',
                                              child: Text('६ महिना भित्र'),
                                            ),
                                            DropdownMenuItem(
                                              value: '९ महिना भित्र',
                                              child: Text('९ महिना भित्र'),
                                            ),
                                            DropdownMenuItem(
                                              value: '१२ महिना भित्र',
                                              child: Text('१२ महिना भित्र'),
                                            ),
                                            DropdownMenuItem(
                                              value: '१८महिना भित्र',
                                              child: Text('१८ महिना भित्र'),
                                            ),
                                            DropdownMenuItem(
                                              value: '१८ भन्दा बढि',
                                              child: Text('१८ भन्दा बढि'),
                                            ),
                                          ],
                                          onChanged: (value) {
                                            controller.loanPaidTime.value =
                                            value!;
                                          },
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.blue[50],
                                            border: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(12),
                                              borderSide: BorderSide.none,
                                            ),
                                            contentPadding: EdgeInsets
                                                .symmetric(
                                                vertical: 12, horizontal: 8),
                                          ),
                                          // validator: (value) {
                                          //   if (value == null || value.isEmpty) {
                                          //     return '${'farmer_gender'.tr} ${'required'.tr}';
                                          //   }
                                          //   return null;
                                          // },
                                        );
                                      }),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "वैदेशिक रोजगारको क्रममा केहि समस्या केहि समस्या भएको छ अथवा भएको थियो ?",
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
                            Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "समस्या भएको छ अथवा थियो भनी कस्तो समस्या ?",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                                              .toggleSelection(
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
                            ),
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
