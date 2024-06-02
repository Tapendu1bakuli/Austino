import 'package:apamobile/app/modules/home/controller/home_controller.dart';
import 'package:apamobile/common/device_manager/colors.dart';
import 'package:apamobile/common/device_manager/screen_constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../../../../../Service/GlobalKeys.dart';
import '../../../../../common/device_manager/assets.dart';

class NewsWireDetailsScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () {
        Get.back();
        controller.isNewswireDetailsLoading.value = true;
        return Future.value(true);
      },
      child: Scaffold(
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
                  controller.isNewswireDetailsLoading.value = true;

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
            Get.find<HomeController>().getNewswireDetails();
          });
        }, builder: (_) {
          return controller.isNewswireDetailsLoading.value
              ? Container()
              : controller.newsWireDetails.value.settings == null
                  ? Container()
                  : ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller
                                    .newsWireDetails.value.newsDetail!.title!,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                height: 10,
                              ),
                              Container(
                                height: ScreenConstant.screenHeightHalf,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black)),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "${GlobalKeys.NEWS_URL}${controller.newsWireDetails.value.newsDetail!.newsImage!}",
                                    placeholder: (context, url) =>
                                        Image.asset(Assets.loadingImageGif),
                                    errorWidget: (context, url, error) =>
                                        Image.network(
                                            GlobalKeys.PLACEHOLDER_URL),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Container(
                                height: 10,
                              ),
                              Text(
                                controller
                                    .newsWireDetails.value.newsDetail!.title!,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                height: 10,
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
                                    controller.newsWireDetails.value.newsDetail!
                                        .createdAt!,
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.grey[500],
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              Container(
                                height: 5,
                              ),
                              Html(
                                data: controller.newsWireDetails.value
                                    .newsDetail!.description!,
                                style: {
                                  "body": Style(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      textAlign: TextAlign.justify),
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    );
        }),
      ),
    );
  }
}
