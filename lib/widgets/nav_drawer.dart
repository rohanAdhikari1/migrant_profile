import 'package:survey/Pages/Auth/login.dart';
import 'package:survey/controllers/home_controller.dart';
import 'package:survey/data/local/db_helper.dart';
import 'package:survey/pages/profile.dart';
import 'package:survey/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavDrawer extends StatelessWidget {
  final HomeController controller = Get.find();
  NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    UserService userService = UserService();
     return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue[800],
            ),
            child: Center(
              child: Text(
               "ग्रामथान गाउँपालिका",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person_4),
            title: Text('profile'.tr),
            onTap: () {
              Get.to(Profile(),transition: Transition.rightToLeftWithFade);
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.security),
          //   title: Text('change_password'.tr),
          //   onTap: () {
          //     Get.to(ChangePassword(),transition: Transition.rightToLeftWithFade);
          //   },
          // ),
          // ListTile(
          //   leading: Icon(Icons.language),
          //   title: Text('change_language'.tr),
          //   trailing: DropdownButton<String>(
          //     value: Get.locale?.languageCode == 'en' ? 'English' : 'Nepali',
          //     onChanged: (String? newValue) {
          //       if (newValue == 'English') {
          //         Get.updateLocale(Locale('en', 'US'));
          //       } else if (newValue == 'Nepali') {
          //         Get.updateLocale(Locale('ne', 'NP'));
          //       }
          //     },
          //     items: <String>['English', 'Nepali']
          //         .map<DropdownMenuItem<String>>((String value) {
          //       return DropdownMenuItem<String>(
          //         value: value,
          //         child: Text(value),
          //       );
          //     }).toList(),
          //   ),
          //   onTap: () {
          //     Navigator.pop(context);
          //   },
          // ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () async {
              userService.clearUserData();
              await DBHelper.getInstance.delete();
              Get.snackbar(
                "Logged Out",
                "You have been successfully logged out.",
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.red,
                colorText: Colors.white,
              );
              Get.offAll(() => Login());
            },
          ),
        ],
      ),
    );
  }
}
