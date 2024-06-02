import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/CustomColor.dart';
import '../../../../../common/device_manager/screen_constants.dart';
import '../../../../../common/device_manager/strings.dart';
import '../../controller/home_controller.dart';
import '../../widget/grey_tile.dart';

class PayDayTabView extends GetView<HomeController> {
  const PayDayTabView({Key? key}) : super(key: key);

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
                  AppLabels.payDayHeader,
                  style: TextStyle(
                      fontSize: 20,
                      color: CustomColor.darkBlue,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                )),
          ),
          GreyTileWidget(
            tileOne: "Jan 05",
            tileTwo: "Jul 05",
          ),
          GreyTileWidget(
            tileOne: 'Jan 19',
            tileTwo: 'Jul 19',
          ),
          GreyTileWidget(
            tileOne: 'Feb 02',
            tileTwo: 'Aug 02',
          ),
          GreyTileWidget(
            tileOne: 'Feb 16',
            tileTwo: 'Aug 16',
          ),
          GreyTileWidget(
            tileOne: 'Mar 01',
            tileTwo: 'Aug 30',
          ),
          GreyTileWidget(
            tileOne: 'Mar 15',
            tileTwo: 'Sep 13',
          ),
          GreyTileWidget(
            tileOne: 'Mar 29',
            tileTwo: 'Sep 27',
          ),
          GreyTileWidget(
            tileOne: 'Apr 12',
            tileTwo: 'Oct 11',
          ),
          GreyTileWidget(
            tileOne: 'Apr 26',
            tileTwo: 'Oct 25',
          ),
          GreyTileWidget(
            tileOne: 'May 10',
            tileTwo: 'Nov 08',
          ),
          GreyTileWidget(
            tileOne: 'May 24',
            tileTwo: 'Nov 22',
          ),
          GreyTileWidget(
            tileOne: 'Jun 07',
            tileTwo: 'Dec 06',
          ),
          GreyTileWidget(
            tileOne: 'Jun 21',
            tileTwo: 'Dec 20',
          ),
          const SizedBox(
            height: 120,
          )
        ],
      ),
    );
  }
}
