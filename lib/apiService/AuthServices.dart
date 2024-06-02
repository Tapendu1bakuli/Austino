import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:apamobile/model/login_model.dart';
import 'package:apamobile/model/rank_model.dart';
import 'package:get/get.dart';
import '../Service/CoreService.dart';
import '../Service/GlobalKeys.dart';
import '../Service/one_signal_messaging_service.dart';
import '../common/ui.dart';
import '../model/registraton_error_model.dart';
import '../model/user_model.dart';

class AuthService {
  //Login
  login(
      {String? onesignalPlayerId,
      String? deviceType,
      String? appVersion,
      String? email,
      String? password}) async {
    LogInModel? result = LogInModel();

    Map data = {
      "onesignal_player_id": onesignalPlayerId, //"onesignalPlayerId",
      "device_type": deviceType,
      "app_version": appVersion,
      "email": email,
      "password": password,
    };
    try {
      final response = await CoreService().apiService(
        endpoint: GlobalKeys.LOGIN,
        body: data,
      );

      //Get.showSnackbar(Ui.loadingSnackBar(isLoading: false));

      if (response["has_error"] == 0) {
        result = LogInModel.fromJson(response);
      } else {
        result = null;
      }
    } catch (e) {
      result = null;
    }
    return result;
  }

  Future<Rank> getAllRanks() async {
    var result;
    final response = await CoreService().apiService(
      method: METHOD.POST,
      endpoint: GlobalKeys.RANKLIST,
    );
    // var parsed = json.decode(utf8.decode(response.bodyBytes));
    result = Rank.fromJson(response);

    return result;
  }

  Future removeAllUsersLogin({
    int? userId,
  }) async {
    Map data = {
      "user_id": userId,
    };
    final response = await CoreService().apiService(
      endpoint: GlobalKeys.REMOVE_ALL_USERS_LOGIN,
      body: data,
    );
    var result = LogInModel();
    //Get.showSnackbar(Ui.loadingSnackBar(isLoading: false));
    try {
      result = LogInModel.fromJson(response);
    } catch (e) {
      log("Error while parsing:$e");
    }
    return result;
  }

  forgotPassword({String? email, String? phoneNumber}) async {
    var result = true;
    Map data = {
      "email": email,
      "mobile_no": phoneNumber,
    };
    try {
      final response = await CoreService().apiService(
        endpoint: GlobalKeys.FORGOT_PASSWORD,
        body: data,
      );

      if (response["info"] == "Check your email for further instructions." ||
          response["info"] == "Check your mobile for further instructions.") {
      } else {
        result = false;
      }
    } catch (ex) {
      result = false;
    }

    return result;
  }

  registerUserhttp(UserModel user) async {
    UserModel result = new UserModel();
    String? playerId = Get.find<OneSignalMessagingService>().playerId;
    // String? deviceToken = (await FirebaseMessaging.instance.getToken())!;
    Map data = {
      "first_name": user.firstName,
      "last_name": user.lastName,
      "onesignal_player_id": playerId,
      "email": user.email,
      //"password": "123456",
      "rank_id": user.rankId.toString(),
      "emp_num": user.empNum.toString(),
      "mobile_no": user.mobileNo.toString()
    };
    // var body = json.encode(data);
    print(data);

    try {
      final response = await http.post(
        Uri.parse("www.apaapp.org/api/web/v3/user/register"),
        body: data,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var parsed = json.decode(utf8.decode(response.bodyBytes));

        String? status = parsed["message"];
        if (status == "Success") {
          result = UserModel.fromJson(parsed["data"]["user"]);
          //  result.accessToken = parsed["data"]["token"];
          // result.status = parsed["message"];
        } else {
          var parsed = json.decode(utf8.decode(response.bodyBytes));
          result = UserModel(status: 500);
        }
      } else {
        var parsed = json.decode(utf8.decode(response.bodyBytes));
        result = UserModel(status: 404);
      }
    } catch (e) {
      log(e.toString());
    }
    return result;
  }

  registerUser(UserModel user) async {
    var result = true;
    String? playerId =
        "khkghgfh"; //"Get.find<OneSignalMessagingService>().playerId;

    //print("LANG: ${user.lang}");
    Map data = {
      "first_name": user.firstName,
      "last_name": user.lastName,
      "onesignal_player_id": playerId,
      "email": user.email,
      //"password": "123456",
      "rank_id": user.rankId,
      "emp_num": user.empNum,
      "mobile_no": user.mobileNo,
      "device_type": "android"
    };
    try {
      final response = await CoreService().apiService(
        method: METHOD.POST,
        endpoint: GlobalKeys.REGISTER,
        body: data,
      );
      // "has_error" -> 1
      if (response["has_error"] != 1) {
      } else {
        RegistrationErrorModel errorresult =
            RegistrationErrorModel.fromJson(response);
        Get.defaultDialog(
            title: "Error",
            middleText: errorresult.errors?.errors![0],
            backgroundColor: Colors.white,
            titleStyle: TextStyle(color: Colors.black),
            middleTextStyle: TextStyle(color: Colors.black),
            radius: 5);
        // Get.showSnackbar(Ui.ErrorSnackBar(message: "Please enter a valid input."));
        // result = new UserModel(status: response["status"], msg: response["error"]);
        result = false;
      }

      return result;
    } catch (ex) {
      // Get.showSnackbar(Ui.ErrorSnackBar(message: "Please enter a valid input."));
      return false;
    }
  }

  /*resendOTP(String? email) async {
    final response = await CoreService().apiService(
        method: METHOD.GET,
        endpoint: GlobalKeys.RESEND_OTP,
        params: {"email": email});

    return response;
  }

  verifyOTP(String? email) async {
    final response = await CoreService().apiService(
        method: METHOD.GET,
        endpoint: GlobalKeys.VERIFY_OTP,
        params: {"email": email});

    return response;
  }

  verifyEmail(String? email) async {
    Map data = {"email": email};

    final response = await CoreService().apiService(
      method: METHOD.POST,
      endpoint: GlobalKeys.FORGOT_PASSWORD,
      body: data,
    );

    return response;
  }

  resetPassword(String? email, String? password) async {
    Map data = {"email": email, "newPassword": password};
    final response = await CoreService().apiService(
      method: METHOD.POST,
      endpoint: GlobalKeys.RESET_PASSWORD,
      body: data,
    );

    return response;
  }*/
}
