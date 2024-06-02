import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/CustomColor.dart';
import '../../../../../common/device_manager/screen_constants.dart';
import '../../../../../common/device_manager/strings.dart';
import '../../controller/home_controller.dart';

class HolidaysTabView extends GetView<HomeController> {
  const HolidaysTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView(
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        children: [
          Container(
            height: 10,
          ),
          Center(
            child: Padding(
                padding: ScreenConstant.spacingAllMedium,
                child: const Text(
                  AppLabels.holidayHeader,
                  style: TextStyle(
                      fontSize: 20,
                      color: CustomColor.darkBlue,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                )),
          ),

          Container(
            color: CustomColor.lightWhite,
            child: Column(
              children: [
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                Container(
                  color: CustomColor.lightWhite,
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 0, bottom: 10),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Jan 01",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "New Years",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                Container(
                  color: CustomColor.lightWhite,
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 10, bottom: 10),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Jan 15",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "MLK",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                Container(
                  color: CustomColor.lightWhite,
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 10, bottom: 10),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Feb 19",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "President's",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                Container(
                  color: CustomColor.lightWhite,
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 10, bottom: 10),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "May 27",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Memorial",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                Container(
                  color: CustomColor.lightWhite,
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 10, bottom: 10),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Jun 19",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Junteenth\n(Civilians)",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                Container(
                  color: CustomColor.lightWhite,
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 10, bottom: 10),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Jul 04",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Independence",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                Container(
                  color: CustomColor.lightWhite,
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 10, bottom: 10),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Sep 02",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Labor Day",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                Container(
                  color: CustomColor.lightWhite,
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 10, bottom: 10),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Nov 11",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Veteran's",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                Container(
                  color: CustomColor.lightWhite,
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 10, bottom: 10),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Nov 28",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "ThanksGiving",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                Container(
                  color: CustomColor.lightWhite,
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 10, bottom: 10),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Nov 29",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Friday/ThanksGiving",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                Container(
                  color: CustomColor.lightWhite,
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 10, bottom: 10),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Dec 24",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Christmas Eve Holiday",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                Container(
                  color: CustomColor.lightWhite,
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 10, bottom: 10),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Dec 25",
                            style: TextStyle(fontSize: 12),
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Christmas Holiday",
                            style: TextStyle(fontSize: 12),
                            textAlign: TextAlign.left,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

          // datetime.png
          const SizedBox(
            height: 120,
          )
        ],
      ),
    );
  }
}
