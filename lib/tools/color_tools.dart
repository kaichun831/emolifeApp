import 'package:flutter/material.dart';

class ColorUtil{
  static Color fromHex(String hexString){
    final buffer = StringBuffer();
    if(hexString.length==6 || hexString.length==7) buffer.write('ff');
    buffer.write(hexString.replaceFirst("#",''));
    return Color(int.parse(buffer.toString(),radix: 16));
  }

  static Color mainBlueColor(){
    String hexString = "#656CEE";
    final buffer = StringBuffer();
    if(hexString.length==6 || hexString.length==7) buffer.write('ff');
    buffer.write(hexString.replaceFirst("#",''));
    return Color(int.parse(buffer.toString(),radix: 16));
  }

  static Color mainRedColor(){
    String hexString = "#F86E6E";
    final buffer = StringBuffer();
    if(hexString.length==6 || hexString.length==7) buffer.write('ff');
    buffer.write(hexString.replaceFirst("#",''));
    return Color(int.parse(buffer.toString(),radix: 16));
  }

  static Color mainOrangeColor(){
    String hexString = "#FF8B2D";
    final buffer = StringBuffer();
    if(hexString.length==6 || hexString.length==7) buffer.write('ff');
    buffer.write(hexString.replaceFirst("#",''));
    return Color(int.parse(buffer.toString(),radix: 16));
  }

  static Color mainTest(){
    return const Color.fromRGBO(249, 128, 128, 1);
  }

}