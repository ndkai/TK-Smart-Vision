import 'package:fai_kul/feature/point_input/api/class_student/domain/entities/class_student.dart';

class LoginSwagger {
  bool success;
  int statusCode;
  Data data;

  LoginSwagger({this.success, this.statusCode, this.data});

  LoginSwagger.fromJson(Map<String, dynamic> json) {
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
  String id;
  String displayName;
  String token;
  String username;
  String email;
  String expires;
  bool isSchool;
  String roleName;
  Department department;
  Teacher teacher;
  Parent parent;

  Data({this.id, this.displayName, this.token, this.username, this.email, this.expires, this.isSchool, this.roleName, this.department, this.teacher, this.parent});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    displayName = json['displayName'];
    token = json['token'];
    username = json['username'];
    email = json['email'];
    expires = json['expires'];
    isSchool = json['isSchool'];
    roleName = json['roleName'];
    department = json['department'] != null ? new Department.fromJson(json['department']) : null;
    teacher = json['teacher'] != null ? new Teacher.fromJson(json['teacher']) : null;
    parent =
    json['parent'] != null ? new Parent.fromJson(json['parent']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['displayName'] = this.displayName;
    data['token'] = this.token;
    data['username'] = this.username;
    data['email'] = this.email;
    data['expires'] = this.expires;
    data['isSchool'] = this.isSchool;
    data['roleName'] = this.roleName;
    if (this.department != null) {
      data['department'] = this.department.toJson();
    }
    if (this.teacher != null) {
      data['teacher'] = this.teacher.toJson();
    }
    if (this.parent != null) {
      data['parent'] = this.parent.toJson();
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
  String address;
  int departmentId;
  Null userName;
  Department department;
  Class classx;
  String userId;

  Teacher({this.id, this.fullName, this.phoneNumber, this.email, this.dob, this.gender, this.cityCode, this.city, this.districtCode, this.district, this.wardCode, this.ward, this.address, this.departmentId, this.userName, this.department, this.classx, this.userId});

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
  classx = json['class'];
  userId = json['userId'];
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
  data['class'] = this.classx;
  data['userId'] = this.userId;
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

class Parent {
  int id;
  String fullName;
  String userName;
  String phoneNumber;
  String email;
  int employeeId;
  String userId;

  Parent(
      {this.id,
        this.fullName,
        this.userName,
        this.phoneNumber,
        this.email,
        this.employeeId,
        this.userId});

  Parent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    userName = json['userName'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    employeeId = json['employeeId'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['userName'] = this.userName;
    data['phoneNumber'] = this.phoneNumber;
    data['email'] = this.email;
    data['employeeId'] = this.employeeId;
    data['userId'] = this.userId;
    return data;
  }
}