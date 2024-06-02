import 'dart:async';

import 'package:apamobile/app/modules/home/controller/home_controller.dart';
import 'package:apamobile/common/device_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'complete_overtime_shifts_screen.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class ApaOvertimeTabView extends StatefulWidget {
  const ApaOvertimeTabView({Key? key}) : super(key: key);

  @override
  State<ApaOvertimeTabView> createState() => _ApaOvertimeTabViewState();
}

class _ApaOvertimeTabViewState extends State<ApaOvertimeTabView> {
  final HomeController controller = Get.find();
  Timer? _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 15), (timer) {
      // print("hi");
      controller.openShiftListData(true);
    });
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetX<HomeController>(initState: (state) {
      Future.delayed(const Duration(milliseconds: 100), () {
        Get.find<HomeController>().openShiftListData(true);
      });
    }, builder: (_) {
      return Padding(
        padding: const EdgeInsets.only(left: 3.0, right: 3, top: 5),
        child: ListView(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.openShiftsTap.value = true;
                    controller.mtShiftsTap.value = false;
                    controller.openShiftListData(true);
                  },
                  child: Container(
                    height: 25,
                    width: MediaQuery.of(context).size.width / 2.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.appPrimaryColor,
                    ),
                    child: Center(
                      child: Text(
                        "Open Shifts",
                        style: TextStyle(
                            color: controller.openShiftsTap.value
                                ? Colors.yellow
                                : Colors.white,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.openShiftsTap.value = false;
                    controller.mtShiftsTap.value = true;
                    controller.openShiftListData(true);
                  },
                  child: Container(
                    height: 25,
                    width: MediaQuery.of(context).size.width / 2.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.appPrimaryColor,
                    ),
                    child: Center(
                      child: Text(
                        "My Shifts",
                        style: TextStyle(
                            color: controller.mtShiftsTap.value
                                ? Colors.yellow
                                : Colors.white,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: GestureDetector(
                onTap: () {
                  _timer!.cancel();
                  Get.to(CompleteOvertimeShifts());
                },
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.appPrimaryColor,
                  ),
                  child: const Center(
                    child: Text(
                      "Display Completed Overtime Shifts",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: GestureDetector(
                onTap: () async {
                  const url =
                      "https://app.smartsheet.com/b/form/fcecd760088c457a85674d04e06a4042";
                  await UrlLauncher.launch(url.toString());
                },
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.blue[700],
                  ),
                  child: const Center(
                    child: Text(
                      "Submit Text-To-Login From",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 20,
            ),
            controller.openShiftsTap.value
                ? ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: controller.openShiftDataList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: controller.openShiftDataList[index]
                            .openShiftDetailsList.length,
                        itemBuilder: (BuildContext context, int ind) {
                          // var date = DateTime.fromMillisecondsSinceEpoch(
                          //     controller.openShiftDataList[index]
                          //             .openShiftDetailsList[ind].createdAt! *
                          //         1000);
                          String createdAt = parse(
                              dateTime: controller.openShiftDataList[index].name
                                  .toString(),
                              returnFormat: "EE / MMM d yyyy");
                          return controller.openShiftDataList[index]
                                  .openShiftDetailsList[ind].signupUserIds!
                                  .contains(int.parse(controller.userId.value))
                              ? Offstage()
                              : openShiftCard(index, ind, createdAt, context);
                        },
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        color: Colors.black,
                      );
                    },
                  )
                : ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: controller.openShiftDataList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: controller.openShiftDataList[index]
                            .openShiftDetailsList.length,
                        itemBuilder: (BuildContext context, int ind) {
                          // var date = DateTime.fromMillisecondsSinceEpoch(
                          //     controller.openShiftDataList[index]
                          //             .openShiftDetailsList[ind].createdAt! *
                          //         1000);
                          String createdAt = parse(
                              dateTime: controller.openShiftDataList[index].name
                                  .toString(),
                              returnFormat: "EE / MMM d yyyy");
                          return controller.openShiftDataList[index]
                                  .openShiftDetailsList[ind].signupUserIds!
                                  .contains(int.parse(controller.userId.value))
                              ? MyShiftCard(index, ind, createdAt, context)
                              : Offstage();
                        },
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        color: Colors.black,
                      );
                    },
                  ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      );
    });
  }

  Padding openShiftCard(
      int index, int ind, String createdAt, BuildContext context) {
    var date = DateTime.fromMillisecondsSinceEpoch(controller
            .openShiftDataList[index].openShiftDetailsList[ind].createdAt! *
        1000);
    var currentDate = DateTime.now();
    Duration diff = currentDate.difference(date);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.appPrimaryColor),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Icon(
                        Icons.calendar_month,
                        size: 20,
                        color: AppColors.appPrimaryColor,
                      ),
                    ),
                  ),
                  Container(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        createdAt,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16),
                      ),
                      Container(
                        height: 4,
                      ),
                      diff.inHours > 24
                          ? Text(
                              "Shift Posted: ${diff.inDays} days ago",
                              style: const TextStyle(
                                  color: Colors.white38,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            )
                          : diff.inMinutes > 60
                              ? Text(
                                  "Shift Posted: ${diff.inHours} hours ago",
                                  style: const TextStyle(
                                      color: Colors.white38,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                )
                              : diff.inSeconds > 60
                                  ? Text(
                                      "Shift Posted: ${diff.inMinutes} minutes ago",
                                      style: const TextStyle(
                                          color: Colors.white38,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : Text(
                                      "Shift Posted: ${diff.inSeconds} seconds ago",
                                      style: const TextStyle(
                                          color: Colors.white38,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      width: 10,
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(2)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: Center(
                            child: Text(
                              parseTime(
                                  dateTime: controller.openShiftDataList[index]
                                      .openShiftDetailsList[ind].startTime,
                                  returnFormat: "h:mm a"),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 3,
                      ),
                      Container(
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(2)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: Center(
                            child: Text(
                              parseTime(
                                  dateTime: controller.openShiftDataList[index]
                                      .openShiftDetailsList[ind].endTime,
                                  returnFormat: "h:mm a"),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Container(
                height: 20,
              ),
              Container(
                //height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    controller.openShiftDataList[index]
                        .openShiftDetailsList[ind].vendorDetails!.companyName!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18),
                  ),
                ),
              ),
              Container(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.45,
                    decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Offiers ${controller.openShiftDataList[index].openShiftDetailsList[ind].signUps!.officers!}/${controller.openShiftDataList[index].openShiftDetailsList[ind].officersRequired} | \$${controller.openShiftDataList[index].openShiftDetailsList[ind].officerHourlyRate}/hr",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14),
                          ),
                          Container(
                            height: 5,
                          ),
                          Text(
                            "Supervisor ${controller.openShiftDataList[index].openShiftDetailsList[ind].signUps!.supervisors!}/${controller.openShiftDataList[index].openShiftDetailsList[ind].supervisorRequired} | \$${controller.openShiftDataList[index].openShiftDetailsList[ind].supervisorHourlyRate}/hr",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.makeShiftSignUp(controller
                          .openShiftDataList[index]
                          .openShiftDetailsList[ind]
                          .id!);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.red[600]),
                      child: const Padding(
                        padding: EdgeInsets.only(
                            left: 5, top: 18, bottom: 18, right: 8),
                        child: Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 10,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Details : ${controller.openShiftDataList[index].openShiftDetailsList[ind].details}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      Container(
                        height: 5,
                      ),
                      Text(
                        "Address : ${controller.openShiftDataList[index].openShiftDetailsList[ind].addressLocation}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      Container(
                        height: 5,
                      ),
                      Text(
                        "Point of Contact : ${controller.openShiftDataList[index].openShiftDetailsList[ind].contactName} / ${controller.openShiftDataList[index].openShiftDetailsList[ind].contactNumber}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding MyShiftCard(
      int index, int ind, String createdAt, BuildContext context) {
    var date = DateTime.fromMillisecondsSinceEpoch(controller
            .openShiftDataList[index].openShiftDetailsList[ind].createdAt! *
        1000);
    var currentDate = DateTime.now();
    Duration diff = currentDate.difference(date);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.appPrimaryColor),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Icon(
                        Icons.calendar_month,
                        size: 20,
                        color: AppColors.appPrimaryColor,
                      ),
                    ),
                  ),
                  Container(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        createdAt,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16),
                      ),
                      Container(
                        height: 4,
                      ),
                      diff.inHours > 24
                          ? Text(
                              "Shift Posted: ${diff.inDays} days ago",
                              style: const TextStyle(
                                  color: Colors.white38,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            )
                          : diff.inMinutes > 60
                              ? Text(
                                  "Shift Posted: ${diff.inHours} hours ago",
                                  style: const TextStyle(
                                      color: Colors.white38,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                )
                              : diff.inSeconds > 60
                                  ? Text(
                                      "Shift Posted: ${diff.inMinutes} minutes ago",
                                      style: const TextStyle(
                                          color: Colors.white38,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : Text(
                                      "Shift Posted: ${diff.inSeconds} seconds ago",
                                      style: const TextStyle(
                                          color: Colors.white38,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      width: 10,
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(2)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: Center(
                            child: Text(
                              parseTime(
                                  dateTime: controller.openShiftDataList[index]
                                      .openShiftDetailsList[ind].startTime,
                                  returnFormat: "h:mm a"),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 3,
                      ),
                      Container(
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(2)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: Center(
                            child: Text(
                              parseTime(
                                  dateTime: controller.openShiftDataList[index]
                                      .openShiftDetailsList[ind].endTime,
                                  returnFormat: "h:mm a"),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Container(
                height: 20,
              ),
              Container(
                //height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    controller.openShiftDataList[index]
                        .openShiftDetailsList[ind].vendorDetails!.companyName!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18),
                  ),
                ),
              ),
              Container(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.45,
                    decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Offiers ${controller.openShiftDataList[index].openShiftDetailsList[ind].signUps!.officers!}/${controller.openShiftDataList[index].openShiftDetailsList[ind].officersRequired} | \$${controller.openShiftDataList[index].openShiftDetailsList[ind].officerHourlyRate}/hr",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14),
                          ),
                          Container(
                            height: 5,
                          ),
                          Text(
                            "Supervisor ${controller.openShiftDataList[index].openShiftDetailsList[ind].signUps!.supervisors!}/${controller.openShiftDataList[index].openShiftDetailsList[ind].supervisorRequired} | \$${controller.openShiftDataList[index].openShiftDetailsList[ind].supervisorHourlyRate}/hr",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.makeShiftCancel(controller
                          .openShiftDataList[index]
                          .openShiftDetailsList[ind]
                          .id!);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.red[600]),
                      child: const Padding(
                        padding: EdgeInsets.only(
                            right: 8.0, left: 10, top: 18, bottom: 18),
                        child: Text(
                          "Cancel",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 10,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Details : ${controller.openShiftDataList[index].openShiftDetailsList[ind].details}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      Container(
                        height: 5,
                      ),
                      Text(
                        "Address : ${controller.openShiftDataList[index].openShiftDetailsList[ind].addressLocation}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      Container(
                        height: 5,
                      ),
                      Text(
                        "Point of Contact : ${controller.openShiftDataList[index].openShiftDetailsList[ind].contactName} / ${controller.openShiftDataList[index].openShiftDetailsList[ind].contactNumber}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String parse({String? dateTime, String? returnFormat}) {
  DateTime dt = DateTime.parse(dateTime!).toLocal();
  DateFormat dateFormat = DateFormat(returnFormat);
  String returnDT = dateFormat.format(dt);
  return returnDT;
}

String parseTime({String? dateTime, String? returnFormat}) {
  DateFormat dtFor = DateFormat("HH:mm:ss");
  DateTime dt = dtFor.parse(dateTime!);
  DateFormat dateFormat = DateFormat(returnFormat);
  String returnDT = dateFormat.format(dt);
  return returnDT;
}
