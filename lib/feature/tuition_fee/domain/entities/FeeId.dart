class FeeID {
  bool success;
  int statusCode;
  Meta meta;
  List<Data> data;

  FeeID({this.success, this.statusCode, this.meta, this.data});

  FeeID.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
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
  double price;
  String dueDate;
  String description;
  int departmentId;
  Department department;

  Data(
      {this.id,
        this.price,
        this.dueDate,
        this.description,
        this.departmentId,
        this.department});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    dueDate = json['dueDate'];
    description = json['description'];
    departmentId = json['departmentId'];
    department = json['department'] != null
        ? new Department.fromJson(json['department'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['dueDate'] = this.dueDate;
    data['description'] = this.description;
    data['departmentId'] = this.departmentId;
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