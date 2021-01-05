class ClassStudentSwagger {
  bool success;
  int statusCode;
  Data data;

  ClassStudentSwagger({this.success, this.statusCode, this.data});

  ClassStudentSwagger.fromJson(Map<String, dynamic> json) {
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
      json['items'].forEach((v) { items.add(new Items.fromJson(v)); });
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
  int id;
  String code;
  String fullName;
  String phoneNumber;
  String dob;
  bool gender;
  String cityCode;
  String city;
  String districtCode;
  String district;
  String wardCode;
  String ward;
  Null address;
  bool hadImages;
  int classId;
  Class classx;
  int parentId;
  Null parent;

  Items({this.id, this.code, this.fullName, this.phoneNumber, this.dob, this.gender, this.cityCode, this.city, this.districtCode, this.district, this.wardCode, this.ward, this.address, this.hadImages, this.classId, this.classx, this.parentId, this.parent});

  Items.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  code = json['code'];
  fullName = json['fullName'];
  phoneNumber = json['phoneNumber'];
  dob = json['dob'];
  gender = json['gender'];
  cityCode = json['cityCode'];
  city = json['city'];
  districtCode = json['districtCode'];
  district = json['district'];
  wardCode = json['wardCode'];
  ward = json['ward'];
  address = json['address'];
  hadImages = json['hadImages'];
  classId = json['classId'];
  classx = json['class'] != null ? new Class.fromJson(json['class']) : null;
  parentId = json['parentId'];
  parent = json['parent'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = this.id;
  data['code'] = this.code;
  data['fullName'] = this.fullName;
  data['phoneNumber'] = this.phoneNumber;
  data['dob'] = this.dob;
  data['gender'] = this.gender;
  data['cityCode'] = this.cityCode;
  data['city'] = this.city;
  data['districtCode'] = this.districtCode;
  data['district'] = this.district;
  data['wardCode'] = this.wardCode;
  data['ward'] = this.ward;
  data['address'] = this.address;
  data['hadImages'] = this.hadImages;
  data['classId'] = this.classId;
  if (this.classx != null) {
  data['class'] = this.classx.toJson();
  }
  data['parentId'] = this.parentId;
  data['parent'] = this.parent;
  return data;
  }
}

class Class {
  int id;
  String name;
  int session;
  int departmentId;
  Department department;
  Null teacherId;
  Null teacher;

  Class({this.id, this.name, this.session, this.departmentId, this.department, this.teacherId, this.teacher});

  Class.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    session = json['session'];
    departmentId = json['departmentId'];
    department = json['department'] != null ? new Department.fromJson(json['department']) : null;
    teacherId = json['teacherId'];
    teacher = json['teacher'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['session'] = this.session;
    data['departmentId'] = this.departmentId;
    if (this.department != null) {
      data['department'] = this.department.toJson();
    }
    data['teacherId'] = this.teacherId;
    data['teacher'] = this.teacher;
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