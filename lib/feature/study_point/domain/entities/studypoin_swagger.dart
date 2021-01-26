import 'package:fai_kul/feature/login/data/models/login_swagger.dart';

class StudyPointSwagger {
  bool success;
  int statusCode;
  Meta meta;
  List<Data> data;

  StudyPointSwagger({this.success, this.statusCode, this.meta, this.data});

  StudyPointSwagger.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) { data.add(new Data.fromJson(v)); });
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

class Data {
  int id;
  int point;
  int employeeId;
  Employee employee;
  int semesterId;
  Semester semester;
  int subjectId;
  Subject subject;
  int pointTypeId;
  PointType pointType;
  int contactBookId;
  ContactBook contactBook;

  Data({this.id, this.point, this.employeeId, this.employee, this.semesterId, this.semester, this.subjectId, this.subject, this.pointTypeId, this.pointType, this.contactBookId, this.contactBook});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    point = json['point'];
    employeeId = json['employeeId'];
    employee = json['employee'] != null ? new Employee.fromJson(json['employee']) : null;
    semesterId = json['semesterId'];
    semester = json['semester'] != null ? new Semester.fromJson(json['semester']) : null;
    subjectId = json['subjectId'];
    subject = json['subject'] != null ? new Subject.fromJson(json['subject']) : null;
    pointTypeId = json['pointTypeId'];
    pointType = json['pointType'] != null ? new PointType.fromJson(json['pointType']) : null;
    contactBookId = json['contactBookId'];
    contactBook = json['contactBook'] != null ? new ContactBook.fromJson(json['contactBook']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['point'] = this.point;
    data['employeeId'] = this.employeeId;
    if (this.employee != null) {
      data['employee'] = this.employee.toJson();
    }
    data['semesterId'] = this.semesterId;
    if (this.semester != null) {
      data['semester'] = this.semester.toJson();
    }
    data['subjectId'] = this.subjectId;
    if (this.subject != null) {
      data['subject'] = this.subject.toJson();
    }
    data['pointTypeId'] = this.pointTypeId;
    if (this.pointType != null) {
      data['pointType'] = this.pointType.toJson();
    }
    data['contactBookId'] = this.contactBookId;
    if (this.contactBook != null) {
      data['contactBook'] = this.contactBook.toJson();
    }
    return data;
  }
}

class Employee {
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
  Parent parent;

  Employee({this.id, this.code, this.fullName, this.phoneNumber, this.dob, this.gender, this.cityCode, this.city, this.districtCode, this.district, this.wardCode, this.ward, this.address, this.hadImages, this.classId, this.classx, this.parentId, this.parent});

  Employee.fromJson(Map<String, dynamic> json) {
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
  parent = json['parent'] != null ? new Parent.fromJson(json['parent']) : null;
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
  if (this.parent != null) {
  data['parent'] = this.parent.toJson();
  }
  return data;
  }
}

class Class {
  int id;
  String name;
  int session;
  int departmentId;
  Department department;
  int teacherId;
  Teacher teacher;

  Class({this.id, this.name, this.session, this.departmentId, this.department, this.teacherId, this.teacher});

  Class.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    session = json['session'];
    departmentId = json['departmentId'];
    department = json['department'] != null ? new Department.fromJson(json['department']) : null;
      if(teacherId!=null){
      teacherId = json['teacherId'];
    }
    if(teacher!=null){
      teacher = json['teacher'];
    }
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

class Parent {
  int id;
  String fullName;
  String userName;
  String phoneNumber;
  String email;
  int employeeId;

  Parent({this.id, this.fullName, this.userName, this.phoneNumber, this.email, this.employeeId});

  Parent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    userName = json['userName'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    employeeId = json['employeeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['userName'] = this.userName;
    data['phoneNumber'] = this.phoneNumber;
    data['email'] = this.email;
    data['employeeId'] = this.employeeId;
    return data;
  }
}

class Semester {
  int id;
  int year;
  int number;
  String description;
  int departmentId;

  Semester({this.id, this.year, this.number, this.description, this.departmentId});

  Semester.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    year = json['year'];
    number = json['number'];
    description = json['description'];
    departmentId = json['departmentId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['year'] = this.year;
    data['number'] = this.number;
    data['description'] = this.description;
    data['departmentId'] = this.departmentId;
    return data;
  }
}

class Subject {
  int id;
  String name;
  int departmentId;

  Subject({this.id, this.name, this.departmentId});

  Subject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    departmentId = json['departmentId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['departmentId'] = this.departmentId;
    return data;
  }
}

class PointType {
  int id;
  String description;
  int coefficient;
  int departmentId;

  PointType({this.id, this.description, this.coefficient, this.departmentId});

  PointType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    coefficient = json['coefficient'];
    departmentId = json['departmentId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['coefficient'] = this.coefficient;
    data['departmentId'] = this.departmentId;
    return data;
  }
}

class ContactBook {
  int id;
  int week;
  int employeeId;
  int semesterId;
  String comment;

  ContactBook({this.id, this.week, this.employeeId, this.semesterId, this.comment});

  ContactBook.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    week = json['week'];
    employeeId = json['employeeId'];
    semesterId = json['semesterId'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['week'] = this.week;
    data['employeeId'] = this.employeeId;
    data['semesterId'] = this.semesterId;
    data['comment'] = this.comment;
    return data;
  }
}