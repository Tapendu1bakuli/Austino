class ForgotPasswordModel {
  ForgotPasswordModel({
    required this.settings,
    required this.info,
  });
  Settings settings;
  String info;

  ForgotPasswordModel.fromJson(Map<String, dynamic> json, this.settings, this.info){
    settings = Settings.fromJson(json['settings']);
    info = json['info'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['settings'] = settings.toJson();
    _data['info'] = info;
    return _data;
  }
}

class Settings {
  Settings({
    required this.id,
    required this.adminName,
    required this.adminEmail,
    required this.siteTitle,
    required this.contactEmail,
    required this.contactName,
    required this.contactPhone,
    required this.siteLogo,
    required this.siteFbLink,
    required this.siteTwitterLink,
    required this.siteGplusLink,
    required this.siteLinkedinLink,
    required this.sitePinterestLink,
    required this.userCancellationStatus,
    required this.appVersion,
    required this.notifyPopup,
    required this.deletedUserEmail,
    required this.crimenetEmailTags,
    required this.createdAt,
    required this.updatedAt,
  });
   late int id;
  late String adminName;
  late String adminEmail;
  late String siteTitle;
  late String contactEmail;
  late String contactName;
  late String contactPhone;
  late String siteLogo;
  late String siteFbLink;
  late String siteTwitterLink;
  late String siteGplusLink;
  late String siteLinkedinLink;
  late String sitePinterestLink;
  late int userCancellationStatus;
  late String appVersion;
  late int notifyPopup;
  late String deletedUserEmail;
  late String crimenetEmailTags;
  late Null createdAt;
  late String updatedAt;

  Settings.fromJson(Map<String, dynamic> json,){
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
    createdAt = null;
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
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}