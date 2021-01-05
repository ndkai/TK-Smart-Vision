class StatisticResponseSwaggger {
  bool success;
  int statusCode;
  Data data;

  StatisticResponseSwaggger({this.success, this.statusCode, this.data});

  StatisticResponseSwaggger.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status_code'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<Items> items;
  int totalRecord;

  Data({this.items, this.totalRecord});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = new List<Items>();
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
    totalRecord = json['totalRecord'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    data['totalRecord'] = this.totalRecord;
    return data;
  }
}

class Items {
  int classQuanity;
  int teacherQuantity;
  int mealTicketsToDayQuantity;
  Deparment deparment;
  StatisticOverview statisticOverview;

  Items(
      {this.classQuanity,
        this.teacherQuantity,
        this.mealTicketsToDayQuantity,
        this.deparment,
        this.statisticOverview});

  Items.fromJson(Map<String, dynamic> json) {
    classQuanity = json['classQuanity'];
    teacherQuantity = json['teacherQuantity'];
    mealTicketsToDayQuantity = json['mealTicketsToDayQuantity'];
    deparment = json['deparment'] != null
        ? new Deparment.fromJson(json['deparment'])
        : null;
    statisticOverview = json['statisticOverview'] != null
        ? new StatisticOverview.fromJson(json['statisticOverview'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['classQuanity'] = this.classQuanity;
    data['teacherQuantity'] = this.teacherQuantity;
    data['mealTicketsToDayQuantity'] = this.mealTicketsToDayQuantity;
    if (this.deparment != null) {
      data['deparment'] = this.deparment.toJson();
    }
    if (this.statisticOverview != null) {
      data['statisticOverview'] = this.statisticOverview.toJson();
    }
    return data;
  }
}

class Deparment {
  int id;
  String name;
  String startTimeMorning;
  String endTimeMorning;
  String startTimeAfternoon;
  String endTimeAfternoon;
  String cityCode;
  String city;
  String districtCode;
  String district;
  String wardCode;
  String ward;
  String address;
  String roleName;

  Deparment(
      {this.id,
        this.name,
        this.startTimeMorning,
        this.endTimeMorning,
        this.startTimeAfternoon,
        this.endTimeAfternoon,
        this.cityCode,
        this.city,
        this.districtCode,
        this.district,
        this.wardCode,
        this.ward,
        this.address,
        this.roleName});

  Deparment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    startTimeMorning = json['startTimeMorning'];
    endTimeMorning = json['endTimeMorning'];
    startTimeAfternoon = json['startTimeAfternoon'];
    endTimeAfternoon = json['endTimeAfternoon'];
    cityCode = json['cityCode'];
    city = json['city'];
    districtCode = json['districtCode'];
    district = json['district'];
    wardCode = json['wardCode'];
    ward = json['ward'];
    address = json['address'];
    roleName = json['roleName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['startTimeMorning'] = this.startTimeMorning;
    data['endTimeMorning'] = this.endTimeMorning;
    data['startTimeAfternoon'] = this.startTimeAfternoon;
    data['endTimeAfternoon'] = this.endTimeAfternoon;
    data['cityCode'] = this.cityCode;
    data['city'] = this.city;
    data['districtCode'] = this.districtCode;
    data['district'] = this.district;
    data['wardCode'] = this.wardCode;
    data['ward'] = this.ward;
    data['address'] = this.address;
    data['roleName'] = this.roleName;
    return data;
  }
}

class StatisticOverview {
  int employeeNumbers;
  List<Overviews> overviews;

  StatisticOverview({this.employeeNumbers, this.overviews});

  StatisticOverview.fromJson(Map<String, dynamic> json) {
    employeeNumbers = json['employeeNumbers'];
    if (json['overviews'] != null) {
      overviews = new List<Overviews>();
      json['overviews'].forEach((v) {
        overviews.add(new Overviews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employeeNumbers'] = this.employeeNumbers;
    if (this.overviews != null) {
      data['overviews'] = this.overviews.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Overviews {
  String date;
  Morning morning;
  Morning afternoon;

  Overviews({this.date, this.morning, this.afternoon});

  Overviews.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    morning =
    json['morning'] != null ? new Morning.fromJson(json['morning']) : null;
    afternoon = json['afternoon'] != null
        ? new Morning.fromJson(json['afternoon'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    if (this.morning != null) {
      data['morning'] = this.morning.toJson();
    }
    if (this.afternoon != null) {
      data['afternoon'] = this.afternoon.toJson();
    }
    return data;
  }
}

class Morning {
  int presentStatusNumbers;
  int absentStatusNumbers;
  int lateStatusNumbers;
  int skipStatusNumbers;
  int lateAndSkipStatusNumbers;
  int nullStatusNumbers;

  Morning(
      {this.presentStatusNumbers,
        this.absentStatusNumbers,
        this.lateStatusNumbers,
        this.skipStatusNumbers,
        this.lateAndSkipStatusNumbers,
        this.nullStatusNumbers});

  Morning.fromJson(Map<String, dynamic> json) {
    presentStatusNumbers = json['presentStatusNumbers'];
    absentStatusNumbers = json['absentStatusNumbers'];
    lateStatusNumbers = json['lateStatusNumbers'];
    skipStatusNumbers = json['skipStatusNumbers'];
    lateAndSkipStatusNumbers = json['lateAndSkipStatusNumbers'];
    nullStatusNumbers = json['nullStatusNumbers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['presentStatusNumbers'] = this.presentStatusNumbers;
    data['absentStatusNumbers'] = this.absentStatusNumbers;
    data['lateStatusNumbers'] = this.lateStatusNumbers;
    data['skipStatusNumbers'] = this.skipStatusNumbers;
    data['lateAndSkipStatusNumbers'] = this.lateAndSkipStatusNumbers;
    data['nullStatusNumbers'] = this.nullStatusNumbers;
    return data;
  }
}