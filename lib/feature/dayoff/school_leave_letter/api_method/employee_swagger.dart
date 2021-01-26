

import 'package:fai_kul/feature/study_point/domain/entities/studypoin_swagger.dart';

class EmployeeSwagger {
  bool success;
  int statusCode;
  Employee data;

  EmployeeSwagger({this.success, this.statusCode, this.data});

  EmployeeSwagger.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    data = json['data'] != null ? new Employee.fromJson(json['data']) : null;
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
