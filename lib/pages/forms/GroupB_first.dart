import 'package:migrant_profile/controllers/groupb_first_form_controllrt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupbFirst extends StatefulWidget {
  const GroupbFirst({super.key});

  @override
  State<GroupbFirst> createState() => _GroupbFirstState();
}

class _GroupbFirstState extends State<GroupbFirst> {
  @override
  Widget build(BuildContext context) {
    final GroupbFirstFormController controller = Get.put(
        GroupbFirstFormController());
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
                          spacing: 10.0,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                        "वैदेशिक रोजगारबाट फर्केको व्यक्तिको नाम",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Text("*",
                                        style: TextStyle(
                                          color: Colors.red,
                                        ))
                                  ],
                                ),
                              ],
                            ),
                            TextFormField(
                              controller: controller.nameController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.blue[50],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: 'व्यक्तिको नाम',
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
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "${'gender'.tr} :",
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
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
                                  value: controller.selectedGender.value
                                      .isNotEmpty ? controller.selectedGender
                                      .value : null,
                                  hint: Text("${'gender'.tr} :"),
                                  items: [
                                    DropdownMenuItem(
                                      value: 'male',
                                      child: Text('पुरुष'.tr),
                                    ),
                                    DropdownMenuItem(
                                      value: 'female',
                                      child: Text('महिला'.tr),
                                    ),
                                    DropdownMenuItem(
                                      value: 'others',
                                      child: Text('अन्य'.tr),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    controller.selectedGender.value = value!;
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
                                      return '${'gender'.tr} ${'required'.tr}';
                                    }
                                    return null;
                                  },
                                );
                              }),
                            ],
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "उमेर",
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "*",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ],
                              ),
                              // SizedBox(height: 2),
                              TextFormField(
                                controller: controller.ageController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.blue[50],
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: 'उमेर',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 12),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'required'.tr;
                                  }
                                  if (value.length >3 ) {
                                    return 'Invalid Format'.tr;
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10.0,
                      children: [
                        Text("${'phone'.tr} :",style: TextStyle(fontWeight: FontWeight.bold)),
                        TextFormField(
                          controller: controller.phoneController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blue[50],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'phone'.tr,
                            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return  '${'phone'.tr} ${'required'.tr}';
                            }
                            if (value.length != 10) {
                              return  '${'phone'.tr} ${'invalid'.tr}';
                            }
                            return null;
                          },
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "घरमुलीसँगको नाता",
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
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
                                  hint: Text("घरमुलीसँगको नाता"),
                                  value: controller.selectedRelation.value
                                      .isNotEmpty ? controller.selectedRelation
                                      .value : null,
                                  items: [
                                    DropdownMenuItem(
                                      value: 'बाबु',
                                      child: Text('बाबु'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'आमा',
                                      child: Text('आमा'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'हजुरबा',
                                      child: Text('हजुरबा'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'हजुरआमा',
                                      child: Text('हजुरआमा'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'छोरा',
                                      child: Text('छोरा'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'छोरी',
                                      child: Text('छोरी'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'बुहारी',
                                      child: Text('बुहारी'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'श्रीमान',
                                      child: Text('श्रीमान'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'श्रीमति',
                                      child: Text('श्रीमति'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'दाजु',
                                      child: Text('दाजु'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'भाउजु',
                                      child: Text('भाउजु'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'भाइ',
                                      child: Text('भाइ'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'दिदी',
                                      child: Text('दिदी'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'बहिनी',
                                      child: Text('बहिनी'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'सासु',
                                      child: Text('सासु'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'ससुरा',
                                      child: Text('ससुरा'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'नाती',
                                      child: Text('नाती'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'नातीनी',
                                      child: Text('नातीनी'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'अन्य',
                                      child: Text('अन्य'),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    controller.selectedRelation.value = value!;
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
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "वैवाहिक अवस्था",
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "*",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ],
                              ),
                              // SizedBox(height: 2),
                              SizedBox(height: 4),
                              Obx(() {
                                return DropdownButtonFormField<String>(
                                  value: controller.maritalStatus.value
                                      .isNotEmpty
                                      ? controller.maritalStatus.value
                                      : null,
                                  hint: Text("वैवाहिक अवस्था"),
                                  items: [
                                    DropdownMenuItem(
                                      value: 'विवाहित',
                                      child: Text('विवाहित'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'अविवाहित',
                                      child: Text('अविवाहित'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'विधवा',
                                      child: Text('विधवा'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'विधुर',
                                      child: Text('विधुर'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'छुटिएको',
                                      child: Text('छुटिएको'),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    controller.maritalStatus.value = value!;
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
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "शैक्षिकबिवरण",
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
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
                                  hint: Text("शैक्षिकबिवरण"),
                                  value: controller.selectedEducation.value
                                      .isNotEmpty ? controller.selectedEducation
                                      .value : null,
                                  items: [
                                    DropdownMenuItem(
                                      value: 'निराक्षर',
                                      child: Text('निराक्षर'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'साक्षर',
                                      child: Text('साक्षर'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'वाल कक्षा (कक्षा १ भन्दा मुनि)',
                                      child: Text('वाल कक्षा'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'प्रावि',
                                      child: Text('प्रावि'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'निमावि',
                                      child: Text('निमावि'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'मावि',
                                      child: Text('मावि'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'एस. इ. इ.',
                                      child: Text('एस. इ. इ.'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'उमावि',
                                      child: Text('उमावि'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'स्नातक',
                                      child: Text('स्नातक'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'स्नातकोत्तर',
                                      child: Text('स्नातकोत्तर'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'विद्यावारिधि',
                                      child: Text('विद्यावारिधि'),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    controller.selectedEducation.value = value!;
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
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "फर्केर आएको देश",
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "*",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ],
                              ),
                              // SizedBox(height: 2),
                              SizedBox(height: 4),
                              Obx(() {
                                return DropdownButtonFormField<String>(
                                  value: controller.selectedCountry.value
                                      .isNotEmpty
                                      ? controller.selectedCountry.value
                                      : null,
                                  hint: Text("फर्केर आएको देश"),
                                  items: [
                                    DropdownMenuItem(
                                      value: 'साउदी अरेबिया',
                                      child: Text('साउदी अरेबिया'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'कतार',
                                      child: Text('कतार'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'यु.ए.ई./दुवई',
                                      child: Text('यु.ए.ई./दुवई'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'कुवेत',
                                      child: Text('कुवेत'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'बहराईन',
                                      child: Text('बहराईन'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'ओमन',
                                      child: Text('ओमन'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'जोर्डन',
                                      child: Text('जोर्डन'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'जापान',
                                      child: Text('जापान'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'भारत',
                                      child: Text('भारत'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'कोरिया',
                                      child: Text('कोरिया'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'अमेरिका',
                                      child: Text('अमेरिका'),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    controller.selectedCountry.value = value!;
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
                        ),
                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10.0,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "तपाईको परिवारबाट कति जना वैदेशिक रोजगारबाट फर्केका छन् ?",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              "*",
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            TextFormField(
                              controller: controller.returnMaleCount,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.blue[50],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      12), // Rounded corners
                                  borderSide: BorderSide.none,
                                ),
                                hintText: 'पुरुष'.tr,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 12),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'required'.tr;
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: controller.returnFeMaleCount,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blue[50],
                            border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(12), // Rounded corners
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'महिला'.tr,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 12),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'required'.tr;
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "कति समयमा फर्किनु भयो ?",
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "*",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ],
                              ),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                controller: controller.returnTimeController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.blue[50],
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        12), // Rounded corners
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: 'समय',
                                  // hintStyle: TextStyle(fontSize: 13),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 12),
                                ),
                                // style: TextStyle(fontSize: 10),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'required'.tr;
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 15, height: 20,),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "अवधि",
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "*",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ],
                              ),
                              // SizedBox(height: 2),
                              // SizedBox(height: 10),
                              Obx(() {
                                return DropdownButtonFormField<String>(
                                  value: controller.returnTimeDuration.value
                                      .isNotEmpty ? controller
                                      .returnTimeDuration
                                      .value : null,
                                  items: [
                                    DropdownMenuItem(
                                      value: 'दिन',
                                      child: Text('दिन'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'महिना',
                                      child: Text('महिना'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'बर्ष',
                                      child: Text('बर्ष'),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    controller.returnTimeDuration.value =
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
                        ),
                      ],
                    ),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "के कारणले वैदेशिक रोजगारबाट फर्केर आउनु भयो?",
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
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
                                  value: controller.returnReason.value
                                      .isNotEmpty
                                      ? controller.returnReason.value
                                      : null,
                                  hint: Text("के कारण ले फर्किनु भयो ?"),
                                  items: [
                                    DropdownMenuItem(
                                      value: 'सम्झौता अवधि सकिएर',
                                      child: Text('सम्झौता अवधि सकिएर'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'कम्पनी बन्द भएर',
                                      child: Text('कम्पनी बन्द भएर'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'मेडिकल फेल भएर',
                                      child: Text('मेडिकल फेल भएर'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'कोरोना महामारीका कारण',
                                      child: Text('कोरोना महामारीका कारण'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'आफ्नो स्वास्थ्य समस्याका कारण',
                                      child: Text('आफ्नो स्वास्थ्य समस्याका कारण'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'घरायसी समस्याका कारण',
                                      child: Text('घरायसी समस्याका कारण'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'अन्य',
                                      child: Text('अन्य'),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    controller.returnReason.value = value!;
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
