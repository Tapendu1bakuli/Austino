import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/CustomColor.dart';
import '../../../../../common/device_manager/screen_constants.dart';
import '../../../../../common/device_manager/strings.dart';
import '../../controller/home_controller.dart';
import '../../widget/grey_tile.dart';

class ShiftDateTabView extends GetView<HomeController> {
  const ShiftDateTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView(
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        children: [
          Container(height: 10,),
          Center(
            child: Padding(
                padding: ScreenConstant.spacingAllMedium,
                child: const Text(
                  AppLabels.shiftChangeDateHeader,
                  style: TextStyle(
                      fontSize: 20,
                      color: CustomColor.darkBlue,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                )),
          ),
          GreyTileWidget(
            tileOne: "Jan 14",
            tileTwo: "Feb 11",
          ),
          GreyTileWidget(
            tileOne: 'Mar 10',
            tileTwo: 'Apr 07',
          ),
          GreyTileWidget(
            tileOne: 'May 05',
            tileTwo: 'Jun 02',
          ),
          GreyTileWidget(
            tileOne: 'Jun 30',
            tileTwo: 'Jul 28',
          ),
          GreyTileWidget(
            tileOne: 'Aug 25',
            tileTwo: 'Sep 22',
          ),
          GreyTileWidget(
            tileOne: 'Oct 20',
            tileTwo: 'Nov 17',
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 228, top: 5),
            child: Container(
              height: 50.0,
              decoration: BoxDecoration(
                color: CustomColor.customGrey,
                //border:  Border.all(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: const Center(
                child: Text(
                  "Dec 15",
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 120,
          )
        ],
      ),
    );

    // SingleChildScrollView(
    //   child: ListView(
    //     physics: const ClampingScrollPhysics(),
    //     shrinkWrap: true,
    //     children: [
    //       Center(
    //         child: Padding(
    //             padding: ScreenConstant.spacingAllMedium,
    //             child: const Text(
    //               AppLabels.shiftChangeDateHeader,
    //               style: TextStyle(
    //                   fontSize: 20,
    //                   color: CustomColor.darkBlue,
    //                   fontWeight: FontWeight.w500),
    //               textAlign: TextAlign.center,
    //             )),
    //       ),
    //       const Divider(
    //         color: Colors.black,
    //         thickness: 1,
    //       ),
    //       ListTile(
    //         leading: Image.asset('assets/icon/datetime.png'),
    //         horizontalTitleGap: 0,
    //         title: const Text(
    //           "Jan 15",
    //           style: TextStyle(fontSize: 12),
    //         ),
    //       ),
    //       const Divider(
    //         color: Colors.black,
    //         thickness: 1,
    //       ),
    //       ListTile(
    //         leading: Image.asset('assets/icon/datetime.png'),
    //         horizontalTitleGap: 0,
    //         title: const Text(
    //           "Feb 12",
    //           style: TextStyle(fontSize: 12),
    //         ),
    //       ),
    //       const Divider(
    //         color: Colors.black,
    //         thickness: 1,
    //       ),
    //       ListTile(
    //         leading: Image.asset('assets/icon/datetime.png'),
    //         horizontalTitleGap: 0,
    //         title: const Text(
    //           "Mar 12",
    //           style: TextStyle(fontSize: 12),
    //         ),
    //       ),
    //       const Divider(
    //         color: Colors.black,
    //         thickness: 1,
    //       ),
    //       ListTile(
    //         leading: Image.asset('assets/icon/datetime.png'),
    //         horizontalTitleGap: 0,
    //         title: const Text(
    //           "Apr 09",
    //           style: TextStyle(fontSize: 12),
    //         ),
    //       ),
    //       const Divider(
    //         color: Colors.black,
    //         thickness: 1,
    //       ),
    //       ListTile(
    //         leading: Image.asset('assets/icon/datetime.png'),
    //         horizontalTitleGap: 0,
    //         title: const Text(
    //           "May 07",
    //           style: TextStyle(fontSize: 12),
    //         ),
    //       ),
    //       const Divider(
    //         color: Colors.black,
    //         thickness: 1,
    //       ),
    //       ListTile(
    //         leading: Image.asset('assets/icon/datetime.png'),
    //         horizontalTitleGap: 0,
    //         title: const Text(
    //           "Jun 04",
    //           style: TextStyle(fontSize: 12),
    //         ),
    //       ),
    //       // const Divider(
    //       //   color: Colors.black,
    //       //   thickness: 1,
    //       // ),
    //       // ListTile(
    //       //   leading: Image.asset('assets/icon/datetime.png'),
    //       //   horizontalTitleGap: 0,
    //       //   title: const Text(
    //       //     "June 04",
    //       //     style: TextStyle(fontSize: 12),
    //       //   ),
    //       // ),

    //       const Divider(
    //         color: Colors.black,
    //         thickness: 1,
    //       ),
    //       ListTile(
    //         leading: Image.asset('assets/icon/datetime.png'),
    //         horizontalTitleGap: 0,
    //         title: const Text(
    //           "Jul 02",
    //           style: TextStyle(fontSize: 12),
    //         ),
    //       ),

    //       const Divider(
    //         color: Colors.black,
    //         thickness: 1,
    //       ),
    //       ListTile(
    //         leading: Image.asset('assets/icon/datetime.png'),
    //         horizontalTitleGap: 0,
    //         title: const Text(
    //           "Aug 27",
    //           style: TextStyle(fontSize: 12),
    //         ),
    //       ),

    //       const Divider(
    //         color: Colors.black,
    //         thickness: 1,
    //       ),
    //       ListTile(
    //         leading: Image.asset('assets/icon/datetime.png'),
    //         horizontalTitleGap: 0,
    //         title: const Text(
    //           "Sep 24",
    //           style: TextStyle(fontSize: 12),
    //         ),
    //       ),

    //       const Divider(
    //         color: Colors.black,
    //         thickness: 1,
    //       ),
    //       ListTile(
    //         leading: Image.asset('assets/icon/datetime.png'),
    //         horizontalTitleGap: 0,
    //         title: const Text(
    //           "Oct 22",
    //           style: TextStyle(fontSize: 12),
    //         ),
    //       ),

    //       const Divider(
    //         color: Colors.black,
    //         thickness: 1,
    //       ),
    //       ListTile(
    //         leading: Image.asset('assets/icon/datetime.png'),
    //         horizontalTitleGap: 0,
    //         title: const Text(
    //           "Nov 19",
    //           style: TextStyle(fontSize: 12),
    //         ),
    //       ),

    //       const Divider(
    //         color: Colors.black,
    //         thickness: 1,
    //       ),
    //       ListTile(
    //         leading: Image.asset('assets/icon/datetime.png'),
    //         horizontalTitleGap: 0,
    //         title: const Text(
    //           "Dec 17",
    //           style: TextStyle(fontSize: 12),
    //         ),
    //       ),

    //       // datetime.png
    //       const SizedBox(
    //         height: 120,
    //       )
    //     ],
    //   ),
    // );
  }
}
