import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:migrant_profile/pages/auth/login.dart';
import 'package:migrant_profile/pages/home_page.dart';
import 'package:migrant_profile/services/user_service.dart';
import 'package:migrant_profile/utils/locale_string.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  UserService userService = UserService();
  Map<String, dynamic> userData = await userService.getUserData();
  bool isLoggedIn = userData['token']?.isNotEmpty ??
      false && userData['id'] != 0 && userData['first_name']?.isNotEmpty ??
      false;
  // NepaliUtils(Language.nepali);
  runApp(MyApp(isLoggedIn: isLoggedIn));
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LocalString(),
      locale: Locale("ne", "NP"),
      debugShowCheckedModeBanner: false,
      home: isLoggedIn ? HomePage() : Login(),
    );
  }
}
