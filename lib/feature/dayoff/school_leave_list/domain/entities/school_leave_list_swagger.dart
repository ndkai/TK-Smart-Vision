import 'package:fai_kul/feature/point_input/api/contact_book/domain/entities/ContactBookSwagger.dart';

class SchoolLeaveListSwagger {
  bool success;
  int statusCode;
  Meta meta;
  List<Data> data;

  SchoolLeaveListSwagger({this.success, this.statusCode, this.meta, this.data});

  SchoolLeaveListSwagger.fromJson(Map<String, dynamic> json) {
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
  String fullName;
  String phoneNumber;
  String address;
  String relation;
  int dayNumber;
  int dayOfWeek;
  String fromDate;
  String toDate;
  String reason;
  String dateCreated;
  int status;
  int employeeId;
  Employee employee;

  Data({this.id, this.fullName, this.phoneNumber, this.address, this.relation, this.dayNumber, this.dayOfWeek, this.fromDate, this.toDate, this.reason, this.dateCreated, this.status, this.employeeId, this.employee});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    phoneNumber = json['phoneNumber'];
    address = json['address'];
    relation = json['relation'];
    dayNumber = json['dayNumber'];
    dayOfWeek = json['dayOfWeek'];
    fromDate = json['fromDate'];
    toDate = json['toDate'];
    reason = json['reason'];
    dateCreated = json['dateCreated'];
    status = json['status'];
    employeeId = json['employeeId'];
    employee = json['employee'] != null ? new Employee.fromJson(json['employee']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['phoneNumber'] = this.phoneNumber;
    data['address'] = this.address;
    data['relation'] = this.relation;
    data['dayNumber'] = this.dayNumber;
    data['dayOfWeek'] = this.dayOfWeek;
    data['fromDate'] = this.fromDate;
    data['toDate'] = this.toDate;
    data['reason'] = this.reason;
    data['dateCreated'] = this.dateCreated;
    data['status'] = this.status;
    data['employeeId'] = this.employeeId;
    if (this.employee != null) {
      data['employee'] = this.employee.toJson();
    }
    return data;
  }
}