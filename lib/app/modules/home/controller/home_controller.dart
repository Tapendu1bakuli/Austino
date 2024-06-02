import 'dart:async';

import 'package:apamobile/Service/CoreService.dart';
import 'package:apamobile/Service/global_service.dart';
import 'package:apamobile/apiService/HomeServices.dart';
import 'package:apamobile/app/modules/home/views/tabs/apa_overtime_tab_view.dart';
import 'package:apamobile/common/device_manager/colors.dart';
import 'package:apamobile/model/HeaderModel.dart';
import 'package:apamobile/model/telephone_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

import '../../../../Service/GlobalKeys.dart';
import '../../../../common/localStorage.dart';
import '../../../../model/AdimContactsListResponceModel.dart';
import '../../../../model/ChangePasswordSendModel.dart';
import '../../../../model/CompleteShiftsListResponseModel.dart';
import '../../../../model/ContactUsSubmitResponseModel.dart';
import '../../../../model/ContactUsSubmitSendModel.dart';
import '../../../../model/GetProfileResponseModel.dart';
import '../../../../model/HomeInstantAlertsDetailsResposeModel.dart';
import '../../../../model/HomeInstantAlertsDetailsSendModel.dart';
import '../../../../model/HomeTabResponseModel.dart';
import '../../../../model/MakeShiftSignUpResponseModel.dart';
import '../../../../model/NewswireModel.dart';
import '../../../../model/OpenShiftModel.dart';
import '../../../../model/ShiftCancelSendModel.dart';
import '../../../../model/ShiftSignUpSendModel.dart';
import '../../../../model/courtesy_apartment_model.dart';
import '../../../../model/NewswireDetailsResponseModel.dart';
import '../../../../model/NewswireDetailsSendModel.dart';
import '../../../../model/UpdateProfileSendModel.dart';
import '../../../../model/home_tabs.dart';
import '../../../../model/rank_model.dart';
import '../../../routes/app_routes.dart';
import '../views/tabs/courtsey_apartments_tab_view.dart';
import '../views/tabs/edit_profile_tab_view.dart';
import '../views/tabs/fallen_officers_tab_view.dart';
import '../views/tabs/contact_us_tab_view.dart';
import '../views/tabs/holidays_tab_view.dart';
import '../views/tabs/home_tab_view.dart';
import '../views/tabs/meetings_tab_view.dart';
import '../views/tabs/newswire_details.dart';
import '../views/tabs/newswire_tab_view.dart';
import '../views/tabs/pay_day_tab_view.dart';
import '../views/tabs/phone_directory_tab_view.dart';
import '../views/tabs/safe_drive_tab_view.dart';
import '../views/tabs/shift_change_tab_view.dart';

class HomeController extends GetxController {
  RxList<BasicUIModel> tabs = [
    BasicUIModel(indexId: 0, name: "Home"),
    BasicUIModel(indexId: 1, name: "APA Overtime"),
    BasicUIModel(indexId: 2, name: "Phone Directory"),
    BasicUIModel(indexId: 3, name: "Meetings"),
    //const MeetingTabView(),
    BasicUIModel(indexId: 4, name: "Shift Change Dates"),
    BasicUIModel(indexId: 5, name: "Holidays"),
    BasicUIModel(indexId: 6, name: "Pay Day Dates"),
    BasicUIModel(indexId: 7, name: "Safe Ride"),
    BasicUIModel(indexId: 8, name: "Payscales"),
    BasicUIModel(indexId: 9, name: "Police Contract"),
    BasicUIModel(indexId: 10, name: "Courtesy Apartments"),
    BasicUIModel(indexId: 11, name: "APA Newswire"),
    BasicUIModel(indexId: 12, name: "Fallen Officers"),
    BasicUIModel(indexId: 13, name: "Contact Us"),
    BasicUIModel(indexId: 14, name: "Edit Profile"),
  ].obs;
  // StatisticRepository _statisticRepository;
  // BookingRepository _bookingsRepository;

