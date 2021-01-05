import 'package:fai_kul/feature/schedule/api/schedule_model.dart';

class TAttendanceHistorySwagger {
  bool success;
  int statusCode;
  Meta meta;
  List<TAttendanceHistory> data;

  TAttendanceHistorySwagger({this.success, this.statusCode, this.meta, this.data});

  TAttendanceHistorySwagger.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = new List<TAttendanceHistory>();
      json['data'].forEach((v) { data.add(new TAttendanceHistory.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status_code'] = this.statusCode;
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meta {
  int total;
  int pageSize;
  int pageNumber;

  Meta({this.total, this.pageSize, this.pageNumber});

  Meta.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    pageSize = json['page_size'];
    pageNumber = json['page_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['page_size'] = this.pageSize;
    data['page_number'] = this.pageNumber;
    return data;
  }
}

class TAttendanceHistory {
  int id;
  String date;
  String time;
  int activity;
  double temperature;
  int teacherId;
  Teacher teacher;

  TAttendanceHistory({this.id, this.date, this.time, this.activity, this.temperature, this.teacherId, this.teacher});

  TAttendanceHistory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    time = json['time'];
    activity = json['activity'];
    temperature = json['temperature'];
    teacherId = json['teacherId'];
    teacher = json['teacher'] != null ? new Teacher.fromJson(json['teacher']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['time'] = this.time;
    data['activity'] = this.activity;
    data['temperature'] = this.temperature;
    data['teacherId'] = this.teacherId;
    if (this.teacher != null) {
      data['teacher'] = this.teacher.toJson();
    }
    return data;
  }
}

class Teacher {
  int id;
  String fullName;
  String phoneNumber;
  String email;
  String dob;
  bool gender;
  String cityCode;
  String city;
  String districtCode;
  String district;
  String wardCode;
  String ward;
  Null address;
  int departmentId;
  String userName;
  Department department;
  Class classs;

  Teacher({this.id, this.fullName, this.phoneNumber, this.email, this.dob, this.gender, this.cityCode, this.city, this.districtCode, this.district, this.wardCode, this.ward, this.address, this.departmentId, this.userName, this.department, this.classs});

  Teacher.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  fullName = json['fullName'];
  phoneNumber = json['phoneNumber'];
  email = json['email'];
  dob = json['dob'];
  gender = json['gender'];
  cityCode = json['cityCode'];
  city = json['city'];
  districtCode = json['districtCode'];
  district = json['district'];
  wardCode = json['wardCode'];
  ward = json['ward'];
  address = json['address'];
  departmentId = json['departmentId'];
  userName = json['userName'];
  department = json['department'] != null ? new Department.fromJson(json['department']) : null;
  classs = json['class'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = this.id;
  data['fullName'] = this.fullName;
  data['phoneNumber'] = this.phoneNumber;
  data['email'] = this.email;
  data['dob'] = this.dob;
  data['gender'] = this.gender;
  data['cityCode'] = this.cityCode;
  data['city'] = this.city;
  data['districtCode'] = this.districtCode;
  data['district'] = this.district;
  data['wardCode'] = this.wardCode;
  data['ward'] = this.ward;
  data['address'] = this.address;
  data['departmentId'] = this.departmentId;
  data['userName'] = this.userName;
  if (this.department != null) {
  data['department'] = this.department.toJson();
  }
  data['class'] = this.classs;
  return data;
  }
}

class Department {
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

  Department({this.id, this.name, this.startTimeMorning, this.endTimeMorning, this.startTimeAfternoon, this.endTimeAfternoon, this.cityCode, this.city, this.districtCode, this.district, this.wardCode, this.ward, this.address, this.roleName});

  Department.fromJson(Map<String, dynamic> json) {
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