import 'package:survey/controllers/groupa_first_form_controllrt.dart';
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
                                    "जातजाति",
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
                                  hint: Text("जातजाति"),
                                  value: controller.selectedCaste.value
                                      .isNotEmpty ? controller.selectedCaste
                                      .value : null,
                                  items: [
                                    DropdownMenuItem(
                                      value: 'पहाडी',
                                      child: Text('पहाडी'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'मधेशी',
                                      child: Text('मधेशी'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'अन्य',
                                      child: Text('अन्य'),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    controller.selectedCaste.value = value!;
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
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "कुन देशमा कार्यरत हुनुहुन्छ ?",
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
                              TextFormField(
                                controller: controller.countryController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.blue[50],
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: 'देशको नाम',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 13, horizontal: 12),
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
                                    "गएको पटक",
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
                                controller: controller.visitTimeController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.blue[50],
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: 'गएको पटक',
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
                                    Text("विदेशमा के काम गर्दै हुनुहुन्छ ?",
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
                              controller: controller
                                  .foreignOccupationController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.blue[50],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: 'विदेशमा गर्दै गरेको काम ',
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
                                    "हफ्ता वा महिनामा कति पटक फोन सम्पर्क गर्नुहुन्छ ?",
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
                                  hint: Text(
                                      "हफ्ता वा महिनामा ... सम्पर्क गर्नुहुन्छ ?"),
                                  value: controller.contactTimes.value
                                      .isNotEmpty ? controller.contactTimes
                                      .value : null,
                                  items: [
                                    DropdownMenuItem(
                                      value: 'दिनमा एक पटक',
                                      child: Text('दिनमा एक पटक'.tr),
                                    ),
                                    DropdownMenuItem(
                                      value: 'हफ्तामा एक पटक',
                                      child: Text('हफ्तामा एक पटक'.tr),
                                    ),
                                    DropdownMenuItem(
                                      value: 'दुई हफ्तामा एक पटक',
                                      child: Text('दुई हफ्तामा एक पटक'.tr),
                                    ),
                                    DropdownMenuItem(
                                      value: 'महिनामा एक पटक',
                                      child: Text('महिनामा एक पटक'.tr),
                                    ),
                                    DropdownMenuItem(
                                      value: 'एक महिना भन्दा बढीमा',
                                      child: Text('एक महिना भन्दा बढीमा'.tr),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    controller.contactTimes.value = value!;
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
