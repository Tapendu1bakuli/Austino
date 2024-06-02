import 'dart:developer';
import 'dart:io';

import 'package:apamobile/Service/global_service.dart';
import 'package:apamobile/Service/one_signal_messaging_service.dart';
import 'package:apamobile/apiService/AuthServices.dart';
import 'package:apamobile/common/localStorage.dart';
import 'package:apamobile/common/ui.dart';
import 'package:apamobile/common/widgets/app_button.dart';
import 'package:apamobile/model/home_tabs.dart';
import 'package:apamobile/model/login_model.dart';
import 'package:apamobile/model/rank_model.dart';
import 'package:apamobile/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../common/widgets/custom_dialog.dart';
import '../../../routes/app_routes.dart';

class AuthController extends GetxController {
  TextEditingController phoneOrEmailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController phoneNumberTextController = TextEditingController();

  //Register Screen
  TextEditingController firstNameTextController = TextEditingController();
  TextEditingController lastNameTextController = TextEditingController();
  TextEditingController emailRegTextController = TextEditingController();
  TextEditingController employeeNumberTextController = TextEditingController();
  TextEditingController cellphoneTextController = TextEditingController();

  String _selected = "";
  final List<BasicUIModel> myRanks = [
    BasicUIModel.fromJson({
      "id": '0',
      "name": "-------Select Rank-------",
    }),
    BasicUIModel.fromJson({
      "id": '1',
      "name": "Retired",
    }),
    BasicUIModel.fromJson({
      "id": '2',
      "name": "Officers",
    }),
    BasicUIModel.fromJson({
      "id": '3',
      "name": "Detective",
    }),
    BasicUIModel.fromJson({
      "id": '4',
      "name": "Corporal",
    }),
    BasicUIModel.fromJson({
      "id": '5',
      "name": "Sergent",
    }),
    BasicUIModel.fromJson({
      "id": '6',
      "name": "Lieutenant",
    }),
    BasicUIModel.fromJson({
      "id": '7',
      "name": "Commander",
    }),
    BasicUIModel.fromJson({
      "id": '8',
      "name": "Assistant Chief",
    }),
    BasicUIModel.fromJson({
      "id": '9',
      "name": "Chief",
    }),
  ];

  // final Rx<User> currentUser = Get.find<AuthService>().user;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> forgotPasswordFormEmailKey = GlobalKey<FormState>();
  GlobalKey<FormState> forgotPasswordFormPhoneKey = GlobalKey<FormState>();

  // GlobalKey<FormState> salonFormKey;
  // var user = new User().obs;
  // final hidePassword = true.obs;
  final loading = false.obs;

  // final smsSent = ''.obs;
  // final selected = "".obs;
  // List<String> listName = <String>[];
  // List<String> list = <String>[];
  // String name;
  // String add;
  // String dsc;
  // double lat;
  // double lng;
  // String availRange;
  // String check;
  // String id;
  // String Uid;
  // String Uname;
  // PhoneNumber oldPhoneNum;
  // PhoneNumber oldMobileNum;
  late AuthService _authService;

  // Rx<int> secondsRemaining = 0.obs;
  // Rx<bool> enableResend = false.obs;
  // Timer timer;
  // String error;
  // Rx<bool> userVerified = false.obs;
  //
  // addTimer() {
  //   secondsRemaining.value = 30;
  //   if(timer != null && timer.isActive){
  //     timer.cancel();
  //   }
  //   timer = Timer.periodic(Duration(seconds: 1), (_) {
  //     if (secondsRemaining != 0) {
  //       secondsRemaining.value--;
  //     } else {
  //       enableResend.value = true;
  //     }
  //   });
  // }
  //
  AuthController() {
    _authService = AuthService();
    //  getAllRanks();
  }

  //
  // @override
  // Future<void> onInit() async {
  //   super.onInit();
  // }
  //
  // void setSelected(String value) {
  //   selected.value = value;
  // }
  //
  // void resendCode() {
  //   //other code here
  //   addTimer();
  //   secondsRemaining.value = 30;
  //   enableResend.value = false;
  // }
  //
  // @override
  // dispose() {
  //   timer.cancel();
  //   super.dispose();
  // }
  //

  //Login

  var SelectedRank = "------- Select Rank -------".obs;
  var SelectedRankId = 0.obs;

