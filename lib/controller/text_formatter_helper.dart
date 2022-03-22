class TextFormatterHelper {


  //gets the first two letters of user name - example: Ziad Hassan -> ZH
  String getFirstLettersOfName(String rawName){

    String firstLetters;

    //if username is empty
    if(rawName == ""){
      return "0";
    }

    //splits name after every space
    List<String> splitFullName = rawName.split(" ");

    //condition to check if name is, either a one word name, or a full name
    if(splitFullName.length > 1){ //more than one word name
      firstLetters =
          "${splitFullName[0].substring(0,1)}${splitFullName[1].substring(0,1)}".toUpperCase();

    } else { //one word name
      firstLetters = splitFullName[0].substring(0,1).toUpperCase();
    }

    //return first letters
    return firstLetters;
  }
}