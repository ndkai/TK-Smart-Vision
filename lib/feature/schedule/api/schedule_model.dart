class ScheduleSwagger {
  bool success;
  int statusCode;
  Meta meta;
  List<ScheduleResponse> data;

  ScheduleSwagger({this.success, this.statusCode, this.meta, this.data});

  ScheduleSwagger.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = new List<ScheduleResponse>();
      json['data'].forEach((v) {
        data.add(new ScheduleResponse.fromJson(v));
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

class ScheduleResponse {
  int id;
  String date;
  int startPeriodId;
  StartPeriod startPeriod;
  int endPeriodId;
  StartPeriod endPeriod;
  int classId;
  Class classx;
  int teacherId;
  Teacher teacher;
  int subjectId;
  Subject subject;
  int semesterId;
  Semester semester;
  int roomId;
  Subject room;
  int rate;
  String comment;

  ScheduleResponse(
      {this.id,
      this.date,
      this.startPeriodId,
      this.startPeriod,
      this.endPeriodId,
      this.endPeriod,
      this.classId,
      this.classx,
      this.teacherId,
      this.teacher,
      this.subjectId,
      this.subject,
      this.semesterId,
      this.semester,
      this.roomId,
      this.room,
      this.rate,
      this.comment});

  ScheduleResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    startPeriodId = json['startPeriodId'];
    startPeriod = json['startPeriod'] != null
        ? new StartPeriod.fromJson(json['startPeriod'])
        : null;
    endPeriodId = json['endPeriodId'];
    endPeriod = json['endPeriod'] != null
        ? new StartPeriod.fromJson(json['endPeriod'])
        : null;
    classId = json['classId'];
    classx = json['class'] != null ? new Class.fromJson(json['class']) : null;
    teacherId = json['teacherId'];
    teacher =
        json['teacher'] != null ? new Teacher.fromJson(json['teacher']) : null;
    subjectId = json['subjectId'];
    subject =
        json['subject'] != null ? new Subject.fromJson(json['subject']) : null;
    semesterId = json['semesterId'];
    semester = json['semester'] != null
        ? new Semester.fromJson(json['semester'])
        : null;
    roomId = json['roomId'];
    room = json['room'] != null ? new Subject.fromJson(json['room']) : null;
    rate = json['rate'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['startPeriodId'] = this.startPeriodId;
    if (this.startPeriod != null) {
      data['startPeriod'] = this.startPeriod.toJson();
    }
    data['endPeriodId'] = this.endPeriodId;
    if (this.endPeriod != null) {
      data['endPeriod'] = this.endPeriod.toJson();
    }
    data['classId'] = this.classId;
    if (this.classx != null) {
      data['class'] = this.classx.toJson();
    }
    data['teacherId'] = this.teacherId;
    if (this.teacher != null) {
      data['teacher'] = this.teacher.toJson();
    }
    data['subjectId'] = this.subjectId;
    if (this.subject != null) {
      data['subject'] = this.subject.toJson();
    }
    data['semesterId'] = this.semesterId;
    if (this.semester != null) {
      data['semester'] = this.semester.toJson();
    }
    data['roomId'] = this.roomId;
    if (this.room != null) {
      data['room'] = this.room.toJson();
    }
    data['rate'] = this.rate;
    data['comment'] = this.comment;
    return data;
  }
}

class StartPeriod {
  int id;
  int number;
  String startTime;
  String endTime;
  int departmentId;

  StartPeriod(
      {this.id, this.number, this.startTime, this.endTime, this.departmentId});

  StartPeriod.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json['number'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    departmentId = json['departmentId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['number'] = this.number;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['departmentId'] = this.departmentId;
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

  Class(
      {this.id,
      this.name,
      this.session,
      this.departmentId,
      this.department,
      this.teacherId,
      this.teacher});

  Class.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    session = json['session'];
    departmentId = json['departmentId'];
    department = json['department'] != null
        ? new Department.fromJson(json['department'])
        : null;
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
  Department department;
  Class classx;

  Teacher(
      {this.id,
      this.fullName,
      this.phoneNumber,
      this.email,
      this.dob,
      this.gender,
      this.cityCode,
      this.city,
      this.districtCode,
      this.district,
      this.wardCode,
      this.ward,
      this.address,
      this.departmentId,
      this.department,
      this.classx});

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
    department = json['department'] != null
        ? new Department.fromJson(json['department'])
        : null;
    classx = json['class'];
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
    if (this.department != null) {
      data['department'] = this.department.toJson();
    }
    data['class'] = this.classx;
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

class Semester {
  int id;
  int year;
  int number;
  String description;
  int departmentId;

  Semester(
      {this.id, this.year, this.number, this.description, this.departmentId});

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

class Data {
  int id;
  String date;
  int startPeriodId;
  StartPeriod startPeriod;
  int endPeriodId;
  StartPeriod endPeriod;
  int classId;
  Class classx;
  int teacherId;
  Teacher teacher;
  int subjectId;
  Subject subject;
  int semesterId;
  Semester semester;
  int roomId;
  Subject room;
  int rate;
  String comment;

  Data(
      {this.id,
      this.date,
      this.startPeriodId,
      this.startPeriod,
      this.endPeriodId,
      this.endPeriod,
      this.classId,
      this.classx,
      this.teacherId,
      this.teacher,
      this.subjectId,
      this.subject,
      this.semesterId,
      this.semester,
      this.roomId,
      this.room,
      this.rate,
      this.comment});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    startPeriodId = json['startPeriodId'];
    startPeriod = json['startPeriod'] != null
        ? new StartPeriod.fromJson(json['startPeriod'])
        : null;
    endPeriodId = json['endPeriodId'];
    endPeriod = json['endPeriod'] != null
        ? new StartPeriod.fromJson(json['endPeriod'])
        : null;
    classId = json['classId'];
    classx = json['class'] != null ? new Class.fromJson(json['class']) : null;
    teacherId = json['teacherId'];
    teacher =
        json['teacher'] != null ? new Teacher.fromJson(json['teacher']) : null;
    subjectId = json['subjectId'];
    subject =
        json['subject'] != null ? new Subject.fromJson(json['subject']) : null;
    semesterId = json['semesterId'];
    semester = json['semester'] != null
        ? new Semester.fromJson(json['semester'])
        : null;
    roomId = json['roomId'];
    room = json['room'] != null ? new Subject.fromJson(json['room']) : null;
    rate = json['rate'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['startPeriodId'] = this.startPeriodId;
    if (this.startPeriod != null) {
      data['startPeriod'] = this.startPeriod.toJson();
    }
    data['endPeriodId'] = this.endPeriodId;
    if (this.endPeriod != null) {
      data['endPeriod'] = this.endPeriod.toJson();
    }
    data['classId'] = this.classId;
    if (this.classx != null) {
      data['class'] = this.classx.toJson();
    }
    data['teacherId'] = this.teacherId;
    if (this.teacher != null) {
      data['teacher'] = this.teacher.toJson();
    }
    data['subjectId'] = this.subjectId;
    if (this.subject != null) {
      data['subject'] = this.subject.toJson();
    }
    data['semesterId'] = this.semesterId;
    if (this.semester != null) {
      data['semester'] = this.semester.toJson();
    }
    data['roomId'] = this.roomId;
    if (this.room != null) {
      data['room'] = this.room.toJson();
    }
    data['rate'] = this.rate;
    data['comment'] = this.comment;
    return data;
  }
}
