import 'package:apamobile/model/user_model.dart';

class LogInModel {
  LogInModel({
    this.settings,
    this.hasError = false,
    this.userID,
    this.error,
    this.user,
  });
  Settings? settings;
  bool? hasError;
  int? userID;
  String? error;
  UserModel? user;

  LogInModel.fromJson(Map<String, dynamic> json) {
    settings = Settings.fromJson(json['settings']);
    hasError = json['has_error'] == 0 ? true : false;
    userID = json['user_id'] ?? -99;
    error = json['error'] ?? "";
    user =
        json['user'] == null ? UserModel() : UserModel.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['settings'] = settings?.toJson() ?? Settings();
    _data['has_error'] = hasError;
    _data['user_id'] = userID;
    _data['error'] = error;
    _data['user'] = user;
    return _data;
  }
}

class Settings {
  Settings({
    this.id,
    this.adminName,
    this.adminEmail,
    this.siteTitle,
    this.contactEmail,
    this.contactName,
    this.contactPhone,
    this.siteLogo,
    this.siteFbLink,
    this.siteTwitterLink,
    this.siteGplusLink,
    this.siteLinkedinLink,
    this.sitePinterestLink,
    this.userCancellationStatus,
    this.appVersion,
    this.notifyPopup,
    this.deletedUserEmail,
    this.crimenetEmailTags,
    // this.createdAt,
    this.updatedAt,
  });
  int? id;
  String? adminName;
  String? adminEmail;
  String? siteTitle;
  String? contactEmail;
  String? contactName;
  String? contactPhone;
  String? siteLogo;
  String? siteFbLink;
  String? siteTwitterLink;
  String? siteGplusLink;
  String? siteLinkedinLink;
  String? sitePinterestLink;
  int? userCancellationStatus;
  String? appVersion;
  int? notifyPopup;
  String? deletedUserEmail;
  String? crimenetEmailTags;
  // Null createdAt;
  String? updatedAt;

  Settings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adminName = json['admin_name'];
    adminEmail = json['admin_email'];
    siteTitle = json['site_title'];
    contactEmail = json['contact_email'];
    contactName = json['contact_name'];
    contactPhone = json['contact_phone'];
    siteLogo = json['site_logo'];
    siteFbLink = json['site_fb_link'];
    siteTwitterLink = json['site_twitter_link'];
    siteGplusLink = json['site_gplus_link'];
    siteLinkedinLink = json['site_linkedin_link'];
    sitePinterestLink = json['site_pinterest_link'];
    userCancellationStatus = json['user_cancellation_status'];
    appVersion = json['app_version'];
    notifyPopup = json['notify_popup'];
    deletedUserEmail = json['deleted_user_email'];
    crimenetEmailTags = json['crimenet_email_tags'];
    //createdAt = null;
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['admin_name'] = adminName;
    _data['admin_email'] = adminEmail;
    _data['site_title'] = siteTitle;
    _data['contact_email'] = contactEmail;
    _data['contact_name'] = contactName;
    _data['contact_phone'] = contactPhone;
    _data['site_logo'] = siteLogo;
    _data['site_fb_link'] = siteFbLink;
    _data['site_twitter_link'] = siteTwitterLink;
    _data['site_gplus_link'] = siteGplusLink;
    _data['site_linkedin_link'] = siteLinkedinLink;
    _data['site_pinterest_link'] = sitePinterestLink;
    _data['user_cancellation_status'] = userCancellationStatus;
    _data['app_version'] = appVersion;
    _data['notify_popup'] = notifyPopup;
    _data['deleted_user_email'] = deletedUserEmail;
    _data['crimenet_email_tags'] = crimenetEmailTags;
    //_data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
