class ContactUsSubmitSendModel {
  int? userId;
  int? adminId;
  String? message;

  ContactUsSubmitSendModel({this.userId, this.adminId, this.message});

  ContactUsSubmitSendModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    adminId = json['admin_id'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['admin_id'] = this.adminId;
    data['message'] = this.message;
    return data;
  }
}
