
class DateTimeUtil{
  static String reciprocalTime(int sec){
    if(sec>0){
      return "已截止";
    }
    var duration = Duration(seconds: sec.abs());
    List<String> parts = duration.toString().split(':');
    double day=0;
    int hour = int.parse(parts[0]);
    String minute =parts[1];
    double? second =double.tryParse(parts[2]);
    day = hour/24;
    hour  = hour%24;
    return "倒數${day.toInt()}天${addZero(hour)}時$minute分${addZero(second?.toInt())}秒";
  }
  static String addZero(int? number){
    if(number.toString().length==1){
      return "0"+number.toString();
    }else{
      return number.toString();
    }
  }
  static String formatMonthAndDay(String dateStr){
    var fData = dateStr.substring(5);
    return fData.replaceAll("-","/");
  }
}