  String getSelectedRank() {
    String Selected = "------- Select Rank -------";
    for (int i = 0; i < myRanks.length; i++) {
      if (myRanks[i].isSelected = true) {
        Selected = myRanks[i].name ?? "------- Select Rank -------";
      }
    }
    return Selected;
  }

  Rank? ranks;
  getAllRanks() async {
    // loading.value = true;
    ranks = await _authService
        .getAllRanks()
        .whenComplete(() => loading.value = false);
    // loading.value = false;
  }

  @override
  void onInit() {
    getAllRanks();
    super.onInit();
  }

  gotoRegister() {
    // await getAllRanks();
    Get.toNamed(Routes.REGISTER);
  }

  var localStorage = new LocalStorage();
  void login() async {
    final status = await OneSignal.shared.getDeviceState();
    final String? osUserID = status?.userId;
    debugPrint("UserId:- $osUserID");
    Get.focusScope?.unfocus();
    if (loginFormKey.currentState?.validate() ?? false) {
      loginFormKey.currentState?.save();
      loading.value = true;
      LogInModel? loginModel = await _authService.login(
          email: phoneOrEmailTextController.text,
          password: passwordTextController.text,
          appVersion: Get.find<GlobalService>().getPlatformVersion(),
          deviceType: Get.find<GlobalService>().getPlatformCode(),
          onesignalPlayerId: osUserID);
      //onesignalPlayerId: "onesignalPlayerId");

      if (loginModel == null) {
        loading.value = false;
        Get.defaultDialog(
            title: "Login Failed!",
            middleText: "Please enter valid credentials!!",
            backgroundColor: Colors.white,
            titleStyle: TextStyle(color: Colors.black),
            middleTextStyle: TextStyle(color: Colors.black),
            radius: 5,
            confirm: ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("OK")));
      } else {
        await localStorage.loginUser(loginModel.user!);
        Get.toNamed(Routes.HOME);
        // if (loginModel?.hasError ?? false) {
        //
        // }
        // else {
        //   Get.defaultDialog(
        //       title: "Login Failed!",
        //       middleText: "Please enter valid credentials!!",
        //       backgroundColor: Colors.white,
        //       titleStyle: TextStyle(color: Colors.black),
        //       middleTextStyle: TextStyle(color: Colors.black),
        //       radius: 5,
        //       confirm: ElevatedButton(onPressed: () {
        //         Get.back();
        //       }, child: Text("OK"))
        //
        //   );
        // }
      }
    }
  }

  //Contact Support
  sendSupportMail() {
    String encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'support@apaapp.org',
      query: encodeQueryParameters(<String, String>{
        'subject': 'Support Request',
      }),
    );

    launchUrl(emailLaunchUri);
  }

  //Forgot Password
  Future<bool> forgotPassword() async {
    bool result = false;
    Get.focusScope?.unfocus();
    loading.value = true;
    GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();
    if (emailTextController.text.isEmpty) {
      forgotPasswordFormKey = forgotPasswordFormPhoneKey;
    } else {
      forgotPasswordFormKey = forgotPasswordFormEmailKey;
    }
    if (forgotPasswordFormKey.currentState?.validate() ?? false) {
      forgotPasswordFormKey.currentState?.save();
      loading.value = true;
      result = await _authService.forgotPassword(
          email: emailTextController.text,
          phoneNumber: phoneNumberTextController.text);
      loading.value = false;
    }

    return result;
  }

//
  Future<bool> register() async {
    bool result = false;
    registerFormKey.currentState?.reset();
    bool? isvalidated = registerFormKey.currentState?.validate();
    if (isvalidated ?? false) {
      loading.value = true;

      UserModel user = UserModel(
          firstName: firstNameTextController.text.trim(),
          lastName: lastNameTextController.text,
          email: emailRegTextController.text.trim(),
          empNum: employeeNumberTextController.text.trim(),
          mobileNo: cellphoneTextController.text.trim(),
          rankId: SelectedRankId.value);
      result = await _authService.registerUser(user);

      loading.value = false;
    }
    return result;
  }
