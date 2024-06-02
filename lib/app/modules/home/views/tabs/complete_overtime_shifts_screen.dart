import 'package:apamobile/app/modules/home/controller/home_controller.dart';
import 'package:apamobile/app/modules/home/widget/shifts_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/device_manager/colors.dart';
import '../../../../routes/app_routes.dart';

class CompleteOvertimeShifts extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetX<HomeController>(initState: (state) {
      Future.delayed(const Duration(milliseconds: 100), () {
        Get.find<HomeController>().completeOvertimeListData();
      });
    }, builder: (_) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.appPrimaryColor,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            "Completed Shifts",
            style: TextStyle(fontSize: 17),
          ),
          leading: GestureDetector(
            onTap: () {
              // Get.back();
              Get.offAllNamed(Routes.HOME);
            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 5,
                width: 5,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(4)),
                child: const Icon(
                  Icons.arrow_back,
                  size: 18,
                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: controller.completeOvertimeShiftList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return controller.completeOvertimeShiftList[index]
                                  .vendorDetails ==
                              null
                          ? const Offstage()
                          : ShiftWidgets(
                              index: index,
                              completedList:
                                  controller.completeOvertimeShiftList,
                            );
                    }),
                controller.completeOvertimeShiftList.isEmpty
                    ? const Offstage()
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            controller.pageCounter.value++;
                            Future.delayed(const Duration(milliseconds: 100),
                                () {
                              Get.find<HomeController>()
                                  .completeOvertimeListData();
                            });
                          },
                          child: Container(
                              color: AppColors.appPrimaryColor,
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Load more",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        ),
                      )
              ],
            ),
          ),
        ),
      );
    });
  }
}
