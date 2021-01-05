class NotifyResponse {
  int id;
  String message;
  String dateCreated;
  bool starred;
  bool seen;
  int notificationType;
  String userId;
  Null user;

  NotifyResponse(
      {this.id,
        this.message,
        this.dateCreated,
        this.starred,
        this.seen,
        this.notificationType,
        this.userId,
        this.user});

  NotifyResponse.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    message = json['Message'];
    dateCreated = json['DateCreated'];
    starred = json['Starred'];
    seen = json['Seen'];
    notificationType = json['NotificationType'];
    userId = json['UserId'];
    user = json['User'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Message'] = this.message;
    data['DateCreated'] = this.dateCreated;
    data['Starred'] = this.starred;
    data['Seen'] = this.seen;
    data['NotificationType'] = this.notificationType;
    data['UserId'] = this.userId;
    data['User'] = this.user;
    return data;
  }
}