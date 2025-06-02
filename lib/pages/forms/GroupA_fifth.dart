import 'package:survey/controllers/groupa_fifth_form_controllrt.dart';
import 'package:survey/pages/forms/GroupA_sixth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupaFifth extends StatefulWidget {
  const GroupaFifth({super.key});

  @override
  State<GroupaFifth> createState() => _GroupaFifthState();
}

class _GroupaFifthState extends State<GroupaFifth> {
  bool _ismr1selected = false;
  bool _ismr2selected = false;
  bool _ismr3selected = false;
  bool _ismr4selected = false;
  bool _ismr5selected = false;
  bool _ismr6selected = false;

  @override
  Widget build(BuildContext context) {
    final GroupaFifthFormController controller = Get.put(
        GroupaFifthFormController());

    final _remittanceCollectMethod = [
      'सहकारीबाट',
      'आईएमइ सेन्टरबाट',
      'बैंकबाट',
      'फाइनान्स कम्पनिबाट',
      'हुण्डीबाट',
      'साथीभाई बाट',
    ];

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
                                    Text(
                                      'यदि दोस्रो विवाह गरेको भए महिला कि पुरुषले गरेको हो ?',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
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
                                        "साठी वर्ष माथिका वुवा आमा मात्र घरमा एक्लै बसेका छन् ?",
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
                            Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                TextFormField(
                                  controller: controller
                                      .childrenOutForStudyLocationController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.blue[50],
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: 'छोरा छोरि वोडिङ स्कूलमा ... छोरि पठाएका छन् ?',
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 12),
                                  ),
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
                                        "विदेशको मासिक कमाइ कति हुन्छ ?(परिवारलाई थाहा नहुन त्यसैलेप्रस्न नम्बर ३५ र ३६ मा जोड दिनुहोला) ",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                TextFormField(
                                  controller: controller.foreignMonthlyIncome,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.blue[50],
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: 'मसिक तलब',
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 12),
                                  ),
                                  // validator: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return '${'farmer_ward_no'.tr} ${'required'.tr}';
                                  //   }
                                  //   return null;
                                  // },
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                          "विदेशवाट पठाएको रकम कहाँबाट लिनेगर्नु भएको छ ?",
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
                                    children: _remittanceCollectMethod.map((
                                        option) {
                                      return Row(
                                        children: [
                                          Expanded(
                                            child: Row(
                                              children: [
                                                Checkbox(
                                                  value: controller
                                                      .selectedRemittanceCollectMethod
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
                                  children: [
                                    Expanded(
                                      child: Text(
                                          "कोरोनको कारणले खाइपाई आएको तलब सुविधामा केहि परिवर्तन आएको छ ? छ भनेकति फरक भएको छ ?",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                ),
                                Obx(() {
                                  return DropdownButtonFormField<String>(
                                    hint: Text("कोरोनको कारणले ... भएको छ?"),
                                    value: controller.salaryChangedDueToCovid.value.isNotEmpty?controller.salaryChangedDueToCovid.value:null,
                                    items: [
                                      DropdownMenuItem(
                                        value: 'कोरोना पछि तलब नै पठाएको छैन',
                                        child:
                                        Text('कोरोना पछि तलब नै पठाएको छैन'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'पठाएको छ तर ७५% मात्र',
                                        child: Text('पठाएको छ तर ७५% मात्र'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'पठाएको छ तर ५०% मात्र',
                                        child: Text('पठाएको छ तर ५०% मात्र'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'पठाएको छ तर २५% मात्र',
                                        child: Text('पठाएको छ तर २५% मात्र'),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      controller.salaryChangedDueToCovid.value = value!;
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
                                        "विदेश गएको व्यक्तिले पोहोर सालको कति पटक पैसा पठाउनु भयो ?",
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
                                      .previousRemittanceTimesController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.blue[50],
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: 'कति पटक',
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
                            Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "विदेश गएको व्यक्तिले पोहोर सालको जम्मा कति पैसा पठाउनु भयो ? (यस प्रश्नमा आवश्यक समय लगाएर कापीमा टिपोट गरेर मात्र तलको फारममा भर्ने)",
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
                                      .previousRemittanceAmountController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.blue[50],
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: 'कति पटक',
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
