class CourtesyApartmentModel {
  CourtesyApartmentModel({
    required this.settings,
    required this.apartments,
  });
  late final Settings settings;
  late final List<Apartments> apartments;

  CourtesyApartmentModel.fromJson(Map<String, dynamic> json){
   // settings = Settings.fromJson(json['settings']);
    apartments = List.from(json['apartments']).map((e)=>Apartments.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['settings'] = settings.toJson();
    _data['apartments'] = apartments.map((e)=>e.toJson()).toList();
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
    this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String adminName;
  late final String adminEmail;
  late final String siteTitle;
  late final String contactEmail;
  late final String contactName;
  late final String contactPhone;
  late final String siteLogo;
  late final String siteFbLink;
  late final String siteTwitterLink;
  late final String siteGplusLink;
  late final String siteLinkedinLink;
  late final String sitePinterestLink;
  late final int userCancellationStatus;
  late final String appVersion;
  late final int notifyPopup;
  late final String deletedUserEmail;
  late final String crimenetEmailTags;
  late final Null createdAt;
  late final String updatedAt;

  Settings.fromJson(Map<String, dynamic> json){
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

class Apartments {
  Apartments({
    required this.id,
    required this.title,
    required this.description,
    required this.addedBy,
    required this.apartmentPhone,
    required this.apartmentImage,
    required this.apartmentLocation,
    required this.apartmentLatitude,
    required this.apartmentLongitude,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String title;
  late final String description;
  late final int addedBy;
  late final String apartmentPhone;
  late final String apartmentImage;
  late final String apartmentLocation;
  late final String apartmentLatitude;
  late final String apartmentLongitude;
  late final int status;
  late final int createdAt;
  late final int updatedAt;

  Apartments.fromJson(Map<String, dynamic> json){
    id = json['id'] ?? 0;
    title = json['title'] ?? "";
    description = json['description'] ?? "";
    addedBy = json['added_by'] ?? 0;
    apartmentPhone = json['apartment_phone'] ?? "";
    apartmentImage = json['apartment_image'] ?? "";
    apartmentLocation = json['apartment_location'] ?? "";
    apartmentLatitude = json['apartment_latitude'] ?? "";
    apartmentLongitude = json['apartment_longitude'] ?? "";
    status = json['status'] ?? 0;
    createdAt = json['created_at'] ?? 0;
    updatedAt = json['updated_at'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['description'] = description;
    _data['added_by'] = addedBy;
    _data['apartment_phone'] = apartmentPhone;
    _data['apartment_image'] = apartmentImage;
    _data['apartment_location'] = apartmentLocation;
    _data['apartment_latitude'] = apartmentLatitude;
    _data['apartment_longitude'] = apartmentLongitude;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}