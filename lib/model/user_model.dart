class UserModel {
  UserModel({
     this.id,
     this.username,
     this.firstName,
     this.lastName,
     this.name,
     this.authKey,
     this.passwordHash,
   // this.passwordResetToken,
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
     this.lastLogin,
  });
  int? id;
  String? username;
   String? firstName;
   String? lastName;
   String? name;
   String? authKey;
   String? passwordHash;
   //Null passwordResetToken;
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

  UserModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    name = json['name'];
    authKey = json['auth_key'];
    passwordHash = json['password_hash'];
   // passwordResetToken = null;
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
    isUserNotificationSecondaryEmployment = json['is_user_notification_secondary_employment'];
    isUserNotificationNewswire = json['is_user_notification_newswire'];
    isUserNotificationApartmets = json['is_user_notification_apartmets'];
    disableApaSecondaryEmployment = json['disable_apa_secondary_employment'];
    acceptOvertimeSchedulePolicyProcedure = json['accept_overtime_schedule_policy_procedure'];
    isUserEmailNotificationSecondaryEmployment = json['is_user_email_notification_secondary_employment'];
    isUserSaveEmailNotificationPopup = json['is_user_save_email_notification_popup'];
    loginDevice = json['login_device'];
    appVersion = json['app_version'];
    lastLogin = json['last_login'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['username'] = username;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['name'] = name;
    _data['auth_key'] = authKey;
    _data['password_hash'] = passwordHash;
   // _data['password_reset_token'] = passwordResetToken;
    _data['email'] = email;
    _data['mobile_no'] = mobileNo;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['rank_id'] = rankId;
    _data['emp_num'] = empNum;
    _data['is_updated'] = isUpdated;
    _data['added_by'] = addedBy;
    _data['updated_by'] = updatedBy;
    _data['last_visited_news_created_at'] = lastVisitedNewsCreatedAt;
    _data['is_user_notification_alert'] = isUserNotificationAlert;
    _data['is_user_notification_secondary_employment'] = isUserNotificationSecondaryEmployment;
    _data['is_user_notification_newswire'] = isUserNotificationNewswire;
    _data['is_user_notification_apartmets'] = isUserNotificationApartmets;
    _data['disable_apa_secondary_employment'] = disableApaSecondaryEmployment;
    _data['accept_overtime_schedule_policy_procedure'] = acceptOvertimeSchedulePolicyProcedure;
    _data['is_user_email_notification_secondary_employment'] = isUserEmailNotificationSecondaryEmployment;
    _data['is_user_save_email_notification_popup'] = isUserSaveEmailNotificationPopup;
    _data['login_device'] = loginDevice;
    _data['app_version'] = appVersion;
    _data['last_login'] = lastLogin;
    return _data;
  }
}