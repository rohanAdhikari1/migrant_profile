import 'package:survey/controllers/database_sync_controller.dart';
import 'package:survey/models/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SyncItemWidget extends StatelessWidget {
  final DataModel listItem;
  final DatabaseSyncController controller = Get.find();

  SyncItemWidget({super.key, required this.listItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Obx(
                          () => Checkbox(
                            value: controller.selectedItems.contains(listItem.id),
                            onChanged: (value) {
                              if (value != null && !controller.isLoading.value) {
                                controller.toggleSelection(listItem.id);
                              }},
                            activeColor: Colors.blue[800],
                            splashRadius: 15,
                      ),
                    ),
                    Text(
                      "नम्बर:",
                      style: TextStyle(color: Colors.blue[800], fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      listItem.number??'-',
                      style: TextStyle(color: Colors.blue[800], fontSize: 16),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  padding: EdgeInsets.only(top: 8, bottom: 3),
                  child: Row(
                    children: [
                      Text(
                        "नाम:",
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        listItem.name??'-',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                  child: Row(
                    children: [
                      Text(
                        "ठेगाना:",
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                       listItem.migratedCountry??'-',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                  child: Row(
                    children: [
                      Text(
                        "िवरण संकलन प्रकार:",
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        listItem.type=='curent'?'वैदेशिक रोजगारमा रहेका':'वैदेशिक रोजगारबाट फर्केका',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                  child: Row(
                    children: [
                      Text(
                        "जातजाति:",
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        listItem.caste??'-',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Obx(()=>
            controller.isLoading.value && controller.selectedItems.contains(listItem.id) ?
            controller.syncItems.contains(listItem.id)?Icon(Icons.cloud_done):Icon(Icons.sync)
                : SizedBox.shrink())
          ],
        ),
      ),
    );
  }
}
