import 'package:survey/controllers/groupa_second_form_controllrt.dart';
import 'package:survey/pages/forms/GroupA_third.dart';
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
                                    Text("सिप तालिम सिकेर गएको हो / होइन ?",
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
                                    value: controller.isSkilled.value.isNotEmpty?controller.isSkilled.value:null,
                                    hint: Text("हो / होइन ?"),
                                    items: [
                                      DropdownMenuItem(
                                        value: '1',
                                        child: Text('हो'),
                                      ),
                                      DropdownMenuItem(
                                        value: '0',
                                        child: Text('होइन'),
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
                                  children: [
                                    Text("सिप सिकेर गएको भए सिपको नाम ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                TextFormField(
                                  controller: controller.skillNameController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.blue[50],
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: 'सिपको नाम',
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 12),
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
                                        "विदेश जानु अघि सूचना केन्द्रबाट सूचनाजानकारी लिएर गएको ?",
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
                                    hint: Text("विदेश जानु अघि ... गएको ?"),
                                    items: [
                                      DropdownMenuItem(
                                        value: '1',
                                        child: Text('हो'),
                                      ),
                                      DropdownMenuItem(
                                        value: '0',
                                        child: Text('होइन'),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Wrap(
                                  children: [
                                    Text(
                                      'यदि सूचना लिएर गएको हो भने कुन माध्यमबाट सूचना केन्द्र पुग्नु भएको हो ?',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Obx(() {
                                  return DropdownButtonFormField<String>(
                                    value: controller.permissionSourceMethod
                                        .value.isNotEmpty?controller.permissionSourceMethod
                                        .value:null,
                                    hint:  Text('यदि सूचना लिएर ... भएको हो ?'),
                                    items: [
                                      DropdownMenuItem(
                                        value: 'रिटर्नी स्वय,स्वयंसेवक',
                                        child: Text('रिटर्नी स्वय,स्वयंसेवक'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'साथीभाई तथा पारिवारिक सदस्य ',
                                        child:
                                        Text('साथीभाई तथा पारिवारिक सदस्य '),
                                      ),
                                      DropdownMenuItem(
                                        value: 'म्यानपावर कम्पनि',
                                        child: Text('म्यानपावर कम्पनि'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'विद्यार्थी तथा शिक्षक',
                                        child: Text('विद्यार्थी तथा शिक्षक'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'रेडियो',
                                        child: Text('रेडियो'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'अन्य',
                                        child: Text('अन्य'),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      controller.permissionSourceMethod.value =
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
                                        "घर परिवारमा विदेश जादा चाहिने डकुमेन्टको फोटोकपी वा युजर आइडी र पासवर्ड छाडेको छ?",
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
                                        value: '1',
                                        child: Text('छ'),
                                      ),
                                      DropdownMenuItem(
                                        value: '0',
                                        child: Text('छैन'),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "डकुमेन्टको फोटोकपी छाडेको छ भने के के छाडेको छ ?",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Obx(() {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children:
                                    _documentOptions.map((option) {
                                      return Row(
                                        children: [
                                          Expanded(
                                            child: Row(
                                              children: [
                                                Checkbox(
                                                  value: controller
                                                      .selectedDocuments
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
