import 'package:survey/Pages/home_page.dart';
import 'package:survey/data/enums.dart';
import 'package:survey/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formField = GlobalKey<FormState>();
  bool _obscureText = true;
  RxBool isLoading = false.obs;
  final _error = "".obs;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _login() async {
    if (_formField.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      _error.value="";
      isLoading.value = true;
      var auth = AuthService();
      Map<String,dynamic> mRes = await auth.login(usernameController.text, passwordController.text);
      if(mRes['type'] == MessageType.success){
        _error.value="";
        Get.off(() => HomePage(), preventDuplicates: true);
      }else{
        _error.value=mRes['message']??"Authentication Failed";
      }
      // await Future.delayed(Duration(seconds: 3));
      isLoading.value = false;
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
        body: SafeArea(
            child: Padding(padding: EdgeInsets.symmetric(horizontal: 29),
              child: Obx(() {
                return Form(
                  key: _formField,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text("ग्रामथान गाउँपालिका", style: TextStyle(
                            color: Colors.blue[800],
                            fontSize: 26,
                            fontWeight: FontWeight.bold
                        ),textAlign: TextAlign.center,),
                      ),
                     _error.isNotEmpty?
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8,horizontal: 6),
                        margin: EdgeInsets.symmetric(vertical: 25),
                        decoration: BoxDecoration(
                          color: Colors.red[800],
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(_error.value, style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),),
                        ),
                      )
                          :SizedBox(height: 50),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("खाता मा लगइन गर्नुहोस्", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                        ),),
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        controller: usernameController,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Username cannot be empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: "Username",
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
                      SizedBox(height: 40),
                      TextFormField(
                        obscureText: _obscureText,
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password cannot be empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "Password",
                          floatingLabelStyle: TextStyle(color: Colors
                              .blue[800]),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue[800]!,
                                width: 2.0),
                          ),
                          prefixIcon: Icon(Icons.security, color: Colors
                              .blue[800]),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText ? Icons.visibility_off : Icons
                                  .visibility,
                              color: Colors.blue[800],
                            ),
                            onPressed: _togglePasswordVisibility,
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: isLoading.value ? null : _login,
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 15),
                              textStyle: TextStyle(fontSize: 18),
                              backgroundColor: Colors.blue[800]
                          ),
                          child: isLoading.value
                              ? SpinKitWave(
                            color: Colors.blue[800],
                            size: 26.0,
                          )
                              : Text('LOGIN', style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),),
                        ),
                      ),
                    ],
                  ),
                );
              }),))
    );
  }
}
