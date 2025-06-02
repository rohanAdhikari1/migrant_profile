import 'package:survey/controllers/groupa_sixth_form_controllrt.dart';
import 'package:survey/pages/forms/location_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupaSixth extends StatefulWidget {
  const GroupaSixth({super.key});

  @override
  State<GroupaSixth> createState() => _GroupaSixthState();
}

class _GroupaSixthState extends State<GroupaSixth> {

  @override
  Widget build(BuildContext context) {
    final GroupaSixthFormController controller = Get.put(
        GroupaSixthFormController());
    final _remittanceSpend = [
      'घर खर्च तथा खानपान',
      'बचत',
      'ऋण तिर्न',
      'जग्गा खरिदमा',
      'घर बनाउनमा',
      'शिक्षामा',
      'ऋण लगानी',
      'व्यवसाय सुरुवात',
      'स्वास्थ्य तथा औषधि उपचार खर्च',
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
                                  children: [
                                    Expanded(
                                      child: Text(
                                          "उक्त विदेशवाट पठाएको रकम के के मा खर्च गर्नु भयो ? (यस प्रस्न र यस भन्दा तल खर्चको शीर्षकमा वढी अर्थात आवश्यक समय लगाएर कापीमा टिपोट गरेर मात्र भर्ने)",
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
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: _remittanceSpend.map((option) {
                                      return Row(
                                        children: [
                                          Expanded(
                                            child: Row(
                                              children: [
                                                Checkbox(
                                                  value: controller
                                                      .selectedRemittanceSpend
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
                            Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "वचत गर्नु भएको छ भने कहाँ गर्नु भएको छ ?",
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
                                    value: controller.remittanceSavedSource
                                        .value
                                        .isNotEmpty ? controller
                                        .remittanceSavedSource.value : null,
                                    hint: Text(
                                        "वचत गर्नु भएको छ भने कहाँ गर्नु भएको छ ?"),
                                    items: [
                                      DropdownMenuItem(
                                        value: 'सहकारी',
                                        child: Text('सहकारी'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'स्थानीय समूहमा',
                                        child: Text('स्थानीय समूहमा'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'बैंकमा',
                                        child: Text('बैंकमा'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'फाइनान्समा',
                                        child: Text('फाइनान्समा'),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      controller.remittanceSavedSource.value =
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "विदेशवाट फर्केपछि के गर्ने योजना छ ?",
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
                                    isExpanded: true,
                                    value: controller.planAfterReturn.value
                                        .isNotEmpty ? controller.planAfterReturn
                                        .value : null,
                                    hint: Text(
                                        "विदेशवाट फर्केपछि के गर्ने योजना छ ?"),
                                    items: [
                                      DropdownMenuItem(
                                        value:
                                        'विदेशमा प्राप्त गरेको क्षमता अनुसार आफ्नै व्यावसाय गर्छु',
                                        child: Text(
                                            'विदेशमा प्राप्त गरेको क्षमता अनुसार आफ्नै व्यावसाय गर्छु'),
                                      ),
                                      DropdownMenuItem(
                                        value:
                                        'विदेशमा प्राप्त गरेको काम भन्दा फरक क्षेत्रमा भए पनि  व्यावसाय गर्छु',
                                        child: Text(
                                            'विदेशमा प्राप्त गरेको काम भन्दा फरक क्षेत्रमा भए पनि  व्यावसाय गर्छु'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'विदेशको अनुभवमा जागिर गर्छु',
                                        child:
                                        Text('विदेशको अनुभवमा जागिर गर्छु'),
                                      ),
                                      DropdownMenuItem(
                                        value:
                                        'मेरो विदेशको अनुभव भन्दा फरक क्षेत्रमा जागिर गर्छु',
                                        child: Text(
                                            'मेरो विदेशको अनुभव भन्दा फरक क्षेत्रमा जागिर गर्छु'),
                                      ),
                                      DropdownMenuItem(
                                        value:
                                        'स्थानीय सरकारले प्रदान गर्ने रोजगारमा काम गर्छु',
                                        child: Text(
                                            'स्थानीय सरकारले प्रदान गर्ने रोजगारमा काम गर्छु'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'सरकारी जागिरको लागि प्रयास गर्ने',
                                        child: Text(
                                            'सरकारी जागिरको लागि प्रयास गर्ने'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'अहिले सम्म कुनै योजना छैन',
                                        child: Text(
                                            'अहिले सम्म कुनै योजना छैन'),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      controller.planAfterReturn.value = value!;
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
                                        "विदेशको कमाइले तपाई अथवा तपाईको श्रीमान, छोरा, छोरीले घडेरी किन्नु भएको छ?",
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
                                    value: controller.landFromRemittance.value
                                        .isNotEmpty ? controller
                                        .landFromRemittance.value : null,
                                    hint: Text(
                                        "विदेशको ... किन्नु भएको छ?"),
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
                                      controller.landFromRemittance.value =
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
                                        "विदेशको कमाइले घडेरी किन्नु भएको छ भने कहाँ किन्नु भएको छ?",
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
                                    value: controller.landFromRemittanceLocation
                                        .value.isNotEmpty
                                        ? controller
                                        .landFromRemittanceLocation.value
                                        : null,
                                    hint: Text("विदेशको ... भएको छ?"),
                                    items: [
                                      DropdownMenuItem(
                                        value: 'पालिका क्षेत्रमा',
                                        child: Text('पालिका क्षेत्रमा'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'घर नजिकै शहरमा',
                                        child: Text('घर नजिकै शहरमा'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'सदरमुकाम भएको शहरमा',
                                        child: Text('सदरमुकाम भएको शहरमा'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'प्रदेश कार्यालय भएको शहरमा',
                                        child: Text(
                                            'प्रदेश कार्यालय भएको शहरमा'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'काठमान्डौमा',
                                        child: Text('काठमान्डौमा'),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      controller.landFromRemittanceLocation
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
                                          "वसाइ सरेर जाने योजना छ ? छ भने कहाँ ?",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
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
                                    value: controller.migrationPlanLocation
                                        .value
                                        .isNotEmpty ? controller
                                        .migrationPlanLocation.value : null,
                                    hint: Text(" कहाँ ?"),
                                    items: [
                                      DropdownMenuItem(
                                        value: 'बसाई सरेर जाने योजना छैन',
                                        child: Text('बसाई सरेर जाने योजना छैन'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'पालिका क्षेत्रमा',
                                        child: Text('पालिका क्षेत्रमा'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'घर नजिकै शहरमा',
                                        child: Text('घर नजिकै शहरमा'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'सदरमुकाम भएको शहरमा',
                                        child: Text('सदरमुकाम भएको शहरमा'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'प्रदेश कार्यालय भएको शहरमा',
                                        child: Text(
                                            'प्रदेश कार्यालय भएको शहरमा'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'काठमान्डौमा',
                                        child: Text('काठमान्डौमा'),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      controller.migrationPlanLocation.value =
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
