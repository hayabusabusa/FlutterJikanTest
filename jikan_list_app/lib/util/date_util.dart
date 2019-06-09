
class DateUtil {
  
  static String getSeason(DateTime day) {
    String season = "";

    switch(day.month) {
      case 1:
        season = "winter";
        break;
      case 2:
        season = "winter";
        break;
      case 3:
        season = "spring";
        break;
      case 4:
        season = "spring";
        break;
      case 5:
        season = "spring";
        break;
      case 6:
        season = "summer";
        break;
      case 7:
        season = "summer";
        break;
      case 8:
        season = "summer";
        break;
      case 9:
        season = "fall";
        break;
      case 10:
        season = "fall";
        break;
      case 11:
        season = "fall";
        break;
      case 12:
        season = "winter";
        break;
    }

    return season;
  }
}