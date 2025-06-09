import 'package:migrant_profile/models/notification.dart';
import 'package:migrant_profile/widgets/notification_item_widget.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    final List<NotificationModel> items = [
      NotificationModel(title: 'Item 1', description: 'This is the first item.',date: 'date 1'),
      NotificationModel(title: 'Item 2', description: 'This is the second item.',date: 'date 2'),
      NotificationModel(title: 'Item 3', description: 'This is the third item.',date: 'date 3'),
      NotificationModel(title: 'Item 4', description: 'This is the fourth item.',date: 'date 4'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("सूचना",style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[800],
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: SafeArea(child: 
      Container(
        color: Colors.grey[300],
        padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
        child: ListView.builder(
          itemCount: items.length,
            itemBuilder:  (context, index) {
              return NotificationItemWidget(listItem: items[index]);
            },
        ),
      )),
    );
  }
}