  // final statistics = <Statistic>[].obs;
  // final bookings = <Booking>[].obs;
  // final bookingStatuses = <BookingStatus>[].obs;
  final page = 0.obs;
  final isLoading = true.obs;
  final isDone = false.obs;
  //final currentStatus = '1'.obs;
  final isSafeRideYellow = true.obs;
  late ScrollController scrollController;

  // HomeController() {
  //   // _statisticRepository = StatisticRepository();
  //   // _bookingsRepository = BookingRepository();
  // }

  List<Widget> pages = [
    HomeTabView(), //0
    ApaOvertimeTabView(), //1
    const Center(
      child: Text(""),
    ), //2
    const MeetingTabView(), //3
    const ShiftDateTabView(), //4
    const HolidaysTabView(), //5
    const PayDayTabView(), //6
    const SafeDriveTabView(), //7
    Container(
      child: const Center(
        child: Text(""),
      ),
    ), //8
    Container(
      child: const Center(
        child: Text(""),
      ),
    ), //9
    CourtesyApartmentsTabView(), //10
    NewsWireTabView(),
    const FallenOfficersTabView(),
    ContactUsTabView(),
    EditProfileTabScreen()
  ];

  Widget get currentPage => pages[page.value];

  //This variables is for home view tab
  var homeTabViewListData = <NotificationsArr>[].obs;
  var instantAlertsDetails = HomeInstantAlertsDetailsResposeModel().obs;
  var newsWireDetails = NewswireDetailsResponseModel().obs;
  var isNewswireDetailsLoading = true.obs;
  var isinstantDetailsLoading = true.obs;
  var alertsId = "".obs;
  var tourCompleteCheck = false.obs;
//This variables is for contact us tab
  var selectContactTitle = "Select Contacts".obs;
  var selectContactId = "".obs;
  var userId = "".obs;
  var adminContactsList = <AdminUsers>[].obs;
  TextEditingController contactUsMessController = TextEditingController();
  //This variables is for edit profile view tab
  var getUserDetailsData = User().obs;
  var rankList = <Ranks>[].obs;
  var rankName = "".obs;
  var rankId = "".obs;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController employeeController = TextEditingController();
  TextEditingController cellPhoneController = TextEditingController();
  TextEditingController newPassWordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var isEditDetails = false.obs;
  var isChagePassword = false.obs;
  var rankName2 = "".obs;
  var rankId2 = "".obs;
  var newsWireId = "".obs;
  //This variables is for APA overtime view tab
  var completeOvertimeShiftList = <OvertimeSchedules>[].obs;
  var openShiftsTap = true.obs;
  var mtShiftsTap = false.obs;
  var openShiftDataList = <OpenShiftData>[].obs;

  var noMyShift = false.obs;

