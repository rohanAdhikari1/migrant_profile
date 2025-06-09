import 'package:migrant_profile/controllers/draft_controller.dart';
import 'package:migrant_profile/widgets/data_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Drafts extends StatefulWidget {
  const Drafts({super.key});

  @override
  State<Drafts> createState() => _DraftsState();
}

class _DraftsState extends State<Drafts> {
  DraftController controller = Get.put(DraftController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("आंशिक डाटा", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[800],
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: SafeArea(child:
      Container(
        color: Colors.grey[300],
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Obx(() {
          return ListView.builder(
            itemCount: controller.records.length,
            itemBuilder: (context, index) {
              return DataItemWidget(listItem: controller.records[index],reFetch: controller.fetchFarmersRecords,isComplete: false);
            },
          );
        }),
      )),
    );
  }
}
