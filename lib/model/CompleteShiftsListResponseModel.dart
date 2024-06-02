import 'package:apamobile/common/device_manager/data_time_utilities.dart';
import 'package:intl/intl.dart';

class CompleteShiftsListResponseModel {
  List<OvertimeSchedules>? overtimeSchedules;

  CompleteShiftsListResponseModel({this.overtimeSchedules});

  CompleteShiftsListResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['overtime_schedules'] != null) {
      overtimeSchedules = <OvertimeSchedules>[];
      json['overtime_schedules'].forEach((v) {
        overtimeSchedules!.add(new OvertimeSchedules.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.overtimeSchedules != null) {
      data['overtime_schedules'] =
          this.overtimeSchedules!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OvertimeSchedules {
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
  List<SignUps>? signUps;
  bool? isOpen = false;

  OvertimeSchedules(
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
      this.isOpen});

  OvertimeSchedules.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vendorId = json['vendor_id'];
    postedDate = parse(
        dateTime: json['posted_date'].toString(),
        returnFormat: "EE / MMM d yyyy");
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
    vendorDetails = json['vendor_details'] == null
        ? null
        : VendorDetails.fromJson(json['vendor_details']);
    if (json['sign_ups'] != null) {
      signUps = <SignUps>[];
      json['sign_ups'].forEach((v) {
        signUps!.add(new SignUps.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
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
    data['added_by'] = this.addedBy;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.vendorDetails != null) {
      data['vendor_details'] = this.vendorDetails!.toJson();
    }
    if (this.signUps != null) {
      data['sign_ups'] = this.signUps!.map((v) => v.toJson()).toList();
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
  String? createdAt;
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
    var date = DateTime.fromMillisecondsSinceEpoch(json['created_at'] * 1000);
    createdAt =
        parse(dateTime: date.toString(), returnFormat: "EE / MMM d yyyy");

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
  int? id;
  int? userId;
  String? signUpType;
  int? shiftId;
  int? createdAt;
  int? updatedAt;
  String? createdTime;
  int? addedByUserId;
  SignUpUserData? user;

  SignUps(
      {this.id,
      this.userId,
      this.signUpType,
      this.shiftId,
      this.createdAt,
      this.updatedAt,
      this.createdTime,
      this.addedByUserId,
      this.user});

  SignUps.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    signUpType = json['sign_up_type'];
    shiftId = json['shift_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdTime = json['created_time'];
    addedByUserId = json['added_by_user_id'];
    user =
        json['user'] != null ? new SignUpUserData.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['sign_up_type'] = this.signUpType;
    data['shift_id'] = this.shiftId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['created_time'] = this.createdTime;
    data['added_by_user_id'] = this.addedByUserId;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class SignUpUserData {
  int? id;
  String? firstName;
  String? lastName;
  String? name;
  String? email;
  String? mobileNo;
  int? rankId;
  String? empNum;

  SignUpUserData(
      {this.id,
      this.firstName,
      this.lastName,
      this.name,
      this.email,
      this.mobileNo,
      this.rankId,
      this.empNum});

  SignUpUserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    name = json['name'];
    email = json['email'];
    mobileNo = json['mobile_no'];
    rankId = json['rank_id'];
    empNum = json['emp_num'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile_no'] = this.mobileNo;
    data['rank_id'] = this.rankId;
    data['emp_num'] = this.empNum;
    return data;
  }
}

String parse({String? dateTime, String? returnFormat}) {
  DateTime dt = DateTime.parse(dateTime!).toLocal();
  DateFormat dateFormat = DateFormat(returnFormat);
  String returnDT = dateFormat.format(dt);
  return returnDT;
}
