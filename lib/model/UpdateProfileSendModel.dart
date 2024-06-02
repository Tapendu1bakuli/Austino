class UpdateProfileSendModel {
  String? firstName;
  String? lastName;
  int? mobileNo;
  int? rankId;

  UpdateProfileSendModel(
      {this.firstName, this.lastName, this.mobileNo, this.rankId});

  UpdateProfileSendModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobileNo = json['mobile_no'];
    rankId = json['rank_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['mobile_no'] = this.mobileNo;
    data['rank_id'] = this.rankId;
    return data;
  }
}
