class GetProfileResponseModel {
  User? user;

  GetProfileResponseModel({this.user});

  GetProfileResponseModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? username;
  String? firstName;
  String? lastName;
  String? name;
  String? authKey;
  String? passwordHash;
  String? passwordResetToken;
  String? email;
  String? mobileNo;
  int? status;
  int? createdAt;
  int? updatedAt;
  int? rankId;
  String? empNum;
  int? isUpdated;
  int? addedBy;
  int? updatedBy;
  int? lastVisitedNewsCreatedAt;
  int? isUserNotificationAlert;
  int? isUserNotificationSecondaryEmployment;
  int? isUserNotificationNewswire;
  int? isUserNotificationApartmets;
  int? disableApaSecondaryEmployment;
  int? acceptOvertimeSchedulePolicyProcedure;
  int? isUserEmailNotificationSecondaryEmployment;
  int? isUserSaveEmailNotificationPopup;
  String? loginDevice;
  String? appVersion;
  int? lastLogin;

  User(
      {this.id,
      this.username,
      this.firstName,
      this.lastName,
      this.name,
      this.authKey,
      this.passwordHash,
      this.passwordResetToken,
      this.email,
      this.mobileNo,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.rankId,
      this.empNum,
      this.isUpdated,
      this.addedBy,
      this.updatedBy,
      this.lastVisitedNewsCreatedAt,
      this.isUserNotificationAlert,
      this.isUserNotificationSecondaryEmployment,
      this.isUserNotificationNewswire,
      this.isUserNotificationApartmets,
      this.disableApaSecondaryEmployment,
      this.acceptOvertimeSchedulePolicyProcedure,
      this.isUserEmailNotificationSecondaryEmployment,
      this.isUserSaveEmailNotificationPopup,
      this.loginDevice,
      this.appVersion,
      this.lastLogin});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    name = json['name'];
    authKey = json['auth_key'];
    passwordHash = json['password_hash'];
    passwordResetToken = json['password_reset_token'];
    email = json['email'];
    mobileNo = json['mobile_no'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    rankId = json['rank_id'];
    empNum = json['emp_num'];
    isUpdated = json['is_updated'];
    addedBy = json['added_by'];
    updatedBy = json['updated_by'];
    lastVisitedNewsCreatedAt = json['last_visited_news_created_at'];
    isUserNotificationAlert = json['is_user_notification_alert'];
    isUserNotificationSecondaryEmployment =
        json['is_user_notification_secondary_employment'];
    isUserNotificationNewswire = json['is_user_notification_newswire'];
    isUserNotificationApartmets = json['is_user_notification_apartmets'];
    disableApaSecondaryEmployment = json['disable_apa_secondary_employment'];
    acceptOvertimeSchedulePolicyProcedure =
        json['accept_overtime_schedule_policy_procedure'];
    isUserEmailNotificationSecondaryEmployment =
        json['is_user_email_notification_secondary_employment'];
    isUserSaveEmailNotificationPopup =
        json['is_user_save_email_notification_popup'];
    loginDevice = json['login_device'];
    appVersion = json['app_version'];
    lastLogin = json['last_login'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['name'] = this.name;
    data['auth_key'] = this.authKey;
    data['password_hash'] = this.passwordHash;
    data['password_reset_token'] = this.passwordResetToken;
    data['email'] = this.email;
    data['mobile_no'] = this.mobileNo;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['rank_id'] = this.rankId;
    data['emp_num'] = this.empNum;
    data['is_updated'] = this.isUpdated;
    data['added_by'] = this.addedBy;
    data['updated_by'] = this.updatedBy;
    data['last_visited_news_created_at'] = this.lastVisitedNewsCreatedAt;
    data['is_user_notification_alert'] = this.isUserNotificationAlert;
    data['is_user_notification_secondary_employment'] =
        this.isUserNotificationSecondaryEmployment;
    data['is_user_notification_newswire'] = this.isUserNotificationNewswire;
    data['is_user_notification_apartmets'] = this.isUserNotificationApartmets;
    data['disable_apa_secondary_employment'] =
        this.disableApaSecondaryEmployment;
    data['accept_overtime_schedule_policy_procedure'] =
        this.acceptOvertimeSchedulePolicyProcedure;
    data['is_user_email_notification_secondary_employment'] =
        this.isUserEmailNotificationSecondaryEmployment;
    data['is_user_save_email_notification_popup'] =
        this.isUserSaveEmailNotificationPopup;
    data['login_device'] = this.loginDevice;
    data['app_version'] = this.appVersion;
    data['last_login'] = this.lastLogin;
    return data;
  }
}
