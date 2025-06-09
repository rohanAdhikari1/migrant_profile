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
                                          "तपाईले संचालन गरिरहेको व्यावसायले कति जनालाई रोजगारी दिएको छ?",
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
                            TextFormField(
                              keyboardType: TextInputType.numberWithOptions(),
                              controller: controller
                                  .employeeOnBusinessController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.blue[50],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: 'संख्या',
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 12),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'व्यक्तिको नाम ${'required'.tr}';
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
                                Expanded(
                                  child: Text(
                                    "तपाईले संचालन गरिरहेको व्यावसाय प्रबर्धनको लागि कुनै निकाय तथा स्थानीय सरकारको तर्फबाट कुनै सहयोग प्राप्त गर्नु भएको छ ?",
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
                                value: controller.businessHelpFromGovernment
                                    .value.isNotEmpty ? controller
                                    .businessHelpFromGovernment.value : null,
                                isExpanded: true,
                                hint: Text("तपाईले संचालन ... भएको छ?"),
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
                                    "व्यावसाय शुरु गर्न वा प्रबर्धनको लागि कुनै निकाय, स्थानीय सरकारको तर्फबाट कस्ता किसिमको सहयोगको अपेक्षा गर्नु भएको छ ?",
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
                                    "व्यावसाय शुरु गर्न वा प्रबर्धनको लागि कस्ता खालका अप्ठ्याराहरुछन् ?",
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
                            Obx(() {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              value: controller
                                                  .selectedDifficultiesInBusiness
                                                  .contains('बजार ब्याबस्थापन'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    'बजार ब्याबस्थापन');
                                              },
                                            ),
                                            Text('बजार ब्याबस्थापन'),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              value: controller
                                                  .selectedDifficultiesInBusiness
                                                  .contains('सिचाई'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    'सिचाई');
                                              },
                                            ),
                                            Text('सिचाई'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              value: controller
                                                  .selectedDifficultiesInBusiness
                                                  .contains(
                                                  'प्रबिधिक सहयोगको कमी'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    'प्रबिधिक सहयोगको कमी');
                                              },
                                            ),
                                            Text('प्रबिधिक सहयोगको कमी'),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              value: controller
                                                  .selectedDifficultiesInBusiness
                                                  .contains('तालिम'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    'तालिम');
                                              },
                                            ),
                                            Text('तालिम'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              value: controller
                                                  .selectedDifficultiesInBusiness
                                                  .contains(
                                                  'यातायात तथा ढुवानी'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    'यातायात तथा ढुवानी');
                                              },
                                            ),
                                            Text('यातायात तथा ढुवानी'),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              value: controller
                                                  .selectedDifficultiesInBusiness
                                                  .contains('अनुदान'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    'अनुदान');
                                              },
                                            ),
                                            Text('अनुदान'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              value: controller
                                                  .selectedDifficultiesInBusiness
                                                  .contains(
                                                  'कच्चा सामग्रीको कमी'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    'कच्चा सामग्रीको कमी');
                                              },
                                            ),
                                            Text('कच्चा सामग्रीको कमी'),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              value: controller
                                                  .selectedDifficultiesInBusiness
                                                  .contains('नीति नियम'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    'नीति नियम');
                                              },
                                            ),
                                            Text('नीति नियम'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              value: controller
                                                  .selectedDifficultiesInBusiness
                                                  .contains('बजेटको अभाव'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    'बजेटको अभाव');
                                              },
                                            ),
                                            Text('बजेटको अभाव'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            }),
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
