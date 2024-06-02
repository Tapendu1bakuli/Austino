import 'package:apamobile/common/device_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../common/localStorage.dart';
import '../../controller/home_controller.dart';
import 'curtesy_apartment_details.dart';
import 'home_tab_instant_alerts_details.dart';
import 'newswire_details.dart';

class HomeTabView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetX<HomeController>(initState: (state) {
      Future.delayed(const Duration(milliseconds: 100), () async {
        var localStorage = LocalStorage();
        controller.userId.value = await localStorage.getValue("id");
        debugPrint("controller.userId.value= ${controller.userId.value}");
        Get.find<HomeController>().getHomeTabData().then((value) {
          if (value) {
            showAlertDialog(context);
          }
        });
      });
    }, builder: (_) {
      return controller.homeTabViewListData.length < 1
          ? Container(
              child: Center(
                  child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 150,
                      ),
                      const Icon(
                        Icons.search,
                        color: AppColors.appPrimaryColor,
                        size: 40,
                      ),
                      Container(
                        height: 15,
                      ),
                      const Text(
                        "No notifications found for today!",
                        style: TextStyle(
                            color: Color(0xff040940),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              )),
            )
          : ListView(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.homeTabViewListData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return controller.homeTabViewListData[index]
                                  .notificationType! ==
                              "A"
                          ? instantAlertsCard(context, index)
                          : controller.homeTabViewListData[index]
                                      .notificationType! ==
                                  "S"
                              ? controller.homeTabViewListData[index].signUps!
                                      .signupUserIds!
                                      .contains(
                                          int.parse(controller.userId.value))
                                  ? Center(
                                      child: ListView(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      physics: const BouncingScrollPhysics(),
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 150,
                                            ),
                                            const Icon(
                                              Icons.search,
                                              color: AppColors.appPrimaryColor,
                                              size: 40,
                                            ),
                                            Container(
                                              height: 15,
                                            ),
                                            const Text(
                                              "No notifications found for today!",
                                              style: TextStyle(
                                                  color: Color(0xff040940),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        )
                                      ],
                                    ))
                                  : openShiftCard(context, index,controller.homeTabViewListData[index].createdAt??0)
                              : controller.homeTabViewListData[index]
                                          .notificationType! ==
                                      "AP"
                                  ? courtesyApartmentCard(context, index)
                                  : newswireCard(context, index);
                    }),
                const SizedBox(
                  height: 100,
                )
              ],
            );
    });
  }

  Padding instantAlertsCard(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: 10,),
          const Padding(
            padding: EdgeInsets.only(left: 5.0),
            child: Text(
              "Instant Alerts",
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 5,
          ),
          GestureDetector(
            onTap: () {
              Get.to(InstantAlertsDetailsScreen());
              controller.alertsId.value =
                  controller.homeTabViewListData[index].id!.toString();
            },
            child: Card(
              elevation: 4,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Row(
                  children: [
                    Flexible(
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.homeTabViewListData[index].title!,
                            style: const TextStyle(
                                fontSize: 20.0,
                                color: AppColors.appPrimaryColor,
                                fontWeight: FontWeight.w600),
                          ),
                          Container(
                            height: 5,
                          ),
                          Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Icon(
                                Icons.calendar_month_outlined,
                                color: Colors.grey[200],
                                size: 15,
                              ),
                              Container(
                                width: 5,
                              ),
                              Text(
                                controller
                                    .homeTabViewListData[index].addedDate!,
                                style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.grey[500],
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 40,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey[400]),
                      child: const Padding(
                        padding: EdgeInsets.all(7.0),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                          color: AppColors.appPrimaryColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text(
        //"OKAY",
        "UPDATE",
        style: TextStyle(
            color: AppColors.appPrimaryColor, fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        Get.back();
        launchUrl(Uri.parse("https://www.apaapp.org/iOS/"));
      },
    );
    launchUrls(Uri url) async {
      if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
    }
    }
    Widget cancelButton = TextButton(
      child: const Text(
        "Cancel",
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        Get.back();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: AppColors.white,
      surfaceTintColor: AppColors.white,
      title: const Text("App Update!"),
      content: const Text(
        "New version available. Please, update app to new version to continue.",
        style: TextStyle(fontSize: 14),
      ),
      actions: [
        cancelButton,
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Padding newswireCard(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: 10,),
          const Padding(
            padding: EdgeInsets.only(left: 5.0),
            child: Text(
              "Newswire",
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 5,
          ),
          GestureDetector(
            onTap: () {
              Get.to(NewsWireDetailsScreen());
              controller.newsWireId.value =
                  controller.homeTabViewListData[index].id!.toString();
            },
            child: Card(
              elevation: 4,
              surfaceTintColor: AppColors.white,
              color: AppColors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Row(
                  children: [
                    Flexible(
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.homeTabViewListData[index].title!,
                            style: const TextStyle(
                                fontSize: 20.0,
                                color: AppColors.appPrimaryColor,
                                fontWeight: FontWeight.w600),
                          ),
                          Container(
                            height: 5,
                          ),
                          Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Icon(
                                Icons.calendar_month_outlined,
                                color: Colors.grey[200],
                                size: 15,
                              ),
                              Container(
                                width: 5,
                              ),
                              Text(
                                controller
                                    .homeTabViewListData[index].addedDate!,
                                style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.grey[500],
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 40,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey[400]),
                      child: const Padding(
                        padding: EdgeInsets.all(7.0),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                          color: AppColors.appPrimaryColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding openShiftCard(BuildContext context, int index,int createdAt) {
    var date = DateTime.fromMillisecondsSinceEpoch(createdAt *
        1000);
    var currentDate = DateTime.now();
    Duration diff = currentDate.difference(date);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 5.0),
            child: Text(
              "Open Shift",
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 5,
          ),
          Card(
            elevation: 7,
            surfaceTintColor: AppColors.white,
            color: AppColors.white,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 35.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        "assets/icon/arrow.png",
                        width: MediaQuery.of(context).size.width / 1.8,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_month_outlined,
                        color: AppColors.appPrimaryColor,
                        size: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 20,
                      ),
                      Flexible(
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.homeTabViewListData[index]
                                  .vendorDetails!.companyName!,
                              style: const TextStyle(
                                  fontSize: 20.0,
                                  color: AppColors.appPrimaryColor,
                                  fontWeight: FontWeight.w600),
                            ),
                            Container(
                              height: 5,
                            ),
                            diff.inHours > 24
                                ? Text(
                              "Shift Posted: ${diff.inDays} days ago",
                              style: const TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400),
                            )
                                : diff.inMinutes > 60
                                ? Text(
                              "Shift Posted: ${diff.inHours} hours ago",
                              style: const TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400),
                            )
                                : diff.inSeconds > 60
                                ? Text(
                              "Shift Posted: ${diff.inMinutes} minutes ago",
                              style: const TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400),
                            )
                                : Text(
                              "Shift Posted: ${diff.inSeconds} seconds ago",
                              style: const TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400),
                            ),
                            // Text(
                            //   "Shift Posted: ${controller.homeTabViewListData[index].addedBy} days ago",
                            //   style: const TextStyle(
                            //       fontSize: 12.0,
                            //       color: Colors.grey,
                            //       fontWeight: FontWeight.w400),
                            // ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 40,
                      ),
                      Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 70,
                            decoration: BoxDecoration(
                                color: AppColors.appPrimaryColor,
                                borderRadius: BorderRadius.circular(2)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 4),
                              child: Center(
                                child: Text(
                                  parseTime(
                                      dateTime: controller
                                          .homeTabViewListData[index].startTime,
                                      returnFormat: "h:mm a"),
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 5,
                          ),
                          Container(
                            width: 70,
                            decoration: BoxDecoration(
                                color: AppColors.appPrimaryColor,
                                borderRadius: BorderRadius.circular(2)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 4),
                              child: Center(
                                child: Text(
                                  parseTime(
                                      dateTime: controller
                                          .homeTabViewListData[index].endTime,
                                      returnFormat: "h:mm a"),
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding courtesyApartmentCard(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: 10,),
          const Padding(
            padding: EdgeInsets.only(left: 5.0),
            child: Text(
              "Courtesy Apartment",
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 5,
          ),
          GestureDetector(
            onTap: () {
              Get.to(CourtesyApartmentDetailsScreen(
                address:
                    controller.homeTabViewListData[index].apartmentLocation!,
                image: controller.homeTabViewListData[index].apartmentImage!,
                title: controller.homeTabViewListData[index].title!,
                phNo: controller.homeTabViewListData[index].apartmentPhone!,
                lat: controller.homeTabViewListData[index].apartmentLatitude!,
                lng: controller.homeTabViewListData[index].apartmentLongitude!,
              ));
            },
            child: Card(
              elevation: 4,
              surfaceTintColor: AppColors.white,
              color: AppColors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Row(
                  children: [
                    Flexible(
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.homeTabViewListData[index].title!,
                            style: const TextStyle(
                                fontSize: 20.0,
                                color: AppColors.appPrimaryColor,
                                fontWeight: FontWeight.w600),
                          ),
                          Container(
                            height: 10,
                          ),
                          Text(
                            controller
                                .homeTabViewListData[index].apartmentLocation!,
                            style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 40,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String parseTime({String? dateTime, String? returnFormat}) {
  DateFormat dtFor = DateFormat("HH:mm:ss");
  DateTime dt = dtFor.parse(dateTime!);
  DateFormat dateFormat = DateFormat(returnFormat);
  String returnDT = dateFormat.format(dt);
  return returnDT;
}
