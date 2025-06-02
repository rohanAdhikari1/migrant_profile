import 'package:survey/controllers/groupb_first_form_controllrt.dart';
import 'package:survey/pages/forms/GroupB_second.dart';
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
                                  value: controller.selectedCaste.value
                                      .isNotEmpty ? controller.selectedCaste
                                      .value : null,
                                  hint: Text("जातजाति"),
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
                          controller: controller.returnFemaleCount,
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "कुन देशबाट फर्किएको हो ?",
                              style: TextStyle(fontWeight: FontWeight.bold),
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
                                    "के कारण ले फर्किनु भयो ?",
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
                                      value: 'सम्झौता सकिएर ',
                                      child: Text('सम्झौता सकिएर '),
                                    ),
                                    DropdownMenuItem(
                                      value: 'कोरोनाले गर्दा कम्पनी ले करार अवधी नसकी नै पठाएर ',
                                      child: Text(
                                          'कोरोनाले गर्दा कम्पनी ले करार अवधी नसकी नै पठाएर '),
                                    ),
                                    DropdownMenuItem(
                                      value: 'कोरोनाले गर्दा राजिनामा दिएर सुरक्षित हुन र परिवारसँग रहन',
                                      child: Text(
                                          'कोरोनाले गर्दा राजिनामा दिएर सुरक्षित हुन र परिवारसँग रहन'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'कम्पनि टुटेर',
                                      child: Text('कम्पनि टुटेर'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'कोरोना बाहेक अन्य स्वास्थ्य समस्या भएर',
                                      child: Text(
                                          'कोरोना बाहेक अन्य स्वास्थ्य समस्या भएर'),
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
