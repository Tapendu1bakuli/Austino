class Rank {
  Settings? settings;
  List<Ranks> ranks = <Ranks>[];

  Rank({this.settings, this.ranks = const <Ranks>[]});

  Rank.fromJson(Map<String, dynamic> json) {
    settings = json['settings'] != null
        ? new Settings.fromJson(json['settings'])
        : null;
    if (json['ranks'] != null) {
      ranks = <Ranks>[];
      json['ranks'].forEach((v) {
        ranks.add(new Ranks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.settings != null) {
      data['settings'] = settings?.toJson();
    }
    if (this.ranks != null) {
      data['ranks'] = ranks.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Settings {
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
  Null? createdAt;
  String? updatedAt;

  Settings(
      {this.id,
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
      this.createdAt,
      this.updatedAt});

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
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['admin_name'] = this.adminName;
    data['admin_email'] = this.adminEmail;
    data['site_title'] = this.siteTitle;
    data['contact_email'] = this.contactEmail;
    data['contact_name'] = this.contactName;
    data['contact_phone'] = this.contactPhone;
    data['site_logo'] = this.siteLogo;
    data['site_fb_link'] = this.siteFbLink;
    data['site_twitter_link'] = this.siteTwitterLink;
    data['site_gplus_link'] = this.siteGplusLink;
    data['site_linkedin_link'] = this.siteLinkedinLink;
    data['site_pinterest_link'] = this.sitePinterestLink;
    data['user_cancellation_status'] = this.userCancellationStatus;
    data['app_version'] = this.appVersion;
    data['notify_popup'] = this.notifyPopup;
    data['deleted_user_email'] = this.deletedUserEmail;
    data['crimenet_email_tags'] = this.crimenetEmailTags;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Ranks {
  int? id;
  String? title;
  int? status;
  int? createdAt;
  int? updatedAt;
  int? sortByWeb;
  bool isSelected = false;

  Ranks(
      {this.id,
      this.title,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.sortByWeb,
      isSelected = false});

  Ranks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    sortByWeb = json['sort_by_web'];
    isSelected = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['sort_by_web'] = this.sortByWeb;
    return data;
  }
}
