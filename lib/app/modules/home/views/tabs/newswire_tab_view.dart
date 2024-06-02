import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../../Service/GlobalKeys.dart';
import '../../../../../common/device_manager/assets.dart';
import '../../../../../common/device_manager/screen_constants.dart';
import '../../../../../model/CompleteShiftsListResponseModel.dart';
import '../../controller/home_controller.dart';

class NewsWireTabView extends GetView<HomeController> {
  const NewsWireTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetX<HomeController>(initState: (state) {
      Future.delayed(const Duration(milliseconds: 100), () {
        Get.find<HomeController>().getNewswireTabData();
      });
    }, builder: (_) {
      return controller.dataList.value.isEmpty
          ? Container()
          : SingleChildScrollView(
              child: ListView(
                  physics: const ClampingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: controller.dataList.value.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: controller
                              .dataList.value[index].newsDetailsList.length,
                          itemBuilder: (BuildContext context, int detailIndex) {
                            return newswireCard(context, index, detailIndex);
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
                  ]),
            );
    });
  }

  newswireCard(BuildContext context, int index, int detailIndex) {
    var date = DateTime.fromMillisecondsSinceEpoch(controller
            .dataList.value[index].newsDetailsList[detailIndex].createdAt *
        1000);
    String day = DateFormat(DateFormat.ABBR_WEEKDAY).format(date);
    String time = DateFormat(DateFormat.HOUR_MINUTE).format(date);
    String formattedDate =
        parse(dateTime: date.toString(), returnFormat: "MMM d yyyy");
    return Column(
      children: [
        Container(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.grey[300],
                width: double.infinity,
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Container(
                    child: Text(
                      "$day / $formattedDate",
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Container(
                height: ScreenConstant.screenHeightHalf,
                width: double.infinity,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: CachedNetworkImage(
                    imageUrl:
                        "${GlobalKeys.NEWS_URL}${controller.dataList.value[index].newsDetailsList[detailIndex].newsImage}",
                    placeholder: (context, url) =>
                        Image.asset(Assets.loadingImageGif),
                    errorWidget: (context, url, error) =>
                        Image.network(GlobalKeys.PLACEHOLDER_URL),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                height: 10,
              ),
              Text(
                controller
                    .dataList.value[index].newsDetailsList[detailIndex].title,
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
                  const Icon(
                    Icons.calendar_month_outlined,
                    color: Colors.black,
                    size: 15,
                  ),
                  Container(
                    width: 5,
                  ),
                  Text(
                    formattedDate,
                    style: const TextStyle(
                        fontSize: 12.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                  Container(
                    width: 5,
                  ),
                  const Icon(
                    Icons.timelapse_outlined,
                    color: Colors.black,
                    size: 15,
                  ),
                  Container(
                    width: 5,
                  ),
                  Text(
                    time,
                    style: const TextStyle(
                        fontSize: 12.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Container(
                height: 5,
              ),
              Html(
                data: controller.dataList.value[index]
                    .newsDetailsList[detailIndex].description,
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
  }
}

String parseTime({String? dateTime, String? returnFormat}) {
  DateFormat dtFor = DateFormat("HH:mm:ss");
  DateTime dt = dtFor.parse(dateTime!);
  DateFormat dateFormat = DateFormat(returnFormat);
  String returnDT = dateFormat.format(dt);
  return returnDT;
}
