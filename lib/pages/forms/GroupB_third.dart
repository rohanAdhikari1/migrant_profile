import 'package:migrant_profile/controllers/groupb_third_form_controllrt.dart';
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
                                    "नयाँ व्यवसाय सञ्चालन गर्न वा नयाँ व्यवसाय सुरु गर्नका लागि कस्ता समस्याहरु छन् ?",
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
                                                  .selectedBusinessProblem
                                                  .contains(
                                                  'घर खर्च तथा खानपान'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    controller
                                                        .selectedBusinessProblem,
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
                                                  .selectedBusinessProblem
                                                  .contains(
                                                  'बचत'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    controller
                                                        .selectedBusinessProblem,
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
                                                  .selectedBusinessProblem
                                                  .contains(
                                                  'ऋण तिर्न'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    controller
                                                        .selectedBusinessProblem,
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
                                                  .selectedBusinessProblem
                                                  .contains(
                                                  'जग्गा खरिदमा'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    controller
                                                        .selectedBusinessProblem,
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
                                                  .selectedBusinessProblem
                                                  .contains(
                                                  'घर बनाउनमा'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    controller
                                                        .selectedBusinessProblem,
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
                                                  .selectedBusinessProblem
                                                  .contains(
                                                  'शिक्षामा'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    controller
                                                        .selectedBusinessProblem,
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
                                                  .selectedBusinessProblem
                                                  .contains(
                                                  'ऋण लगानी'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    controller
                                                        .selectedBusinessProblem,
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
                                                  .selectedBusinessProblem
                                                  .contains(
                                                  'व्यवसाय सुरुवात'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    controller
                                                        .selectedBusinessProblem,
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
                                                  .selectedBusinessProblem
                                                  .contains(
                                                  'स्वास्थ्य तथा औषधि उपचार खर्च'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    controller
                                                        .selectedBusinessProblem,
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
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "नेपालमा नै रहेर कुन क्षेत्रको काम गर्न चाहनु हुन्छ वा के गरी रहनु भएको छ?",
                                    style: TextStyle(fontWeight: FontWeight.bold),
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
                                hint: Text(
                                    "कुनै व्यावसाय ... भएको छ?"),
                                value: controller.desiredWorkArea.value
                                    .isNotEmpty ? controller.desiredWorkArea
                                    .value : null,
                                items: [
                                  DropdownMenuItem(
                                    value: 'जागिर खाने',
                                    child: Text('जागिर खाने'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'कृषि व्यवसाय गर्ने',
                                    child: Text('कृषि व्यवसाय गर्ने'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'व्यापार व्यवसाय सञ्चालन गर्ने',
                                    child: Text('व्यापार व्यवसाय सञ्चालन गर्ने'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'व्यवसायिक कार्य गर्ने (इलेक्ट्रिसियन, प्लम्बर, मिस्त्री …)',
                                    child: Text('व्यवसायिक कार्य गर्ने (इलेक्ट्रिसियन, प्लम्बर, मिस्त्री …)'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'अन्य',
                                    child: Text('अन्य'),
                                  ),
                                ],
                                onChanged: (value) {
                                  controller.desiredWorkArea.value = value!;
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
                                    "नेपालमा नै रोजगार वा स्वरोजगार हुन के के कुराहरु आवश्यक छ?",
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
                                                  .needForEmpOnNepal
                                                  .contains(
                                                  'सिपमुलक तालिम'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    controller
                                                        .needForEmpOnNepal,
                                                    'सिपमुलक तालिम');
                                              },
                                            ),
                                            Text('सिपमुलक तालिम'),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              value: controller
                                                  .needForEmpOnNepal
                                                  .contains(
                                                  'अनुदान सहयोग'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    controller
                                                        .needForEmpOnNepal,
                                                    'अनुदान सहयोग');
                                              },
                                            ),
                                            Text('अनुदान सहयोग'),
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
                                                  .needForEmpOnNepal
                                                  .contains(
                                                  'सहुलियत ऋण'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    controller
                                                        .needForEmpOnNepal,
                                                    'सहुलियत ऋण');
                                              },
                                            ),
                                            Text('सहुलियत ऋण'),
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
                                                  .needForEmpOnNepal
                                                  .contains(
                                                  'सामग्री तथा प्रविधि सहयोग'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    controller
                                                        .needForEmpOnNepal,
                                                    'सामग्री तथा प्रविधि सहयोग');
                                              },
                                            ),
                                            Text('सामग्री तथा प्रविधि सहयोग'),
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
                                                  .needForEmpOnNepal
                                                  .contains(
                                                  'उत्पादित बस्तुको बजारीकरणका लागि सहयोग'),
                                              onChanged: (_) {
                                                controller.toggleSelection(
                                                    controller
                                                        .needForEmpOnNepal,
                                                    'उत्पादित बस्तुको बजारीकरणका लागि सहयोग');
                                              },
                                            ),
                                            Text('उत्पादित बस्तुको बजारीकरणका लागि सहयोग'),
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
