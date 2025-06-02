import 'package:survey/controllers/database_sync_controller.dart';
import 'package:survey/widgets/sync_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class DatabaseSync extends StatefulWidget {
  const DatabaseSync({super.key});

  @override
  State<DatabaseSync> createState() => _DatabaseSyncState();
}

class _DatabaseSyncState extends State<DatabaseSync> {
  final DatabaseSyncController controller = Get.put(DatabaseSyncController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('database_sync'.tr, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[800],
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: SafeArea(child:
      Container(
        color: Colors.grey[300],
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 168,
                  child: Obx(() {
                    return CheckboxListTile(
                      activeColor: Colors.blue[800],
                      value: controller.isAllSelected,
                      onChanged: (value) => controller.toggleSelectAll(),
                      title: Text('Select All'),
                      enabled: !controller.isLoading.value,
                      controlAffinity: ListTileControlAffinity.leading,
                    );
                  }),
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Obx(() {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        backgroundColor: Colors.blue[800],
                        padding: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                      ),
                      onPressed: () =>
                      controller.isLoading.value
                          ? null
                          : controller.syncData(),
                      child: controller.isLoading.value ? SpinKitWave(
                        color: Colors.white,
                        size: 26.0,
                      ) : Text('Sync Now', style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),),
                    );
                  }),
                )
              ],
            ),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: controller.listItems.length,
                  itemBuilder: (context, index) {
                    return SyncItemWidget(listItem: controller
                        .listItems[index]);
                  },
                );
              }),
            )
          ],
        ),
      )),
    );
  }
}
