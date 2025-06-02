import 'package:survey/controllers/complete_controller.dart';
import 'package:survey/widgets/data_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteData extends StatefulWidget {
  const CompleteData({super.key});

  @override
  State<CompleteData> createState() => _CompleteDataState();
}

class _CompleteDataState extends State<CompleteData> {
  CompleteController controller = Get.put(CompleteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("पूर्ण डाटा", style: TextStyle(color: Colors.white)),
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
              return DataItemWidget(listItem: controller.records[index],reFetch: controller.fetchFarmersRecords,isComplete: true);
            },
          );
        }),
      )),
    );
  }
}
