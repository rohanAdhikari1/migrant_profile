import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class AppController extends GetxController {
  RxString oldVersion = "".obs;
  RxString currentVersion = "".obs;
  RxString newAppUrl = "".obs;

  @override
  void onInit() async {
    super.onInit();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    currentVersion.value = packageInfo.version;
    checkLatestVersion();
  }

  Future<void> checkLatestVersion() async {
    const repositoryOwner = 'rohanadhikari1';
    const repositoryName = 'animal-vaccination-app';
    final Dio dio = Dio();
    final response = await dio.get(
      'https://api.github.com/repos/$repositoryOwner/$repositoryName/releases/latest',
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = response.data;
      final tagName = data['tag_name'];
      oldVersion.value = tagName;
      final assets = data['assets'] as List<dynamic>;
      for (final asset in assets) {
        final assetName = asset['name'];
        final assetDownloadUrl = asset['browser_download_url'];
        newAppUrl.value = assetDownloadUrl;
      }

      if (currentVersion.value != oldVersion.value) {
        checkUpdate();
      }
    } else {
      print(
          'Failed to fetch GitHub release info. Status code: ${response.statusCode}');
    }
  }

  void checkUpdate() {
    Get.rawSnackbar(
      message: "New Update Available",
      mainButton: TextButton(
        onPressed: () {
          launchUrl(
            Uri.parse(newAppUrl.value),
            mode: LaunchMode.externalApplication,
          );
          Get.back();
        },
        child: Text("Update"),
      ),
      duration: Duration(days: 1),
      icon: Icon(Icons.update_sharp),
      snackStyle: SnackStyle.FLOATING,
      barBlur: 20,
      leftBarIndicatorColor: Colors.blue,
    );
  }
}
