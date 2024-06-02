import 'package:intl/intl.dart';

class HomeTabResponseModel {
  Settings? settings;
  List<NotificationsArr>? notificationsArr;

  HomeTabResponseModel({this.settings, this.notificationsArr});

  HomeTabResponseModel.fromJson(Map<String, dynamic> json) {
    settings = json['settings'] != null
        ? new Settings.fromJson(json['settings'])
        : null;
    if (json['notifications_arr'] != null) {
      notificationsArr = <NotificationsArr>[];
      json['notifications_arr'].forEach((v) {
        notificationsArr!.add(new NotificationsArr.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.settings != null) {
      data['settings'] = this.settings!.toJson();
    }
    if (this.notificationsArr != null) {
      data['notifications_arr'] =
          this.notificationsArr!.map((v) => v.toJson()).toList();
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

class NotificationsArr {
  int? id;
  String? title;
  String? description;
  int? addedBy;
  String? newsImage;
  String? youtubeUrl;
  int? status;
  int? createdAt;
  int? updatedAt;
  String? notificationType;
  String? addedDate;
  String? apartmentPhone;
  String? apartmentImage;
  String? apartmentLocation;
  String? apartmentLatitude;
  String? apartmentLongitude;
  int? vendorId;
  String? postedDate;
  String? startTime;
  String? endTime;
  String? addressLocation;
  String? addressLatitude;
  String? addressLongitude;
  String? contactName;
  String? contactNumber;
  String? noOfHours;
  String? officerHourlyRate;
  String? supervisorHourlyRate;
  int? officersRequired;
  int? supervisorRequired;
  String? details;
  VendorDetails? vendorDetails;
  SignUps? signUps;

  NotificationsArr(
      {this.id,
      this.title,
      this.description,
      this.addedBy,
      this.newsImage,
      this.youtubeUrl,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.notificationType,
      this.addedDate,
      this.apartmentPhone,
      this.apartmentImage,
      this.apartmentLocation,
      this.apartmentLatitude,
      this.apartmentLongitude,
      this.vendorId,
      this.postedDate,
      this.startTime,
      this.endTime,
      this.addressLocation,
      this.addressLatitude,
      this.addressLongitude,
      this.contactName,
      this.contactNumber,
      this.noOfHours,
      this.officerHourlyRate,
      this.supervisorHourlyRate,
      this.officersRequired,
      this.supervisorRequired,
      this.details,
      this.vendorDetails,
      this.signUps});

  NotificationsArr.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    addedBy = json['added_by'];
    newsImage = json['news_image'];
    youtubeUrl = json['youtube_url'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    notificationType = json['notification_type'];
    addedDate = parse(
        dateTime: json['added_date'], returnFormat: "EE / MMM d yyyy h:mm a");
    apartmentPhone = json['apartment_phone'];
    apartmentImage = json['apartment_image'];
    apartmentLocation = json['apartment_location'];
    apartmentLatitude = json['apartment_latitude'];
    apartmentLongitude = json['apartment_longitude'];
    vendorId = json['vendor_id'];
    postedDate = json['posted_date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    addressLocation = json['address_location'];
    addressLatitude = json['address_latitude'];
    addressLongitude = json['address_longitude'];
    contactName = json['contact_name'];
    contactNumber = json['contact_number'];
    noOfHours = json['no_of_hours'];
    officerHourlyRate = json['officer_hourly_rate'];
    supervisorHourlyRate = json['supervisor_hourly_rate'];
    officersRequired = json['officers_required'];
    supervisorRequired = json['supervisor_required'];
    details = json['details'];
    vendorDetails = json['vendor_details'] != null
        ? new VendorDetails.fromJson(json['vendor_details'])
        : null;
    signUps = json['sign_ups'] != null
        ? new SignUps.fromJson(json['sign_ups'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['added_by'] = this.addedBy;
    data['news_image'] = this.newsImage;
    data['youtube_url'] = this.youtubeUrl;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['notification_type'] = this.notificationType;
    data['added_date'] = this.addedDate;
    data['apartment_phone'] = this.apartmentPhone;
    data['apartment_image'] = this.apartmentImage;
    data['apartment_location'] = this.apartmentLocation;
    data['apartment_latitude'] = this.apartmentLatitude;
    data['apartment_longitude'] = this.apartmentLongitude;
    data['vendor_id'] = this.vendorId;
    data['posted_date'] = this.postedDate;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['address_location'] = this.addressLocation;
    data['address_latitude'] = this.addressLatitude;
    data['address_longitude'] = this.addressLongitude;
    data['contact_name'] = this.contactName;
    data['contact_number'] = this.contactNumber;
    data['no_of_hours'] = this.noOfHours;
    data['officer_hourly_rate'] = this.officerHourlyRate;
    data['supervisor_hourly_rate'] = this.supervisorHourlyRate;
    data['officers_required'] = this.officersRequired;
    data['supervisor_required'] = this.supervisorRequired;
    data['details'] = this.details;
    if (this.vendorDetails != null) {
      data['vendor_details'] = this.vendorDetails!.toJson();
    }
    if (this.signUps != null) {
      data['sign_ups'] = this.signUps!.toJson();
    }
    return data;
  }
}

class VendorDetails {
  int? id;
  String? companyName;
  String? contactName;
  String? contractExpires;
  String? contactNumber;
  String? addressLocation;
  String? addressLatitude;
  String? addressLongitude;
  int? status;
  int? createdAt;
  int? updatedAt;

  VendorDetails(
      {this.id,
      this.companyName,
      this.contactName,
      this.contractExpires,
      this.contactNumber,
      this.addressLocation,
      this.addressLatitude,
      this.addressLongitude,
      this.status,
      this.createdAt,
      this.updatedAt});

  VendorDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyName = json['company_name'];
    contactName = json['contact_name'];
    contractExpires = json['contract_expires'];
    contactNumber = json['contact_number'];
    addressLocation = json['address_location'];
    addressLatitude = json['address_latitude'];
    addressLongitude = json['address_longitude'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['company_name'] = this.companyName;
    data['contact_name'] = this.contactName;
    data['contract_expires'] = this.contractExpires;
    data['contact_number'] = this.contactNumber;
    data['address_location'] = this.addressLocation;
    data['address_latitude'] = this.addressLatitude;
    data['address_longitude'] = this.addressLongitude;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class SignUps {
  int? officers;
  int? supervisors;
  List<int>? signupUserIds;

  SignUps({this.officers, this.supervisors, this.signupUserIds});

  SignUps.fromJson(Map<String, dynamic> json) {
    officers = json['officers'];
    supervisors = json['supervisors'];
    signupUserIds = json['signup_user_ids'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['officers'] = this.officers;
    data['supervisors'] = this.supervisors;
    data['signup_user_ids'] = this.signupUserIds;
    return data;
  }
}

String parse({String? dateTime, String? returnFormat}) {
  DateTime dt = DateTime.parse(dateTime!).toLocal();
  DateFormat dateFormat = DateFormat(returnFormat);
  String returnDT = dateFormat.format(dt);
  return returnDT;
}