  var appVersion = "7.2".obs;
  var isNeedUpdate = false.obs;
  var pageCounter = 1.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    appVersion.value = Get.find<GlobalService>().getPlatformVersion();
    checkIsQuickTourCompleted();
    super.onInit();
  }

  checkIsQuickTourCompleted() async {
    final localStorage = LocalStorage();
    var isDone = await localStorage.getValue("tourDone");
    print("isDone:- $isDone");
    if (isDone == "true") {
      tourCompleteCheck.value = true;
    } else {
      tourCompleteCheck.value = false;
    }

    print("IsDone: $isDone");
  }

  @override
  void onClose() {
    scrollController.dispose();
  }

  Future refreshHome({bool showMessage = false, String statusId = "0"}) async {
    // await getBookingStatuses();
    // await getStatistics();
    // Get.find<RootController>().getNotificationsCount();
    //changeTab(statusId);
    if (showMessage) {
      // Get.showSnackbar(
      // Ui.SuccessSnackBar(message: "Home page refreshed successfully".tr));
    }
  }

  void initScrollController() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          !isDone.value) {
        // loadBookingsOfStatus(statusId: currentStatus.value);
      }
    });
  }

  safeDriveBackgeoundChange() {
    Timer _timer = Timer.periodic(const Duration(seconds: 10), (Timer t) {
      isSafeRideYellow.value = !isSafeRideYellow.value;
    });
  }

  HomeServices homeServices = HomeServices();
  late TelephoneModel contacts;

  void changeTab(int statusId) async {
    // this.bookings.clear();
    if (kDebugMode) {
      print("Status: $statusId");
    }
    switch (statusId) {
      case 0:
        {
          var localStorage = LocalStorage();
          userId.value = await localStorage.getValue("id");
          debugPrint("User iD= ${userId.value}");
          getHomeTabData();
        }
        break;

      case 1:
        {
          var localStorage = LocalStorage();
          userId.value = await localStorage.getValue("id");
          openShiftsTap.value = true;
          mtShiftsTap.value = false;
        }
        break;
      case 2:
        {
          contacts = homeServices.getAllContacts();
          Get.to(PhoneDirectoryTabView());
          print(contacts);
        }
        break;

      case 10:
        {
          getcourtesyApartmentListData();
          //statements;
        }
        break;

      default:
        {
          //statements;
        }
        break;
    }
    //currentStatus.value = statusId.toString() ?? currentStatus.value;

    if (statusId == 8) {
      //page.value = 8;
      const url =
          "https://www.apaapp.org/backend/web/upload/payscales/payscales.pdf";
      await UrlLauncher.launch(url.toString());
    } else if (statusId == 9) {
      //page.value = 9;
      const url =
          "https://www.apaapp.org/backend/web/upload/policecontract/policecontract.pdf";
      await UrlLauncher.launch(url.toString());
    } else if (statusId == 14) {
      Get.to(EditProfileTabScreen());
    } else {
      page.value = statusId;
    }

    // await loadBookingsOfStatus(statusId: currentStatus.value);
  }

  Future<bool> getHomeTabData() async {
    Get.dialog(
        Center(
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(40)),
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: CircularProgressIndicator(
                strokeWidth: 1.5,
                color: AppColors.appPrimaryColor,
              ),
            ),
          ),
        ),
        barrierDismissible: false);

    await getHomeTabApiCall().then((result) {
      Get.back();
      if (result is HomeTabResponseModel) {
        homeTabViewListData.assignAll(result.notificationsArr!);
        if (result.settings!.appVersion != appVersion.value) {
          isNeedUpdate.value = true;
        } else {
          isNeedUpdate.value = false;
        }
      }
    });
    if (isNeedUpdate.value) {
      return true;
    } else {
      return false;
    }
  }

  getHomeTabApiCall() async {
    var result = await CoreService().apiService(
      method: METHOD.POST,
      endpoint: GlobalKeys.GETHOMETABDATA,
    );

    return HomeTabResponseModel.fromJson(result);
  }

  getInstantAlertsData() async {
    Get.dialog(
        Center(
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(40)),
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: CircularProgressIndicator(
                strokeWidth: 1.5,
                color: AppColors.appPrimaryColor,
              ),
            ),
          ),
        ),
        barrierDismissible: false);

    await getInstantAlertsDataApiCall().then((result) {
      Get.back();
      if (result is HomeInstantAlertsDetailsResposeModel) {
        instantAlertsDetails.value = result;
        isinstantDetailsLoading.value = false;
      }
    });
  }

  getInstantAlertsDataApiCall() async {
    HomeInstantAlertsDetailsSendModel model =
        HomeInstantAlertsDetailsSendModel(alertId: alertsId.value);

    var result = await CoreService().apiService(
      method: METHOD.POST,
      body: model.toJson(),
      endpoint: GlobalKeys.INSTANTALERTDETAILS,
    );

    return HomeInstantAlertsDetailsResposeModel.fromJson(result);
  }

  getAdminContactsList() async {
    Get.dialog(
        Center(
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(40)),
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: CircularProgressIndicator(
                strokeWidth: 1.5,
                color: AppColors.appPrimaryColor,
              ),
            ),
          ),
        ),
        barrierDismissible: false);

    await getAdminContactsListApiCall().then((result) {
      Get.back();
      if (result is AdimContactsListResponceModel) {
        selectContactTitle.value = "Select Contacts";
        adminContactsList.assignAll(result.adminUsers!);
      }
    });
  }

  getAdminContactsListApiCall() async {
    var result = await CoreService().apiService(
      method: METHOD.POST,
      endpoint: GlobalKeys.ADMINCONTACTLIST,
    );

    return AdimContactsListResponceModel.fromJson(result);
  }

  contactUsSubmit() async {
    if (selectContactTitle.value == "Select Contacts") {
      Get.showSnackbar(const GetSnackBar(
        snackPosition: SnackPosition.BOTTOM,
        message: "Please select one contact.",
        duration: Duration(seconds: 2),
        margin: EdgeInsets.only(bottom: 20, left: 10, right: 10),
      ));
    } else if (contactUsMessController.text.isEmpty) {
      Get.showSnackbar(const GetSnackBar(
        snackPosition: SnackPosition.BOTTOM,
        message: "Please write some message.",
        duration: Duration(seconds: 2),
        margin: EdgeInsets.only(bottom: 20, left: 10, right: 10),
      ));
    } else {
      Get.dialog(
          Center(
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(40)),
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: CircularProgressIndicator(
                  strokeWidth: 1.5,
                  color: AppColors.appPrimaryColor,
                ),
              ),
            ),
          ),
          barrierDismissible: false);

      await contactUsSubmitApiCall().then((result) {
        Get.back();
        if (result is ContactUsSubmitResponseModel) {
          selectContactTitle.value = "Select Contacts";
          contactUsMessController.text = "";
          Get.showSnackbar(const GetSnackBar(
            snackPosition: SnackPosition.BOTTOM,
            message: "Your message has been sent!",
            duration: Duration(seconds: 2),
            margin: EdgeInsets.only(bottom: 20, left: 10, right: 10),
          ));
        }
      });
    }
  }

  contactUsSubmitApiCall() async {
    var localStorage = LocalStorage();
    HeaderModel model =
        HeaderModel(token: await localStorage.getValue("access_token"));
    // String authKey = await localStorage.getValue("access_token");
    // Map<String, String> queryParams = {'access-token': authKey};

    ContactUsSubmitSendModel sendModel = ContactUsSubmitSendModel(
        userId: int.parse(userId.value),
        adminId: int.parse(selectContactId.value),
        message: contactUsMessController.text);

    var result = await CoreService().apiService(
        method: METHOD.POST,
        endpoint: GlobalKeys.SUBMITCONTACTUS,
        body: sendModel.toJson(),
        params: model.toParams());

    return ContactUsSubmitResponseModel.fromJson(result);
  }

  getUserDetails() async {
    Get.dialog(
        Center(
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(40)),
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: CircularProgressIndicator(
                strokeWidth: 1.5,
                color: AppColors.appPrimaryColor,
              ),
            ),
          ),
        ),
        barrierDismissible: false);

    await getUserDetailsApiCall().then((result) async {
      if (result is GetProfileResponseModel) {
        await getRankList();
        getUserDetailsData.value = result.user!;
        debugPrint("RankListLenght:- ${rankList.length}");
        for (int i = 0; i < rankList.length; i++) {
          if (rankList[i].id.toString() ==
              getUserDetailsData.value.rankId.toString()) {
            debugPrint(
                "rankList[i].id.toString():- ${rankList[i].id.toString()}");
            debugPrint(
                " getUserDetailsData.value.rankId.toString():- ${getUserDetailsData.value.rankId.toString()}");
            rankName.value = rankList[i].title!;
            rankName2.value = rankList[i].title!;
            rankList[i].isSelected = true;
            rankId.value = rankList[i].id.toString();
            rankId2.value = rankList[i].id.toString();
          }
        }
        firstNameController.text = getUserDetailsData.value.firstName!;
        lastNameController.text = getUserDetailsData.value.lastName!;
        emailController.text = getUserDetailsData.value.email!;
        employeeController.text = getUserDetailsData.value.empNum!;
        cellPhoneController.text = getUserDetailsData.value.mobileNo!;

        print("rankName.value:- ${rankName.value}");
      }
    });
    Get.back();
  }

  getUserDetailsApiCall() async {
    var localStorage = LocalStorage();
    HeaderModel model =
        HeaderModel(token: await localStorage.getValue("access_token"));
    var result = await CoreService().apiService(
        method: METHOD.POST,
        endpoint: GlobalKeys.GETUSERDETAILS,
        params: model.toParams());

    return GetProfileResponseModel.fromJson(result);
  }

  getRankList() async {
    await getRankListApiCall().then((result) {
      if (result is Rank) {
        rankList.value = result.ranks;
      }
    });
  }

  getRankListApiCall() async {
    var result = await CoreService().apiService(
      method: METHOD.POST,
      endpoint: GlobalKeys.RANKLIST,
    );

    return Rank.fromJson(result);
  }

  editDetailsTap() async {
    FocusManager.instance.primaryFocus?.unfocus();
    Get.dialog(
        Center(
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(40)),
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: CircularProgressIndicator(
                strokeWidth: 1.5,
                color: AppColors.appPrimaryColor,
              ),
            ),
          ),
        ),
        barrierDismissible: false);
    await editDetailsTapApiCall().then((result) {
      Get.back();
      if (result is GetProfileResponseModel) {
        Get.showSnackbar(const GetSnackBar(
          snackPosition: SnackPosition.BOTTOM,
          message:
              "Your information has been sent to the admin for approval.  It may take some time to update this inside the app.",
          duration: Duration(seconds: 2),
          margin: EdgeInsets.only(bottom: 20, left: 10, right: 10),
        ));
        for (int i = 0; i < rankList.length; i++) {
          if (rankList[i].id.toString() == rankId2.value) {
            rankList[i].isSelected = true;
          } else {
            rankList[i].isSelected = false;
          }
        }
        rankName.value = rankName2.value;
      } else {
        for (int i = 0; i < rankList.length; i++) {
          if (rankList[i].id.toString() == rankId2.value) {
            rankList[i].isSelected = true;
          } else {
            rankList[i].isSelected = false;
          }
        }
        rankName.value = rankName2.value;
        Get.showSnackbar(const GetSnackBar(
          snackPosition: SnackPosition.BOTTOM,
          message: "You have already sent the update request for approval.",
          duration: Duration(seconds: 2),
          margin: EdgeInsets.only(bottom: 20, left: 10, right: 10),
        ));
      }
    });
  }

  editDetailsTapApiCall() async {
    var localStorage = LocalStorage();
    HeaderModel headerModel =
        HeaderModel(token: await localStorage.getValue("access_token"));

    UpdateProfileSendModel model = UpdateProfileSendModel(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        mobileNo: int.parse(cellPhoneController.text),
        rankId: int.parse(rankId.value));

    var result = await CoreService().apiService(
      method: METHOD.POST,
      params: headerModel.toParams(),
      body: model.toJson(),
      endpoint: GlobalKeys.UPDATEUSERDETAILS,
    );

    if (result["has_error"] == 1) {
      Get.back();
      Get.showSnackbar(const GetSnackBar(
        snackPosition: SnackPosition.BOTTOM,
        message: "You have already sent the update request for approval.",
        duration: Duration(seconds: 2),
        margin: EdgeInsets.only(bottom: 20, left: 10, right: 10),
      ));
    } else {
      return GetProfileResponseModel.fromJson(result);
    }
  }

  changePasswordTap() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (newPassWordController.text != confirmPasswordController.text) {
      Get.showSnackbar(const GetSnackBar(
        snackPosition: SnackPosition.BOTTOM,
        message: "Confirm password is not same as new password",
        duration: Duration(seconds: 2),
        margin: EdgeInsets.only(bottom: 20, left: 10, right: 10),
      ));
    } else {
      Get.dialog(
          Center(
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(40)),
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: CircularProgressIndicator(
                  strokeWidth: 1.5,
                  color: AppColors.appPrimaryColor,
                ),
              ),
            ),
          ),
          barrierDismissible: false);
      await changePasswordTapApiCall().then((result) {
        Get.back();
        if (result is GetProfileResponseModel) {
          Get.showSnackbar(const GetSnackBar(
            snackPosition: SnackPosition.BOTTOM,
            message: "Password changed successfully. You need to login again.",
            duration: Duration(seconds: 2),
            margin: EdgeInsets.only(bottom: 20, left: 10, right: 10),
          ));
          Get.offAllNamed(Routes.LOGIN);
        }
      });
    }
  }

  changePasswordTapApiCall() async {
    var localStorage = LocalStorage();
    HeaderModel headerModel =
        HeaderModel(token: await localStorage.getValue("access_token"));

    ChangePasswordSendModel model =
        ChangePasswordSendModel(password: newPassWordController.text);

    var result = await CoreService().apiService(
      method: METHOD.POST,
      params: headerModel.toParams(),
      body: model.toJson(),
      endpoint: GlobalKeys.CHANGEPASSWORD,
    );

    return GetProfileResponseModel.fromJson(result);
  }

  getNewswireDetails() async {
    Get.dialog(
        Center(
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(40)),
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: CircularProgressIndicator(
                strokeWidth: 1.5,
                color: AppColors.appPrimaryColor,
              ),
            ),
          ),
        ),
        barrierDismissible: false);

    await getNewswireDetailsApiCall().then((result) {
      Get.back();
      if (result is NewswireDetailsResponseModel) {
        newsWireDetails.value = result;
        isNewswireDetailsLoading.value = false;
      }
    });
  }

  getNewswireDetailsApiCall() async {
    NewswireDetailsSendModel model =
        NewswireDetailsSendModel(newsId: int.parse(newsWireId.value));

    var result = await CoreService().apiService(
      method: METHOD.POST,
      body: model.toJson(),
      endpoint: GlobalKeys.NEWSWIREDETAILS,
    );

    return NewswireDetailsResponseModel.fromJson(result);
  }

  var courtesyApartmentListData = <Apartments>[].obs;

  Future<CourtesyApartmentModel> getAllApartments() async {
    var result;
    final response = await CoreService().apiService(
      method: METHOD.POST,
      endpoint: GlobalKeys.AppartmentLIST,
    );
    // var parsed = json.decode(utf8.decode(response.bodyBytes));
    result = CourtesyApartmentModel.fromJson(response);

    return result;
  }

  getcourtesyApartmentListData() async {
    Get.dialog(
        Center(
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(40)),
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: CircularProgressIndicator(
                strokeWidth: 1.5,
                color: AppColors.appPrimaryColor,
              ),
            ),
          ),
        ),
        barrierDismissible: false);

    await getAllApartments().then((result) {
      Get.back();

      courtesyApartmentListData.assignAll(result.apartments);
    });
  }

  getcourtesyApartmentApiCall() async {
    var result = await CoreService().apiService(
      baseURL: "www.apaapp.org",
      method: METHOD.POST,
      commonPoint: "/api/web/v3/",
      endpoint: "app/dashboard-notifications",
    );

    return HomeTabResponseModel.fromJson(result);
  }

  completeOvertimeListData() async {
    Get.dialog(
        Center(
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(40)),
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: CircularProgressIndicator(
                strokeWidth: 1.5,
                color: AppColors.appPrimaryColor,
              ),
            ),
          ),
        ),
        barrierDismissible: false);

    await completeOvertimeListDataApiCall().then((result) {
      Get.back();
      if (result is CompleteShiftsListResponseModel) {
        var completeOvertimeShiftListFromResult = <OvertimeSchedules>[];
        completeOvertimeShiftListFromResult
            .assignAll(result.overtimeSchedules!);
        completeOvertimeShiftList.addAll(completeOvertimeShiftListFromResult);
      }
    });
  }

  completeOvertimeListDataApiCall() async {
    var localStorage = LocalStorage();
    HeaderModel headerModel =
        HeaderModel(token: await localStorage.getValue("access_token"));

    Map data = {
      "page": pageCounter.value,
    };

    var result = await CoreService().apiService(
        method: METHOD.POST,
        body: data,
        endpoint: GlobalKeys.COMPLETEOVERTIMELIST,
        params: headerModel.toParams());

    return CompleteShiftsListResponseModel.fromJson(result);
  }

  var dataList = <Data>[].obs;
  var isNewswiretabLoading = true.obs;
  getNewswireTabData() async {
    try {
      Get.dialog(
          Center(
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(40)),
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: CircularProgressIndicator(
                  strokeWidth: 1.5,
                  color: AppColors.appPrimaryColor,
                ),
              ),
            ),
          ),
          barrierDismissible: false);

      await getNewsWireTabApiCall().then((result) {
        Get.back();

        if (result is NewswireModel) {
          dataList.value = result.data;
          isNewswiretabLoading.value = false;
        }
      });
    } catch (ex) {
      print(ex);
      Get.back();
    }
  }

  getNewsWireTabApiCall() async {
    var result = await CoreService().apiService(
      method: METHOD.POST,
      endpoint: GlobalKeys.NEWSLIST,
    );

    //var test = dynamicMapToString(NewswireModel.fromJson(result).news);

    return NewswireModel.fromJson(result);
  }

  openShiftListData(bool isLoader) async {
    isLoader
        ? Get.dialog(
            Center(
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(40)),
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: CircularProgressIndicator(
                    strokeWidth: 1.5,
                    color: AppColors.appPrimaryColor,
                  ),
                ),
              ),
            ),
            barrierDismissible: false)
        : null;

    await openShiftListDataApiCall().then((result) {
      isLoader ? Get.back() : null;
      if (result is OpenShiftModel) {
        openShiftDataList.assignAll(result.data);
      }
    });
  }

  openShiftListDataApiCall() async {
    var result = await CoreService().apiService(
      method: METHOD.POST,
      endpoint: GlobalKeys.SHIFTLIST,
    );

    return OpenShiftModel.fromJson(result);
  }

  makeShiftSignUp(int shiftId) async {
    Get.dialog(
        Center(
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(40)),
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: CircularProgressIndicator(
                strokeWidth: 1.5,
                color: AppColors.appPrimaryColor,
              ),
            ),
          ),
        ),
        barrierDismissible: false);

    await makeShiftSignUpApiCall(shiftId).then((result) {
      if (result is MakeShiftSignUpResponseModel) {
        openShiftListData(false);
      }
    });
    Get.back();
  }

  makeShiftSignUpApiCall(int shiftId) async {
    var localStorage = LocalStorage();
    HeaderModel headerModel =
        HeaderModel(token: await localStorage.getValue("access_token"));

    ShiftSignUpSendModel model =
        ShiftSignUpSendModel(signUpType: "O", shiftId: shiftId);

    var result = await CoreService().apiService(
        method: METHOD.POST,
        body: model.toJson(),
        endpoint: GlobalKeys.SHIFTSIGNUP,
        params: headerModel.toParams());

    return MakeShiftSignUpResponseModel.fromJson(result);
  }

  makeShiftCancel(int shiftId) async {
    Get.dialog(
        Center(
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(40)),
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: CircularProgressIndicator(
                strokeWidth: 1.5,
                color: AppColors.appPrimaryColor,
              ),
            ),
          ),
        ),
        barrierDismissible: false);

    await makeShiftCancelApiCall(shiftId).then((result) {
      if (result is MakeShiftSignUpResponseModel) {
        openShiftListData(false);
      }
    });
    Get.back();
  }

  makeShiftCancelApiCall(int shiftId) async {
    var localStorage = LocalStorage();
    HeaderModel headerModel =
        HeaderModel(token: await localStorage.getValue("access_token"));

    ShiftCancelSendModel model =
        ShiftCancelSendModel(userId: int.parse(userId.value), shiftId: shiftId);

    var result = await CoreService().apiService(
        method: METHOD.POST,
        body: model.toJson(),
        endpoint: GlobalKeys.SHIFTCANCEL,
        params: headerModel.toParams());

    return MakeShiftSignUpResponseModel.fromJson(result);
  }
}