//         addTimer();
//         await Get.toNamed(Routes.PHONE_VERIFICATION);
//       } catch (e) {
//         Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
//       } finally {
//         loading.value = false;
//       }
//     } else {
//       loading.value = false;
//       Get.showSnackbar(
//           Ui.ErrorSnackBar(message: "Should be a valid phone".tr));
//     }
//   }
// }
//
// void registration() async {
//   Get.focusScope.unfocus();
//   if (salonFormKey.currentState.validate()) {
//     salonFormKey.currentState.save();
//     loading.value = true;
//     try {
//       dsc = Get.find<SettingsService>().address.value.description == null
//           ? Get.find<SettingsService>().address.value.address
//           : Get.find<SettingsService>().address.value.description;
//       add = Get.find<SettingsService>().address.value.address;
//       lat = Get.find<SettingsService>().address.value.latitude;
//       lng = Get.find<SettingsService>().address.value.longitude;
//       if (name.isEmpty ||
//           oldPhoneNum.completeNumber.isEmpty ||
//           oldMobileNum.completeNumber.isEmpty ||
//           availRange.isEmpty ||
//           lat.toString().isEmpty ||
//           lng.toString().isEmpty ||
//           add.toString().isEmpty ||
//           Uid.toString().isEmpty ||
//           dsc.isEmpty) {
//         Get.showSnackbar(Ui.ErrorSnackBar(
//             message:
//                 "There are errors in some fields please correct them!".tr));
//       } else {
//         bool status = await _userRepository.SalonSignUp(
//             name,
//             2,
//             oldPhoneNum.completeNumber,
//             oldMobileNum.completeNumber,
//             availRange,
//             lat,
//             lng,
//             add,
//             Uid,
//             dsc);
//         loading.value = false;
//         Get.find<AuthService>().user.value.address = Address(
//             address: add,
//             description: dsc,
//             latitude: lat,
//             longitude: lng,
//             userId: Uid,
//             isDefault: false);
//         await Get.showSnackbar(Ui.SuccessSnackBar(
//             message: status
//                 ? "Your salon added successfully, Please login".tr
//                 : "Your Salon not added, Please contact customer care".tr));
//         await Get.toNamed(Routes.ROOT, arguments: 0);
//       }
//     } catch (e) {
//       Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
//     } finally {
//       loading.value = false;
//     }
//   }
// }
//
// Future<void> verifyPhone() async {
//   try {
//     loading.value = true;
//     if(smsSent.value.isEmpty){
//       Get.showSnackbar(Ui.ErrorSnackBar(message: "Please enter an OTP"));
//     }else {
//       await _userRepository.verifyPhone(smsSent.value);
//       if (userVerified.value) {
//         await Get.find<FireBaseMessagingService>().setDeviceToken();
//         currentUser.value = await _userRepository.register(currentUser.value);
//         Uid = currentUser.value.id;
//         Uname = currentUser.value.name;
//         oldPhoneNum = currentUser.value.getPhoneNumber();
//         oldMobileNum = currentUser.value.getPhoneNumber();
//         await _userRepository.signUpWithEmailAndPassword(
//             currentUser.value.email, currentUser.value.apiToken);
//         await Get.find<AuthService>().removeCurrentUser();
//         loading.value = false;
//         user.value = Get
//             .find<AuthService>()
//             .user
//             .value;
//         if (Get.isRegistered<RootController>()) {
//           await Get.find<RootController>().getCurrentPosition();
//         } else {
//           RootController rootController = Get.put(RootController());
//           rootController.getCurrentPosition();
//         }
//         await Get.toNamed(Routes.REGISTRATION);
//         // await Get.toNamed(Routes.LOGIN);
//       }
//     }
//   } catch (e) {
//     loading.value = false;
//     Get.find<AuthController>().userVerified.value = false;
//     Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
//   } finally {
//     loading.value = false;
//   }
// }
//
// Future<void> resendOTPCode() async {
//   resendCode();
//   await _userRepository.sendCodeToPhone();
// }
//
// void sendResetLink() async {
//   Get.focusScope.unfocus();
//   if (forgotPasswordFormKey.currentState.validate()) {
//     forgotPasswordFormKey.currentState.save();
//     loading.value = true;
//     await _userRepository
//         .sendResetLinkEmail(currentUser.value)
//         .then((value) => Timer(Duration(seconds: 5), () {
//               Get.offAndToNamed(Routes.LOGIN);
//             }));
//     loading.value = false;
//   }
// }
}
