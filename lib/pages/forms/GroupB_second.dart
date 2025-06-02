import 'package:survey/controllers/groupb_second_form_controllrt.dart';
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
                                    value: 'जागिर गरिरहेको',
                                    child: Text('जागिर गरिरहेको'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'स्वरोजगार गरिरहेको ',
                                    child: Text('स्वरोजगार गरिरहेको '),
                                  ),
                                  DropdownMenuItem(
                                    value:
                                    'बेरोजगार रहेको र जागिरको खोजि गरिरहेको',
                                    child: Text(
                                        'बेरोजगार रहेको र जागिरको खोजि गरिरहेको'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'विदेश जानलाइ कुरिरहेको',
                                    child: Text('विदेश जानलाइ कुरिरहेको'),
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 10.0,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                        "जागिर गर्दै हुनुहुन्छ भने के जागिर पाउनु भएको छ ?",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ],
                            ),
                            TextFormField(
                              controller: controller.occupationController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.blue[50],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: 'जागिरको नाम',
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 12),
                              ),
                              // validator: (value) {
                              //   if (value == null || value.isEmpty) {
                              //     return 'व्यक्तिको नाम ${'required'.tr}';
                              //   }
                              //   return null;
                              // },
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 10.0,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                        "बिदेशमा काम गर्दा के सिप तालिम सिकेर गएको हो ?",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
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
                                hintText: 'तालिमको नाम',
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 12),
                              ),
                              // validator: (value) {
                              //   if (value == null || value.isEmpty) {
                              //     return 'व्यक्तिको नाम ${'required'.tr}';
                              //   }
                              //   return null;
                              // },
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    "सिप सिकेर जानु भएको थियो वा विदेशमा रहदा केहि सीप सिक्नु भएको छ ?",
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              value: controller
                                                  .selectedSkillBeforeMigration
                                                  .contains('प्लम्वर'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    'प्लम्वर');
                                              },
                                            ),
                                            Text('प्लम्वर'),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              value: controller
                                                  .selectedSkillBeforeMigration
                                                  .contains('स्काफफोल्डङ'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    'स्काफफोल्डङ');
                                              },
                                            ),
                                            Text('स्काफफोल्डङ'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              value: controller
                                                  .selectedSkillBeforeMigration
                                                  .contains('कार्पेन्टर'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    'कार्पेन्टर');
                                              },
                                            ),
                                            Text('कार्पेन्टर'),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              value: controller
                                                  .selectedSkillBeforeMigration
                                                  .contains('मेसन'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    'मेसन');
                                              },
                                            ),
                                            Text('मेसन'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              value: controller
                                                  .selectedSkillBeforeMigration
                                                  .contains('ईलेक्टिसीयन'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    'ईलेक्टिसीयन');
                                              },
                                            ),
                                            Text('ईलेक्टिसीयन'),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              value: controller
                                                  .selectedSkillBeforeMigration
                                                  .contains('क्लिनर'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    'क्लिनर');
                                              },
                                            ),
                                            Text('क्लिनर'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              value: controller
                                                  .selectedSkillBeforeMigration
                                                  .contains('स्टील फिक्चर'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    'स्टील फिक्चर');
                                              },
                                            ),
                                            Text('स्टील फिक्चर'),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              value: controller
                                                  .selectedSkillBeforeMigration
                                                  .contains('कुक'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    'कुक');
                                              },
                                            ),
                                            Text('कुक'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              value: controller
                                                  .selectedSkillBeforeMigration
                                                  .contains('कृषि'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    'कृषि');
                                              },
                                            ),
                                            Text('कृषि'),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              value: controller
                                                  .selectedSkillBeforeMigration
                                                  .contains('वेटर'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    'वेटर');
                                              },
                                            ),
                                            Text('वेटर'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              value: controller
                                                  .selectedSkillBeforeMigration
                                                  .contains('सेक्यरीटी गार्ड'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    'सेक्यरीटी गार्ड');
                                              },
                                            ),
                                            Text('सेक्यरीटी गार्ड'),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              value: controller
                                                  .selectedSkillBeforeMigration
                                                  .contains('वेल्डर'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    'वेल्डर');
                                              },
                                            ),
                                            Text('वेल्डर'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              value: controller
                                                  .selectedSkillBeforeMigration
                                                  .contains('अन्य'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    'अन्य');
                                              },
                                            ),
                                            Text('अन्य'),
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "सिप परिक्षण सम्बन्धी तपाईलाई केहि जानकारी छ ?",
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
                                value: controller.knowAboutSkillTest.value
                                    .isNotEmpty ? controller.knowAboutSkillTest
                                    .value : null,
                                isExpanded: true,
                                hint: Text(
                                    "सिप परिक्षण ... जानकारी छ?"),
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
                                  controller.knowAboutSkillTest.value = value!;
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
                                  "थाहा छ भने सीप परिक्षण गर्नु भएको छ ?",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Obx(() {
                              return DropdownButtonFormField<String>(
                                isExpanded: true,
                                value: controller.doneSkillTest.value.isNotEmpty
                                    ? controller.doneSkillTest.value
                                    : null,
                                hint: Text(
                                    "थाहा छ भने सीप परिक्षण गर्नु भएको छ ?"),
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
                                  controller.doneSkillTest.value = value!;
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
                                  "यदि छैन भने सीप परिक्षण गर्ने सोंचमा हुनुहुन्छ ?",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Obx(() {
                              return DropdownButtonFormField<String>(
                                isExpanded: true,
                                hint: Text(
                                    "यदि छैन भने ... हुनुहुन्छ?"),
                                value: controller.wantSkillTest.value.isNotEmpty
                                    ? controller.wantSkillTest.value
                                    : null,
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
                                  controller.wantSkillTest.value = value!;
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
