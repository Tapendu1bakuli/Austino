class ShiftCancelSendModel {
  int? userId;
  int? shiftId;

  ShiftCancelSendModel({this.userId, this.shiftId});

  ShiftCancelSendModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    shiftId = json['shift_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['shift_id'] = this.shiftId;
    return data;
  }
}
