import 'dart:convert';
import 'dart:developer';

import 'package:emolife/constans.dart';
import 'package:emolife/controller/app_controller.dart';
import 'package:get/get.dart';

class LoginScreenAction extends GetConnect{

  Future<Response> login () async{
    var body =jsonEncode({
      "Account": "admin",
      "Pwd": "1111",
      "Server": "192.168.0.18",
      "Db": "WMSV",
      "AndroidId": AppController.Moblie_ID,
      "RFVersion":"1.0.0.2",
      "Ip": AppController.IP
    });

    log(body);
    var result = await post('http://${Constans.BASE_URL}/api/Auth/SignIn',body,decoder: (response){
       return response;
    },headers: {"Authorization":"Bearer RF"}).catchError((err){
      throw err;
    });
   return result;

  }
}