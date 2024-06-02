class OpenShiftModel {
  OpenShiftModel({
    required this.allOvertimeSchedule,
    required this.settings,
  });
  Settings? settings;
  late final Map<String, dynamic> allOvertimeSchedule;
  late final List<OpenShiftData> data;
  OpenShiftModel.fromJson(Map<String, dynamic> json) {
    settings = json['settings'] != null
        ? new Settings.fromJson(json['settings'])
        : null;
    if (json['all_overtime_schedules'] != null) {
      // If it's not null, assign it to allOvertimeSchedule
      allOvertimeSchedule = json['all_overtime_schedules'];
      // Now you can create data using allOvertimeSchedule
    } else {
      // If it's null, handle the situation accordingly
      // For example, set data to an empty list or handle it as needed
      //allOvertimeSchedule = null;
      allOvertimeSchedule = {};
    }
    data = getdata(allOvertimeSchedule);
  }

  List<OpenShiftData> getdata(Map<String, dynamic> mapValue) {
    List<OpenShiftData> data = [];
    mapValue.forEach((key, value) {
      List<OpenShiftDetails> openShiftList = [];
      value.forEach((item) {
        OpenShiftDetails openDetails = OpenShiftDetails(
            id: item['id'],
            vendorId: item['vendor_id'],
            postedDate: item['posted_date'],
            startTime: item['start_time'],
            endTime: item['end_time'],
            addressLocation: item['address_location'],
            addressLatitude: item['address_latitude'],
            addressLongitude: item['address_longitude'],
            contactName: item['contact_name'],
            contactNumber: item['contact_number'],
            noOfHours: item['no_of_hours'],
            officerHourlyRate: item['officer_hourly_rate'],
            supervisorHourlyRate: item['supervisor_hourly_rate'],
            officersRequired: item['officers_required'],
            supervisorRequired: item['supervisor_required'],
            details: item['details'],
            addedBy: item['added_by'],
            status: item['status'],
            createdAt: item['created_at'],
            updatedAt: item['updated_at'],
            vendorDetails: VendorDetails.fromJson(item['vendor_details']),
            signUps: SignUps.fromJson(item['sign_ups']),
            signupUserIds: item['signup_user_ids'].cast<int>());
        openShiftList.add(openDetails);
      });
      data.add(OpenShiftData(name: key, openShiftDetailsList: openShiftList));
    });

    return data;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
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

class OpenShiftData {
  final String name;

  final List<OpenShiftDetails> openShiftDetailsList;

  OpenShiftData({required this.name, required this.openShiftDetailsList});
}

class OpenShiftDetails {
  int? id;
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
  int? addedBy;
  int? status;
  int? createdAt;
  int? updatedAt;
  VendorDetails? vendorDetails;
  SignUps? signUps;
  List<int>? signupUserIds;

  OpenShiftDetails(
      {this.id,
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
      this.addedBy,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.vendorDetails,
      this.signUps,
      this.signupUserIds});

  OpenShiftDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
    addedBy = json['added_by'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    vendorDetails = json['vendor_details'] != null
        ? VendorDetails.fromJson(json['vendor_details'])
        : null;
    signUps =
        json['sign_ups'] != null ? SignUps.fromJson(json['sign_ups']) : null;
    signupUserIds = json['signup_user_ids'].cast<int>();
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
}

class SignUps {
  int? officers;
  int? supervisors;

  SignUps({this.officers, this.supervisors});

  SignUps.fromJson(Map<String, dynamic> json) {
    officers = json['officers'];
    supervisors = json['supervisors'];
  }
}
