import 'package:survey/controllers/groupb_third_form_controllrt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupbThird extends StatefulWidget {
  const GroupbThird({super.key});

  @override
  State<GroupbThird> createState() => _GroupbThirdState();
}

class _GroupbThirdState extends State<GroupbThird> {

  @override
  Widget build(BuildContext context) {
    final GroupbThirdFormController controller = Get.put(
        GroupbThirdFormController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'वैदेशिक रोजगारबाट फर्केका व्यक्तिहरु सँग सम्बन्धी विवरण',
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
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    "विदेशको कमाई/पैसा के के मा लगानी गर्नु भयो ?",
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
                                                  .selectedRemittanceSpendSource
                                                  .contains(
                                                  'घर खर्च तथा खानपान'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    controller
                                                        .selectedRemittanceSpendSource,
                                                    'घर खर्च तथा खानपान');
                                              },
                                            ),
                                            Text('घर खर्च तथा खानपान'),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              value: controller
                                                  .selectedRemittanceSpendSource
                                                  .contains(
                                                  'बचत'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    controller
                                                        .selectedRemittanceSpendSource,
                                                    'बचत');
                                              },
                                            ),
                                            Text('बचत'),
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
                                                  .selectedRemittanceSpendSource
                                                  .contains(
                                                  'ऋण तिर्न'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    controller
                                                        .selectedRemittanceSpendSource,
                                                    'ऋण तिर्न');
                                              },
                                            ),
                                            Text('ऋण तिर्न'),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              value: controller
                                                  .selectedRemittanceSpendSource
                                                  .contains(
                                                  'जग्गा खरिदमा'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    controller
                                                        .selectedRemittanceSpendSource,
                                                    'जग्गा खरिदमा');
                                              },
                                            ),
                                            Text('जग्गा खरिदमा'),
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
                                                  .selectedRemittanceSpendSource
                                                  .contains(
                                                  'घर बनाउनमा'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    controller
                                                        .selectedRemittanceSpendSource,
                                                    'घर बनाउनमा');
                                              },
                                            ),
                                            Text('घर बनाउनमा'),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              value: controller
                                                  .selectedRemittanceSpendSource
                                                  .contains(
                                                  'शिक्षामा'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    controller
                                                        .selectedRemittanceSpendSource,
                                                    'शिक्षामा');
                                              },
                                            ),
                                            Text('शिक्षामा'),
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
                                                  .selectedRemittanceSpendSource
                                                  .contains(
                                                  'ऋण लगानी'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    controller
                                                        .selectedRemittanceSpendSource,
                                                    'ऋण लगानी');
                                              },
                                            ),
                                            Text('ऋण लगानी'),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              value: controller
                                                  .selectedRemittanceSpendSource
                                                  .contains(
                                                  'व्यवसाय सुरुवात'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    controller
                                                        .selectedRemittanceSpendSource,
                                                    'व्यवसाय सुरुवात');
                                              },
                                            ),
                                            Text('व्यवसाय सुरुवात'),
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
                                                  .selectedRemittanceSpendSource
                                                  .contains(
                                                  'स्वास्थ्य तथा औषधि उपचार खर्च'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    controller
                                                        .selectedRemittanceSpendSource,
                                                    'स्वास्थ्य तथा औषधि उपचार खर्च');
                                              },
                                            ),
                                            Text(
                                                'स्वास्थ्य तथा औषधि उपचार खर्च'),
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
                          spacing: 10.0,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text("विदेशबाट कति पैसा बचाउनु भएको छ ? ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ],
                            ),
                            TextFormField(
                              controller: controller
                                  .savedForeignIncomeController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.blue[50],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: 'रकम',
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
                          children: [
                            Row(
                              children: [
                                Text(
                                  "कुनै व्यावसाय शुरु गर्ने योजना बनाउनु भएको छ ?",
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
                                hint: Text(
                                    "कुनै व्यावसाय ... भएको छ?"),
                                value: controller.wantToStartBusiness.value
                                    .isNotEmpty ? controller.wantToStartBusiness
                                    .value : null,
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
                                  controller.wantToStartBusiness.value = value!;
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
                                    "छ भने के व्यावसाय शुरु गर्ने योजना छ ?",
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
                                                  .selectedBusinessPlan
                                                  .contains(
                                                  'कुखुरा पालन'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    controller
                                                        .selectedBusinessPlan,
                                                    'कुखुरा पालन');
                                              },
                                            ),
                                            Text('कुखुरा पालन'),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              value: controller
                                                  .selectedBusinessPlan
                                                  .contains(
                                                  'वंगुरपालन'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    controller
                                                        .selectedBusinessPlan,
                                                    'वंगुरपालन');
                                              },
                                            ),
                                            Text('वंगुरपालन'),
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
                                                  .selectedBusinessPlan
                                                  .contains(
                                                  'वाख्रा पालन'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    controller
                                                        .selectedBusinessPlan,
                                                    'वाख्रा पालन');
                                              },
                                            ),
                                            Text('वाख्रा पालन'),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              value: controller
                                                  .selectedBusinessPlan
                                                  .contains(
                                                  'तरकारी खेती'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    controller
                                                        .selectedBusinessPlan,
                                                    'तरकारी खेती');
                                              },
                                            ),
                                            Text('तरकारी खेती'),
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
                                                  .selectedBusinessPlan
                                                  .contains(
                                                  'फलफुल खेती'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    controller
                                                        .selectedBusinessPlan,
                                                    'फलफुल खेती');
                                              },
                                            ),
                                            Text('फलफुल खेती'),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              value: controller
                                                  .selectedBusinessPlan
                                                  .contains(
                                                  'व्यापार'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    controller
                                                        .selectedBusinessPlan,
                                                    'व्यापार');
                                              },
                                            ),
                                            Text('व्यापार'),
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
                                                  .selectedBusinessPlan
                                                  .contains(
                                                  'गाईपालन'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    controller
                                                        .selectedBusinessPlan,
                                                    'गाईपालन');
                                              },
                                            ),
                                            Text('गाईपालन'),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              value: controller
                                                  .selectedBusinessPlan
                                                  .contains(
                                                  'डेरी सचालन'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    controller
                                                        .selectedBusinessPlan,
                                                    'डेरी सचालन');
                                              },
                                            ),
                                            Text('डेरी सचालन'),
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
                                                  .selectedBusinessPlan
                                                  .contains(
                                                  'सरकारी जागीर'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    controller
                                                        .selectedBusinessPlan,
                                                    'सरकारी जागीर');
                                              },
                                            ),
                                            Text('सरकारी जागीर'),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              value: controller
                                                  .selectedBusinessPlan
                                                  .contains(
                                                  'यहि रोजगार गर्ने'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    controller
                                                        .selectedBusinessPlan,
                                                    'यहि रोजगार गर्ने');
                                              },
                                            ),
                                            Text('यहि रोजगार गर्ने'),
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
                                                  .selectedBusinessPlan
                                                  .contains(
                                                  'अन्य'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    controller
                                                        .selectedBusinessPlan,
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
                                  "कुनै व्यावसाय गरिरहनु भएको छ ?",
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
                                value: controller.haveCurrentBusiness.value
                                    .isNotEmpty ? controller.haveCurrentBusiness
                                    .value : null,
                                hint: Text(
                                    "कुनै व्यावसाय गरिरहनु भएको छ ?"),
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
                                  controller.haveCurrentBusiness.value = value!;
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
                                    "छ भने के व्यावसाय गरिरहनु भएको छ ?",
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
                                                  .selectedCurrentBusiness
                                                  .contains(
                                                  'कुखुरा पालन'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    controller
                                                        .selectedCurrentBusiness,
                                                    'कुखुरा पालन');
                                              },
                                            ),
                                            Text('कुखुरा पालन'),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              value: controller
                                                  .selectedCurrentBusiness
                                                  .contains(
                                                  'वंगुरपालन'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    controller
                                                        .selectedCurrentBusiness,
                                                    'वंगुरपालन');
                                              },
                                            ),
                                            Text('वंगुरपालन'),
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
                                                  .selectedCurrentBusiness
                                                  .contains(
                                                  'वाख्रा पालन'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    controller
                                                        .selectedCurrentBusiness,
                                                    'वाख्रा पालन');
                                              },
                                            ),
                                            Text('वाख्रा पालन'),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              value: controller
                                                  .selectedCurrentBusiness
                                                  .contains(
                                                  'तरकारी खेती'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    controller
                                                        .selectedCurrentBusiness,
                                                    'तरकारी खेती');
                                              },
                                            ),
                                            Text('तरकारी खेती'),
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
                                                  .selectedCurrentBusiness
                                                  .contains(
                                                  'फलफुल खेती'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    controller
                                                        .selectedCurrentBusiness,
                                                    'फलफुल खेती');
                                              },
                                            ),
                                            Text('फलफुल खेती'),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              value: controller
                                                  .selectedCurrentBusiness
                                                  .contains(
                                                  'व्यापार'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    controller
                                                        .selectedCurrentBusiness,
                                                    'व्यापार');
                                              },
                                            ),
                                            Text('व्यापार'),
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
                                                  .selectedCurrentBusiness
                                                  .contains(
                                                  'गाईपालन'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    controller
                                                        .selectedCurrentBusiness,
                                                    'गाईपालन');
                                              },
                                            ),
                                            Text('गाईपालन'),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              value: controller
                                                  .selectedCurrentBusiness
                                                  .contains(
                                                  'डेरी सचालन'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    controller
                                                        .selectedCurrentBusiness,
                                                    'डेरी सचालन');
                                              },
                                            ),
                                            Text('डेरी सचालन'),
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
                                                  .selectedCurrentBusiness
                                                  .contains(
                                                  'सरकारी जागीर'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    controller
                                                        .selectedCurrentBusiness,
                                                    'सरकारी जागीर');
                                              },
                                            ),
                                            Text('सरकारी जागीर'),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              value: controller
                                                  .selectedCurrentBusiness
                                                  .contains(
                                                  'अन्य'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    controller
                                                        .selectedCurrentBusiness,
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
