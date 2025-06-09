import 'package:migrant_profile/controllers/groupb_fourth_form_controllrt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupbFourth extends StatefulWidget {
  const GroupbFourth({super.key});

  @override
  State<GroupbFourth> createState() => _GroupbFourthState();
}

class _GroupbFourthState extends State<GroupbFourth> {

  @override
  Widget build(BuildContext context) {
    final GroupbFourthFormController controller = Get.put(
        GroupbFourthFormController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'वैदेशिक xxxxरोजगारबाट फर्केका व्यक्तिहरु सँग सम्बन्धी विवरण',
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
                          spacing: 10.0,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                          "वैर्ेनशक रोजगारबाट फकेपनछ कन पाररवाररक समस्या िोग्निएको छ?",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Text(
                                      "*",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Obx(() {
                              return DropdownButtonFormField<String>(
                                isExpanded: true,
                                value: controller.familyProblemAfterReturn.value
                                    .isNotEmpty ? controller.familyProblemAfterReturn
                                    .value : null,
                                hint: Text("समस्या िोग्निएको छ?"),
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
                                  controller.familyProblemAfterReturn.value = value!;
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
                                    "यनर् छिने ",
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
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
                                value: controller.familyProblemAfterReturnType
                                    .value.isNotEmpty ? controller
                                    .familyProblemAfterReturnType.value : null,
                                isExpanded: true,
                                hint: Text("यनर् छिने"),
                                items: [
                                  DropdownMenuItem(
                                    value: 'नगद सहयोग',
                                    child: Text('नगद सहयोग'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'सामग्री सहयोग',
                                    child: Text('सामग्री सहयोग'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'प्रबिधि सहयोग',
                                    child: Text('प्रबिधि सहयोग'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'तालिम',
                                    child: Text('तालिम'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'व्यावसाय दर्तामा छुट',
                                    child: Text('व्यावसाय दर्तामा छुट'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'अन्य',
                                    child: Text('अन्य'),
                                  ),
                                ],
                                onChanged: (value) {
                                  controller.businessHelpFromGovernment.value =
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "वैर्ेनशक रोजगारबाट फकेपनछ स्वास्थय समस्या आएको  छ? ",
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
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
                                hint: Text("व्यावसाय शुरु ... भएको छ?"),
                                value: controller.expectedHelpFromGovernment
                                    .value.isNotEmpty ? controller
                                    .expectedHelpFromGovernment.value : null,
                                items: [
                                  DropdownMenuItem(
                                    value: 'नगद सहयोग',
                                    child: Text('नगद सहयोग'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'सामग्री सहयोग',
                                    child: Text('सामग्री सहयोग'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'प्रबिधि सहयोग',
                                    child: Text('प्रबिधि सहयोग'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'तालिम',
                                    child: Text('तालिम'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'व्यावसाय दर्तामा छुट',
                                    child: Text('व्यावसाय दर्तामा छुट'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'अन्य',
                                    child: Text('अन्य'),
                                  ),
                                ],
                                onChanged: (value) {
                                  controller.expectedHelpFromGovernment.value =
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
                                    "वैर्ेनशक रोजगारबाट फकेपनछ पररवार वा समर्ायमा कन िर्िाव वा लान्छना िोग्न परको?",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text(
                                  "*",
                                  style: TextStyle(color: Colors.red),
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
