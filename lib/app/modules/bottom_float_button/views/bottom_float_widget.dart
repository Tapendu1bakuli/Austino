import 'package:apamobile/common/CustomColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../routes/app_routes.dart';
class BottomFloatWidget extends StatelessWidget {
  const BottomFloatWidget({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool urRightClicked = false;
    return Padding(
    padding: const EdgeInsets.only(left:18.0,right: 18,bottom: 0),
    child: Row(
    children: [
      Column(mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,children: [
        Container(height: 45,padding: const EdgeInsets.only(bottom: 3),child: SpeedDial(


          switchLabelPosition: true,
          overlayOpacity: 0.4,
          backgroundColor: Colors.red,
          overlayColor: Colors.grey,
          activeIcon: Icons.close,
          activeBackgroundColor: CustomColor.customButtonYellow,
          icon: Icons.error_outline,
          spaceBetweenChildren: 15,
          children: [
            SpeedDialChild(

              child: Image.asset('assets/icon/invoice.png'),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,

              label: 'Bill of Rights',
              onTap: () => Get.toNamed(Routes.BillofRightsView),
              // onLongPress: () => debugPrint('FIRST CHILD LONG PRESS'),
            ),
            SpeedDialChild(
              child:  Image.asset('assets/icon/crown.png'),
              backgroundColor: Colors.purple,
              foregroundColor: Colors.white,
              label: 'Constitutional Rights',
              onTap: () => Get.toNamed(Routes.CRightsView),
            ),
            SpeedDialChild(
              child: Image.asset('assets/icon/order.png'),
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              label: 'Dispersal Order',
              visible: true,
              onTap: () => Get.toNamed(Routes.DispersalOrderView),
             // onLongPress: () => debugPrint('THIRD CHILD LONG PRESS'),
            ),
            SpeedDialChild(
              child: Image.asset('assets/icon/hands.png'),
              backgroundColor: Colors.cyan,
              foregroundColor: Colors.white,
              label: 'Public Safety Questions',
              onTap: () => Get.toNamed(Routes.PublicSafetyQuestions),
             // onLongPress: () => debugPrint('FIRST CHILD LONG PRESS'),
            ),
            SpeedDialChild(
              child:  Image.asset('assets/icon/bandage.png'),
              backgroundColor: Colors.deepOrange,
              foregroundColor: Colors.white,
              label: 'Critical Incident Tips',
              onTap: () => Get.toNamed(Routes.CriticalIncidentTips),
            ),
            SpeedDialChild(
              child: Image.asset('assets/icon/statemeny-icon.png'),
              backgroundColor: Colors.indigo,
              foregroundColor: Colors.white,
              label: 'R2R Statement',
              visible: true,
              onTap: () => Get.toNamed(Routes.R2RStatement),
              //onLongPress: () => debugPrint('THIRD CHILD LONG PRESS'),
            ),
          ],
        ),)
        ,
        const Text("Your Rights",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),)
      ],),

    Spacer(),
      Column(mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,children: [
        Container(height: 45,padding: EdgeInsets.only(bottom: 3),child: SpeedDial(
          overlayOpacity: 0.4,
          activeIcon: Icons.close,
          activeBackgroundColor: CustomColor.customButtonYellow,
          // animatedIcon: AnimatedIcons.menu_close,
          backgroundColor: Colors.blue,
          overlayColor: Colors.grey,
          icon: Icons.wifi_calling_3_outlined,
          children: [
            SpeedDialChild(
              child: const Icon(Icons.public),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              label: 'www.austinpolice.com',
              onTap: () async {
                const url = 'http://www.austinpolice.com';
                await launchUrl(Uri.parse(url));
              },
              //onLongPress: () => debugPrint('FIRST CHILD LONG PRESS'),
            ),
            SpeedDialChild(
              child: const Icon(Icons.phone),
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              label: '(512)474 - 6993)',
              onTap: () async {
                const url = "tel:5124746993";
                if (await canLaunch(url)) {
                await launch(url);
                } else {
                throw 'Could not launch $url';
                }
              },
            ),

          ],
        ),)
        ,
        Text("Call Us",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),)
      ],),

    ],
    ),
    );

  }
}

