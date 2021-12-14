
class TimeUtil{
  static Future delay(int sec,Function()? doThing) async{
    Future.delayed(Duration(seconds: sec),doThing);
  }
}