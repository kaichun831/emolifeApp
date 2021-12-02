import 'dart:async';

import 'package:emolife_purchasing/tools/date_tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var userEmail = "";
  var userPassword = "";
  var myDate = "2021-12-04T14:30:00";
  var endDate = "2021-12-05T14:30:00";
  String data="";
  late Timer _timer ;
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        var myDate = DateTime.now().difference(DateTime(2021,12,02,18,00,00));
        data= DateTimeUtil.reciprocalTime(myDate.inSeconds);
      });
    });
  }
  @override
  Widget build(BuildContext context) {


    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(50)),
              ),
              const Flexible(
                  child: SizedBox(
                height: 20,
              )),
              Text(
                "咸青${data}",
                style: TextStyle(fontSize: 30),
              ),
              const Flexible(
                  child: SizedBox(
                height: 30,
              )),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20, top: 10, bottom: 5),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, top: 5, bottom: 10, right: 20),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Email",
                        border: InputBorder.none,
                        icon: Icon(Icons.person_pin),
                      ),
                      inputFormatters: [LengthLimitingTextInputFormatter(10)],
                      validator: (email) {
                        if (email!.isEmpty) {
                          return 'Email is required';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      autofocus: true,
                      onSaved: (email) {
                        userEmail = email!;
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20, top: 5, bottom: 5),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset:
                              const Offset(1, 2), // changes position of shadow
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, top: 5, bottom: 5, right: 5),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Password",
                        border: InputBorder.none,
                        icon: Icon(Icons.lock),
                      ),
                      inputFormatters: [LengthLimitingTextInputFormatter(10)],
                      validator: (email) {
                        if (email!.isEmpty) {
                          return 'Email is required';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      autofocus: true,
                      onSaved: (pwd) {
                        userPassword = pwd!;
                      },
                    ),
                  ),
                ),
              ),
              const Flexible(
                  child: SizedBox(
                height: 20,
              )),
              const Text(
                "忘記密碼?",
                style: TextStyle(color: Colors.indigoAccent),
              ),
              const Flexible(
                  child: SizedBox(
                height: 20,
              )),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 0, bottom: 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromRGBO(248, 110, 110, 1),
                  ),
                  onPressed: () {
                    Get.toNamed("/");
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80)),
                        width: double.infinity,
                        child: const Center(
                            child: Text(
                          "Login",
                          style: TextStyle(fontSize: 20),
                        ))),
                  ),
                ),
              ),
              Flexible(child: const SizedBox(height: 15)),
              Flexible(
                  child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        height: 1,
                      ),
                    ),
                    Text('   OR   '),
                    Expanded(
                        child: Divider(
                      thickness: 1,
                      height: 1,
                    )),
                  ],
                ),
              ))
            ]),
      ),
    ));
  }
}


