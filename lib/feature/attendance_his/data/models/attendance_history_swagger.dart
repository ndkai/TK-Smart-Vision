class AttendanceHistorySwagger {
  bool success;
  int statusCode;
  Data data;

  AttendanceHistorySwagger({this.success, this.statusCode, this.data});

  AttendanceHistorySwagger.fromJson(Map<String, dynamic> json) {
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
  List<AttendanceHistory> items;
  int totalRecord;

  Data({this.items, this.totalRecord});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = new List<AttendanceHistory>();
      json['items'].forEach((v) {
        items.add(new AttendanceHistory.fromJson(v));
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

class AttendanceHistory {
  int id;
  String date;
  String time;
  int activity;
  double temperature;

  AttendanceHistory({this.id, this.date, this.time, this.activity, this.temperature});

  AttendanceHistory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    time = json['time'];
    activity = json['activity'];
    temperature = json['temperature'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['time'] = this.time;
    data['activity'] = this.activity;
    data['temperature'] = this.temperature;
    return data;
  }
}