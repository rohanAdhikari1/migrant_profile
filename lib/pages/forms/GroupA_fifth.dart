import 'package:migrant_profile/controllers/groupa_fifth_form_controllrt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupaFifth extends StatefulWidget {
  const GroupaFifth({super.key});

  @override
  State<GroupaFifth> createState() => _GroupaFifthState();
}

class _GroupaFifthState extends State<GroupaFifth> {

  @override
  Widget build(BuildContext context) {
    final GroupaFifthFormController controller = Get.put(
        GroupaFifthFormController());

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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'यदि वैदेशिक रोजगार कै कारण दोश्रो विवाह गरेको भए कसले गरेको छ ?',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Obx(() {
                                  return DropdownButtonFormField<String>(
                                    value: controller.secondMarriageGender.value
                                        .isNotEmpty ? controller
                                        .secondMarriageGender.value : null,
                                    hint: Text('दोस्रो विवाह ... हो ?'),
                                    items: [
                                      DropdownMenuItem(
                                        value: 'male',
                                        child: Text('पुरुष'.tr),
                                      ),
                                      DropdownMenuItem(
                                        value: 'female',
                                        child: Text('महिला'.tr),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      controller.secondMarriageGender.value =
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
                                          vertical: 16, horizontal: 12),
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
                                        "वैदेशिक रोजगार कै कारण ६० वर्ष माथिको वृद्ध वृद्धा मात्र घरमा बस्नु परेको छ ?",
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
                                    value: controller.isElderAloneOnHome.value
                                        .isNotEmpty ? controller
                                        .isElderAloneOnHome.value : null,
                                    hint: Text(
                                        "साठी वर्ष ... बसेका छन्?"),
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
                                      controller.isElderAloneOnHome.value =
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
                                        "छोरा छोरि वोडिङ स्कूल पढउनुको लागि सदरमुकाम वा अन्य सहरमा पठाएका वा गएका छन् ?",
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
                                    value: controller.isChildrenOutForStudy
                                        .value.isNotEmpty ? controller
                                        .isChildrenOutForStudy.value : null,
                                    hint: Text(
                                        "छोरा छोरि वोडिङ स्कूल ... छन्?"),
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
                                      controller.isChildrenOutForStudy.value =
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
                            Obx(() {
                              return controller.isChildrenOutForStudy.value=='1'?
                                Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "छोरा छोरि वोडिङ स्कूलमा पढउनुको लागि सदरमुकाम वा अन्य सहरमा पठाएका छन् भने छोरा कि छोरि पठाएका छन् ?",
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
                                    DropdownButtonFormField<String>(
                                      value: controller.childrenOutForStudy
                                          .value.isNotEmpty ? controller
                                          .childrenOutForStudy.value : null,
                                      hint: Text(
                                          "छोरा छोरि वोडिङ स्कूल ... छन्?"),
                                      items: [
                                        DropdownMenuItem(
                                          value: 'छोरा पढाउन',
                                          child: Text('छोरा पढाउन'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'छोरी पढाउन',
                                          child: Text('छोरी पढाउन'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'छोरा छोरी दुबै पढाउन',
                                          child: Text('छोरा छोरी दुबै पढाउन'),
                                        ),
                                      ],
                                      onChanged: (value) {
                                        controller.childrenOutForStudy.value =
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
                                    )
                                  ],
                                ):SizedBox();
                            }),

                            Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "गत १ वर्षमा पैसा घरमा पठाउनु भयो ?",
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
                                    value: controller.isAmountSend.value.isNotEmpty ? controller
                                        .isAmountSend.value : null,
                                    hint: Text(
                                        "गत १ वर्षमा कति पैसा घरमा पठाउनु भयो ?"),
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
                                      controller.isAmountSend.value =
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
                            Obx(() {
                              return controller.isAmountSend.value=='0'?
                              Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "यदी छैन भने किन?",
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
                                  DropdownButtonFormField<String>(
                                    value: controller.amountNotSendReason
                                        .value.isNotEmpty ? controller
                                        .amountNotSendReason.value : null,
                                    hint: Text(
                                        "किन?"),
                                    items: [
                                      DropdownMenuItem(
                                        value: 'गएको १ वर्ष नपुगेकोले',
                                        child: Text('गएको १ वर्ष नपुगेकोले'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'विदेशमाकाम नपाएको वा कमाइ नभएकोले',
                                        child: Text('विदेशमाकाम नपाएको वा कमाइ नभएकोले'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'विदेशमाअन्य कुनै समस्यामा भएकोले (अलपत्र, सम्पर्क बिहीन, जेल, विरामी…. )',
                                        child: Text('विदेशमाअन्य कुनै समस्यामा भएकोले (अलपत्र, सम्पर्क बिहीन, जेल, विरामी…. )',softWrap: true),
                                      ),
                                      DropdownMenuItem(
                                        value: 'घरमापैसा आवश्यक नभएकोले',
                                        child: Text('विदेशमाकाम नपाएको वा कमाइ नभएकोले'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'अन्य',
                                        child: Text('अन्य	'),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      controller.amountNotSendReason.value =
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
                                  )
                                ],
                              ):SizedBox();
                            }),

                            Obx(() {
                              return controller.isAmountSend.value=='1'?
                              Column(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "वगत १ वर्षमा कति पटक पठाउनु भयो ?",
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
                                      DropdownButtonFormField<String>(
                                        value: controller.remittanceCount
                                            .value.isNotEmpty ? controller
                                            .remittanceCount.value : null,
                                        hint: Text(
                                            "किन?"),
                                        items: [
                                          DropdownMenuItem(
                                            value: '१ पटक',
                                            child: Text('१ पटक'),
                                          ),
                                          DropdownMenuItem(
                                            value: '२ पटक',
                                            child: Text('२ पटक'),
                                          ),
                                          DropdownMenuItem(
                                            value: '३ पटक',
                                            child: Text('३ पटक'),
                                          ),
                                          DropdownMenuItem(
                                            value: '४ पटक',
                                            child: Text('४ पटक'),
                                          ),
                                          DropdownMenuItem(
                                            value: '५ वा सो भन्दा बढि पटक',
                                            child: Text('५ वा सो भन्दा बढि पटक'),
                                          ),
                                        ],
                                        onChanged: (value) {
                                          controller.remittanceCount.value =
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
                                              "गत १ वर्षमा कति पैसा पठाउनु भयो ?",
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
                                      TextFormField(
                                        controller: controller
                                            .remittanceAmountController,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.blue[50],
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(12),
                                            borderSide: BorderSide.none,
                                          ),
                                          hintText: 'कति?',
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 16, horizontal: 12),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'required'.tr;
                                          }
                                          return null;
                                        },
                                      )
                                    ],
                                  ),
                                ],
                              ):SizedBox();
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
