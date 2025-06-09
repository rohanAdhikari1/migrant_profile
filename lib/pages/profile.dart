import 'package:migrant_profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  Profile({super.key});

  final String defaultImagePath = 'assets/default_avatar.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('profile'.tr, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[800],
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: SafeArea(child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 23.0),
          child: Column(
            children: [
              CircleAvatar(
                // backgroundImage: AssetImage(defaultImagePath) as ImageProvider,
                radius: 85,
                backgroundColor: Colors.grey[600],
                child: Icon(Icons.camera_alt,size: 100.0,color: Colors.white),
              ),
              SizedBox(height: 15),
              TextFormField(
                readOnly: true,
                controller: controller.firstName,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'First Name cannot be empty';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: "First Name",
                    floatingLabelStyle: TextStyle(color: Colors
                        .blue[800]),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue[800]!,
                          width: 2.0),
                    ),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.account_circle, color: Colors
                        .blue[800],)
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                readOnly: true,
                controller: controller.middleName,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: "Middle Name",
                    floatingLabelStyle: TextStyle(color: Colors
                        .blue[800]),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue[800]!,
                          width: 2.0),
                    ),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person, color: Colors
                        .blue[800],)
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                readOnly: true,
                controller: controller.lastName,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Last Name cannot be empty';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: "Last Name",
                    floatingLabelStyle: TextStyle(color: Colors
                        .blue[800]),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue[800]!,
                          width: 2.0),
                    ),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person_4, color: Colors
                        .blue[800],)
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                readOnly: true,
                controller: controller.email,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: "Email",
                    floatingLabelStyle: TextStyle(color: Colors
                        .blue[800]),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue[800]!,
                          width: 2.0),
                    ),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email, color: Colors
                        .blue[800],)
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                readOnly: true,
                controller: controller.primaryPhone,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Primary Phone cannot be empty';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: "Primary phone",
                    floatingLabelStyle: TextStyle(color: Colors
                        .blue[800]),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue[800]!,
                          width: 2.0),
                    ),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone, color: Colors
                        .blue[800],)
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                readOnly: true,
                controller: controller.secondryPhone,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: "Secondary Phone",
                    floatingLabelStyle: TextStyle(color: Colors
                        .blue[800]),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue[800]!,
                          width: 2.0),
                    ),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone_android, color: Colors
                        .blue[800],)
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                readOnly: true,
                controller: controller.address,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: "Address",
                    floatingLabelStyle: TextStyle(color: Colors
                        .blue[800]),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue[800]!,
                          width: 2.0),
                    ),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.location_on, color: Colors
                        .blue[800],)
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
