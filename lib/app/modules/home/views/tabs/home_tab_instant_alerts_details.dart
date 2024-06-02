import 'package:apamobile/app/modules/home/controller/home_controller.dart';
import 'package:apamobile/common/device_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class InstantAlertsDetailsScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                controller.isinstantDetailsLoading.value = true;
                Get.back();
              },
              child: const Icon(
                Icons.close,
                color: AppColors.appPrimaryColor,
              ),
            ),
          )
        ],
      ),
      body: GetX<HomeController>(initState: (state) {
        Future.delayed(const Duration(milliseconds: 100), () {
          Get.find<HomeController>().getInstantAlertsData();
        });
      }, builder: (_) {
        return controller.isinstantDetailsLoading.value
            ? Container()
            : controller.instantAlertsDetails.value.settings == null
                ? Container()
                : ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sent By: ${controller.instantAlertsDetails.value.instantAlerts!.sentBy!}",
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 16),
                            ),
                            Container(
                              height: 10,
                            ),
                            Text(
                              "Sent On: ${controller.instantAlertsDetails.value.instantAlerts!.createdAt!}",
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 16),
                            ),
                            Container(
                              height: 10,
                            ),
                            Text(
                              "Subject: ${controller.instantAlertsDetails.value.instantAlerts!.title!}",
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 16),
                            ),
                            Container(
                              height: 20,
                            ),
                            Html(
                              data: controller.instantAlertsDetails.value
                                  .instantAlerts!.description!,
                              style: {
                                "body": Style(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: FontSize.large,
                                    textAlign: TextAlign.justify),
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  );
      }),
    );
  }
}
