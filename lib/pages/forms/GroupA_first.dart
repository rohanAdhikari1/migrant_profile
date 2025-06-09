import 'package:migrant_profile/controllers/groupa_first_form_controllrt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupaFirst extends StatefulWidget {
  const GroupaFirst({super.key});

  @override
  State<GroupaFirst> createState() => _GroupaFirstState();
}

class _GroupaFirstState extends State<GroupaFirst> {
  @override
  Widget build(BuildContext context) {
    final GroupaFirstFormController controller = Get.put(
        GroupaFirstFormController());

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
                                    Text("वैदेशिक रोजगारमा जाने व्यक्तिको नाम",
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
                                  hint: Text("${'gender'.tr} :"),
                                  value: controller.selectedGender.value
                                      .isNotEmpty ? controller.selectedGender
                                      .value : null,
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
                                      return '${'farmer_gender'.tr} ${'required'
                                          .tr}';
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

                    Column(
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
                            hint: Text("वैवाहिक अवस्था"),
                            value: controller.maritalStatus.value
                                .isNotEmpty ? controller.maritalStatus
                                .value : null,
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
                                value: 'बहुविवाह',
                                child: Text('बहुविवाह'),
                              ),
                              DropdownMenuItem(
                                value: 'एकल महिला',
                                child: Text('एकल महिला'),
                              ),
                              DropdownMenuItem(
                                value: 'एकल पुरुष',
                                child: Text('एकल पुरुष'),
                              ),
                              DropdownMenuItem(
                                value: 'सम्बन्ध विच्छेद',
                                child: Text('सम्बन्ध विच्छेद'),
                              ),
                              DropdownMenuItem(
                                value: 'विवाह भएको तर छुट्टिएको',
                                child: Text('विवाह भएको तर छुट्टिएको'),
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

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "शैक्षिक बिवरण",
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
                            hint: Text("शैक्षिक बिवरण"),
                            value: controller.educationStatus.value
                                .isNotEmpty ? controller.educationStatus
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
                                child: Text('वाल कक्षा (कक्षा १ भन्दा मुनि)'),
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
                              controller.educationStatus.value = value!;
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
                              "हाल गएको देश ?",
                              style:
                              TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "*",
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                        SizedBox(height: 3),
                        Obx(() {
                          return DropdownButtonFormField<String>(
                            hint: Text("हाल गएको देश ?"),
                            value: controller.selectedCountry.value
                                .isNotEmpty ? controller.selectedCountry
                                .value : null,
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
                              DropdownMenuItem(
                                value: 'बेलायत',
                                child: Text('बेलायत'),
                              ),
                              DropdownMenuItem(
                                value: 'अन्य (अन्य देश)',
                                child: Text('अन्य (अन्य देश)'),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "अहिले वैदेशिक रोजगारमा गएको कति ‌औं पटक हो ?",
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
                        Obx(() {
                          return DropdownButtonFormField<String>(
                            hint: Text("गएको पटक"),
                            value: controller.migratedTimes.value
                                .isNotEmpty ? controller.migratedTimes
                                .value : null,
                            items: [
                              DropdownMenuItem(
                                value: 'पहिलो पटक',
                                child: Text('पहिलो पटक'),
                              ),
                              DropdownMenuItem(
                                value: 'दोश्रो पटक',
                                child: Text('दोश्रो पटक'),
                              ),
                              DropdownMenuItem(
                                value: 'तेस्रो पटक',
                                child: Text('तेस्रो पटक'),
                              ),
                              DropdownMenuItem(
                                value: 'चौथो वा सो भन्दा बढि',
                                child: Text('चौथो वा सो भन्दा बढि'),
                              ),
                            ],
                            onChanged: (value) {
                              controller.migratedTimes.value = value!;
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
