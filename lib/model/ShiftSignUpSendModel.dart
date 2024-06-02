class ShiftSignUpSendModel {
  String? signUpType;
  int? shiftId;

  ShiftSignUpSendModel({this.signUpType, this.shiftId});

  ShiftSignUpSendModel.fromJson(Map<String, dynamic> json) {
    signUpType = json['sign_up_type'];
    shiftId = json['shift_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sign_up_type'] = this.signUpType;
    data['shift_id'] = this.shiftId;
    return data;
  }
}
