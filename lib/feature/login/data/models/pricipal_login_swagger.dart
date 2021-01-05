class PrincipalLoginSwagger {
  bool success;
  int statusCode;
  Data data;

  PrincipalLoginSwagger({this.success, this.statusCode, this.data});

  PrincipalLoginSwagger.fromJson(Map<String, dynamic> json) {
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
  String displayName;
  String token;
  String username;
  String email;
  String expires;
  bool isSchool;
  String roleName;
  Department department;

  Data(
      {this.displayName,
        this.token,
        this.username,
        this.email,
        this.expires,
        this.isSchool,
        this.roleName,
        this.department});

  Data.fromJson(Map<String, dynamic> json) {
    displayName = json['displayName'];
    token = json['token'];
    username = json['username'];
    email = json['email'];
    expires = json['expires'];
    isSchool = json['isSchool'];
    roleName = json['roleName'];
    department = json['department'] != null
        ? new Department.fromJson(json['department'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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

  Department(
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