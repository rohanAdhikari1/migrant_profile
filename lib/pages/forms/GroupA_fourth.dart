import 'package:survey/controllers/groupa_fourth_form_controllrt.dart';
import 'package:survey/pages/forms/GroupA_fifth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupaFourth extends StatefulWidget {
  const GroupaFourth({super.key});

  @override
  State<GroupaFourth> createState() => _GroupaFourthState();
}

class _GroupaFourthState extends State<GroupaFourth> {

  @override
  Widget build(BuildContext context) {
    final GroupaFourthFormController controller = Get.put(
        GroupaFourthFormController());

    final _covidProblemOptions = [
      'समस्या छैन',
      'सम्झौता भंग गरि काम र तलब नदिएको',
      '५०% मात्र काम र तलब',
      'निरन्तर काम गरिरहेको तर तलब नदिएको',
      'क्वारेन्टाइनमा रहेको तर नियमित तलब पाइरहेको',
      'क्वारेन्टाइनमा रहेको काम र तलब नपाइरहेको',
    ];

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
                                        "कोरोनको कारण समस्या भएको छ अथवा थियो भनी कस्तो समस्या ?",
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
                                        children: _covidProblemOptions.map((
                                            option) {
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
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                          "कोरोनको कारण कुनै स्वास्थ्य समस्य भएको छ अथवा थियो भनी कस्तो समस्या ?",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    // Text("*",
                                    //     style: TextStyle(
                                    //       color: Colors.red,
                                    //     ))
                                  ],
                                ),
                                Obx(() {
                                  return DropdownButtonFormField<String>(
                                    value: controller.covidHealthProblem.value
                                        .isNotEmpty ? controller
                                        .covidHealthProblem.value : null,
                                    hint: Text(
                                        "कोरोनको कारण कुनै ... समस्या?"),
                                    items: [
                                      DropdownMenuItem(
                                        value:
                                        'क्वारेन्टाइनमा बस्ने पनि खाने पनि समस्या भएको',
                                        child: Text(
                                            'क्वारेन्टाइनमा बस्ने पनि खाने पनि समस्या भएको'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'खान नदिएको',
                                        child: Text('खान नदिएको'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'उपचार राम्रो नपाएको',
                                        child: Text('उपचार राम्रो नपाएको'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'कोरोनको कारण मृत्यु',
                                        child: Text('कोरोनको कारण मृत्यु'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'अन्य कारणले बिरामी भएको',
                                        child: Text('अन्य कारणले बिरामी भएको'),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      controller.covidHealthProblem.value =
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
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                          "वैदेशिक रोजगारमा रहदा परिवारमा केहि समस्या छ?",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Text("*",
                                        style: TextStyle(
                                          color: Colors.red,
                                        ))
                                  ],
                                ),
                                Obx(() {
                                  return DropdownButtonFormField<String>(
                                    value: controller
                                        .foreignEmploymentFamilyIssue
                                        .value.isNotEmpty ? controller
                                        .foreignEmploymentFamilyIssue
                                        .value : null,
                                    hint: Text(
                                        "वैदेशिक रोजगारमा ... समस्या छ?"),
                                    items: [
                                      DropdownMenuItem(
                                        value:
                                        'क्पर्वारिक वेमेल (घरेलु हिंसा)',
                                        child: Text(
                                            'क्पर्वारिक वेमेल (घरेलु हिंसा)'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'गम्भीर मानसित चिन्ता / वेहोस हुने',
                                        child: Text(
                                            'गम्भीर मानसित चिन्ता / वेहोस हुने'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'आरोप लान्छाना सम्बन्धिका घटना',
                                        child: Text(
                                            'आरोप लान्छाना सम्बन्धिका घटना'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'दोस्रो विवाह',
                                        child: Text('दोस्रो विवाह'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'वृद्ध वुवा आमा मात्र घरमा भएको',
                                        child: Text(
                                            'वृद्ध वुवा आमा मात्र घरमा भएको'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'वालवचा एक्लो भएको',
                                        child: Text('वालवचा एक्लो भएको'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'श्रीमानले लामो लामो समयदेखि पैसा नपठाएको',
                                        child: Text(
                                            'श्रीमानले लामो लामो समयदेखि पैसा नपठाएको'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'परिवारमा लामो समयदेखि सम्पर्कमा नभएको',
                                        child: Text(
                                            'परिवारमा लामो समयदेखि सम्पर्कमा नभएको'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'अन्य कुनै घटना',
                                        child: Text('अन्य कुनै घटना'),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      controller.foreignEmploymentFamilyIssue
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
