class IDExtractor {
  int? _year;
  int? _month;
  int? _day;
  String? _gov;
  String? _gender;
  String? _errorMsg;

  final List<String> _govList = [
    "Cairo",
    "Alex",
    "Port Said",
    "Suez",
    "",
    "",
    "",
    "",
    "",
    "",
    "Damietta",
    "Dakahlia",
    "Sharkia",
    "Qalyubi",
    "Kafr El-Sheikh",
    "Gharbiya",
    "Menoufia",
    "Beheira",
    "Ismailia",
    "",
    "Giza",
    "Bani Sweif",
    "Fayoum",
    "Minya",
    "Asyut",
    "Sohag",
    "Qena",
    "Aswan",
    "Luxor",
    "",
    "Red Sea",
    "New Valley",
    "Marsa Matroh",
    "North Sinai",
    "South of Sinai",
    "Outside Egypt"
  ];

  String? getDate() {
    if (this._year == null || this._month == null || this._day == null)
      return null;
    String date = '${this._year}' +
        '/' +
        '${this._month}'.padLeft(2, '0') +
        '/' +
        '${this._day}'.padLeft(2, '0');
    return date;
  }

  String? getGov() {
    if (this._gov == null) {
      return null;
    }
    return this._gov;
  }

  String? getGender() {
    if (this._gender == null) {
      return null;
    }
    return this._gender;
  }

  String? getErrorMsg() {
    return this._errorMsg;
  }

  void clearAll() {
    this._year = null;
    this._month = null;
    this._day = null;
    this._gov = null;
    this._gender = null;
    this._errorMsg = null;
  }

  String? validator(String? id) {
    if (id!.isNotEmpty && id.length < 14) {
      return "National ID must be 14 numbers";
    }
    if (id.isEmpty) return null;
    if (int.tryParse(id) == null) return "Invalid ID";
    int centuryNum = int.parse(id.substring(0, 1));
    int yearNum = (17 + centuryNum) * 100;
    String yearStr = id.substring(1, 3);
    int year = yearNum + int.parse(yearStr);
    String monthStr = id.substring(3, 5);
    int month = int.parse(monthStr);
    String dayStr = id.substring(5, 7);
    int day = int.parse(dayStr);
    if (month > 12 || month < 1) {
      this._year = null;
      this._month = null;
      this._day = null;
      this._gov = null;
      this._gender = null;
      return "Invalid month format";
    }

    if (day > 31 || day < 1) {
      this._year = null;
      this._month = null;
      this._day = null;
      this._gov = null;
      this._gender = null;
      return "Invalid day format";
    }
    String govCode = id.substring(7, 9);
    int? code = int.tryParse(govCode);
    if (code == null) return "Invalid gov code";
    if (code < 1 || (code > 4 && code < 11) || code == 20 || code == 30) {
      this._year = null;
      this._month = null;
      this._day = null;
      this._gov = null;
      this._gender = null;
      return "Invalid gov code";
    }
    if (DateTime.now().compareTo(DateTime(year, month, day)) == -1) {
      this._year = null;
      this._month = null;
      this._day = null;
      this._gov = null;
      this._gender = null;
      return "This ID is not released yet";
    }
    return null;
  }

  void extractInfo(String id) {
    try {
      String yearStr = "";
      String monthStr = "";
      String dayStr = "";
      String govCode = "";
      this._errorMsg = null;
      int centuryNum = int.parse(id.substring(0, 1));
      int yearNum = (17 + centuryNum) * 100;
      yearStr = id.substring(1, 3);
      monthStr = id.substring(3, 5);
      dayStr = id.substring(5, 7);
      govCode = id.substring(7, 9);
      this._year = yearNum + int.parse(yearStr);
      this._month = int.parse(monthStr);
      this._day = int.parse(dayStr);

      if (DateTime.now().compareTo(
          DateTime(this._year!, this._month!, this._day!)) == -1) {
        this._year = null;
        this._month = null;
        this._day = null;
        this._gov = null;
        this._gender = null;
        throw new Exception("This ID is not released yet");
      }

      if (this._month! > 12 || this._month! < 1) {
        this._year = null;
        this._month = null;
        this._day = null;
        throw new Exception("Invalid Month Format");
      }
      if (this._day! > 31 || this._day! < 1) {
        this._year = null;
        this._month = null;
        this._day = null;
        throw new Exception("Invalid Day Format");
      }
      int code = int.parse(govCode);
      if (code < 1 || (code > 4 && code < 11) || code == 20 || code == 30) {
        this._year = null;
        this._month = null;
        this._day = null;
        this._gov = null;
        throw new Exception("Invalid Gov Code");
      }
      this._gov = _govList[code - 1];
      int genderNum = int.parse(id.substring(id.length - 2, id.length - 1));
      this._gender = genderNum % 2 == 0 ? "Female" : "Male";
    } catch (e) {
      _errorMsg = e.toString();
    }
  }
}
