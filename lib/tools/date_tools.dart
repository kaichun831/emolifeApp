
class DateTimeUtil{
  static String reciprocalTime(int sec){
    var duration = Duration(seconds: sec);
    List<String> parts = duration.toString().split(':');
    double day=0;
    int hour = int.parse(parts[0]);
    String minute =parts[1];
    double? second =double.tryParse(parts[2]);
    day = hour/24;
    hour  = hour%24;
    return "${day.toInt()}天${addZero(hour)}時$minute分${addZero(second?.toInt())}";
  }
  static String addZero(int? number){
    if(number.toString().length==1){
      return "0"+number.toString();
    }else{
      return number.toString();
    }
  }
}