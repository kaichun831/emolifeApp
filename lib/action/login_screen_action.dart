import 'dart:convert';
import 'dart:developer';

import 'package:emolife/constans.dart';
import 'package:emolife/controller/app_controller.dart';
import 'package:emolife/models/login_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreenAction extends GetConnect{

  Future<Response<LoginResponse?>> login () async{
    var body =jsonEncode({
      "Account": "admin",
      "Pwd": "1111",
      "Server": "192.168.0.18",
      "Db": "WMSV",
      "AndroidId": AppController.Moblie_ID,
      "Version":"1.0.0.2",
      "Ip": AppController.IP
    });

    log(body);
    Response<LoginResponse?> result = await post('http://${Constans.BASE_URL}/api/Auth/SignIn',body,decoder: (response){
      var body = LoginResponse.fromMap(response);
      debugPrint(body?.toJson().toString());
      return body;
    },headers: {"Authorization":"Bearer RF"});
   return result;

  }
}