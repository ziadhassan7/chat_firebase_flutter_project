class TimeFormatterHelper {


  /// Get Time - 00:00 (Standard 12 hour time)
  String getFullFormattedTime (int hours, int minutes) {
    return "${formatHour(hours)}:${formatMinute(minutes)}";
  }

  ///Formats Hour
  String formatHour (int? rawHour){

    //condition to convert hours to standard hour
    if (rawHour! > 12) {
      return "${rawHour-12}"; //Convert military time to standard time
    }

    return "$rawHour";
  }


  ///Formats Minutes
  String formatMinute (int? rawMinute){

    //condition to check if number is a one letter digit
    if(rawMinute! < 10) {
      String formattedMinute = rawMinute.toString().padLeft(2, '0'); //<-- add second digit. example: 09
      return formattedMinute;
    }

    return "$rawMinute";
  }
}