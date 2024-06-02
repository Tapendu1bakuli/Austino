import 'package:apamobile/app/modules/home/controller/home_controller.dart';
import 'package:apamobile/common/device_manager/screen_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../common/helper.dart';
import '../../../../common/localStorage.dart';
import '../../../routes/app_routes.dart';
import '../../bottom_float_button/views/bottom_float_widget.dart';
import '../../global_widgets/tab_bar_widget.dart';

class HomeView extends GetView<HomeController> {
  final localStorage = LocalStorage();

  List<int> days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.initScrollController();

    int julianDayValue = dayOfYear(DateTime.now());

    return Obx(() => WillPopScope(
          onWillPop: Helper().onWillPop,
          child: Stack(
            children: [
              Scaffold(
                resizeToAvoidBottomInset: false,
                body: RefreshIndicator(
                    onRefresh: () async {
                      // Get.find<LaravelApiClient>().forceRefresh();
                      // controller.refreshHome(showMessage: false);
                      // Get.find<LaravelApiClient>().unForceRefresh();
                    },
                    child: CustomScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      controller: controller.scrollController,
                      shrinkWrap: false,
                      slivers: <Widget>[
                        Obx(() {
                          return SliverAppBar(
                            backgroundColor: const Color(0xffffffff),
                            expandedHeight: 100,
                            elevation: 0.5,
                            floating: false,
                            centerTitle: true,
                            iconTheme:
                                IconThemeData(color: Get.theme.primaryColor),
                            leadingWidth: 150,
                            leading: julianDayValue < 100
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, left: 15),
                                    child: Text(
                                      "0$julianDayValue Julian Date".tr,
                                      style: TextStyle(
                                          color: const Color(0xff040940),
                                          fontSize: FontSize.s14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, left: 15),
                                    child: Text(
                                      "$julianDayValue Julian Date".tr,
                                      style: TextStyle(
                                          color: const Color(0xff040940),
                                          fontSize: FontSize.s14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                            title: SizedBox(
                              height: 50,
                              width: 100,
                              child: Image.asset(
                                'assets/icon/icon_without_shadow.png',
                              ),
                            ),
                            automaticallyImplyLeading: false,
                            actions: [
                              IconButton(
                                onPressed: () {
                                  Get.defaultDialog(
                                    title: "Logout",
                                    middleText: "Do you want to log out?",
                                    backgroundColor: Colors.white,
                                    titleStyle:
                                        const TextStyle(color: Colors.black),
                                    middleTextStyle:
                                        const TextStyle(color: Colors.black),
                                    radius: 5,
                                    confirm: ElevatedButton(
                                        onPressed: () {
                                          Get.back();
                                          localStorage.logout();
                                          Get.offAllNamed(Routes.LOGIN);
                                        },
                                        child: const Text("Yes")),
                                    cancel: ElevatedButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: const Text("No")),
                                  );
                                },
                                icon: Image.asset('assets/icon/logout-btn.png'),
                                color: Colors.blueGrey,
                              ),
                            ],
                            bottom: controller.tabs.isEmpty
                                ? TabBarLoadingWidget()
                                : TabBarWidget(
                                    tag: 'home',
                                    initialSelectedId:
                                        controller.tabs.elementAt(0).indexId,
                                    tabs: List.generate(controller.tabs.length,
                                        (index) {
                                      var status =
                                          controller.tabs.elementAt(index);
                                      return ChipWidget(
                                        tag: 'home',
                                        text: status.name?.tr ?? "",
                                        id: status.indexId,
                                        onSelected: (id) {
                                          controller.changeTab(id);
                                        },
                                        backgroundColor:
                                            const Color(0xffffffff),
                                      );
                                    }),
                                  ),
                          );
                        }),
                        SliverToBoxAdapter(
                          child: Wrap(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 7,
                                      offset: const Offset(
                                          0, 6), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: const Divider(
                                  height: 1,
                                  thickness: 1,
                                  color: Colors.black45,
                                ),
                              ),
                              Obx(() => controller.currentPage),
                            ],
                          ),
                        ),
                      ],
                    )),
                bottomSheet: Container(
                    height: 100,
                    decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(color: Colors.black, width: 3)),
                        color: Colors.transparent),
                    child: const Padding(
                      padding: EdgeInsets.only(top: 25.0),
                      child: BottomFloatWidget(),
                    )),
              ),
              // ignore: unrelated_type_equality_checks
              controller.tourCompleteCheck.value
                  ? Offstage()
                  : Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black87,
                      child: Stack(children: [
                        Positioned(
                            top: ScreenConstant.screenHeightSixth,
                            left: ScreenConstant.screenWidthFourth,
                            //right: ScreenConstant.screenWidthFourth,
                            child: const Image(
                              image: AssetImage("assets/icon/topArrow.png"),
                              height: 80,
                            )),
                        Positioned(
                          top: ScreenConstant.screenHeightHalf,
                          left: ScreenConstant.screenWidthEleven,
                          child: GestureDetector(
                            onTap: () async {
                              await localStorage.tourComplete("true");
                              controller.tourCompleteCheck.value = true;
                            },
                            child: const Image(
                              image: AssetImage("assets/icon/middleArrow.png"),
                              height: 80,
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: ScreenConstant.screenHeightEleven,
                            left: ScreenConstant.screenWidthSixth,
                            child: const Image(
                              image: AssetImage("assets/icon/leftArrow.png"),
                              height: 55,
                            )),
                        Positioned(
                            bottom: ScreenConstant.screenHeightMinimum,
                            right: ScreenConstant.screenWidthSixth,
                            child: const Image(
                              image: AssetImage("assets/icon/rightArrow.png"),
                              height: 55,
                            )),
                      ]),
                    ),
            ],
          ),
        ));
  }

  // Function to return the day number
  // of the year for the given date
  dayOfYear(DateTime date) {
    // Extract the year, month and the
    // day from the date string
    int year = int.parse(date.year.toString());

    int month = int.parse(date.month.toString());

    int day = int.parse(date.day.toString());

    // If current year is a leap year and the date
    // given is after the 28th of February then
    // it must include the 29th February
    if (month > 2 && year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)) {
      ++day;
    }

    // Add the days in the previous months
    while (--month > 0) {
      day = day + days[month - 1];
    }
    return day;
  }

  String parse({String? dateTime, String? returnFormat}) {
    DateTime dt = DateTime.parse(dateTime!).toLocal();
    DateFormat dateFormat = DateFormat(returnFormat);
    String returnDT = dateFormat.format(dt);
    return returnDT;
  }
}
