import 'package:survey/controllers/location_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LocationForm extends StatelessWidget {
  const LocationForm({super.key});

  @override
  Widget build(BuildContext context) {
    final LocationFormController controller = Get.put(LocationFormController());

    return Scaffold(
      appBar: AppBar(
        title: Text('location'.tr, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[800],
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(child:
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15.0,vertical: 25.0),
          child: Form(
            key:controller.formField,
            child: Column(
            spacing: 30.0,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10.0,
                children: [
                  Text("${'latitude'.tr} :",style: TextStyle(fontWeight: FontWeight.bold)),
                  TextFormField(
                    controller: controller.latitudeController,
                    readOnly: true,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[50],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'latitude'.tr,
                      contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return  '${'latitude'.tr} ${'required'.tr}';
                      }
                      return null;
                    },
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10.0,
                children: [
                  Text("${'longitude'.tr} :",style: TextStyle(fontWeight: FontWeight.bold)),
                  TextFormField(
                    controller: controller.longitudeController,
                    readOnly: true,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[50],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'longitude'.tr,
                      contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return  '${'longitude'.tr} ${'required'.tr}';
                      }
                      return null;
                    },
                  )
                ],
              ),
              ElevatedButton(onPressed: controller.requestLocationPermission, child:
              Text('get_location'.tr,style: TextStyle(color: Colors.blue[900]),)),
              ElevatedButton(
                onPressed: controller.isLoading.value?null:controller.submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                  elevation: 4,
                ),
                child: controller.isLoading.value
                    ? SpinKitWave(
                  color: Colors.blue[800],
                  size: 26.0,
                )
                    : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'finish'.tr,
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
                      Icons.done_all_rounded,
                      color: Colors.white,
                      size: 21,
                    ),
                  ],
                ),
              ),
            ],
          ),
          ),
        )),
      ),
    );
  }
}
