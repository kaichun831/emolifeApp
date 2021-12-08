
import 'package:emolife/action/login_screen_action.dart';
import 'package:emolife/controller/app_controller.dart';
import 'package:flutter/material.dart';


class SignViewController extends AppController{
  String errorMsg="";
  final LoginScreenAction _action = LoginScreenAction();
  Future<bool?>  callLogin() async{
     var response =  await _action.login();
     Map<String,dynamic> body = response.body;
     debugPrint(body.toString());
     if(body['Success']){

     }else{
       print(body['Msg']);
       errorMsg =body['Msg'];
     }
     return body['Success'];

  }

}