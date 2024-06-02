import 'package:apamobile/app/modules/home/controller/home_controller.dart';
import 'package:apamobile/common/CustomColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import '../../../../common/device_manager/screen_constants.dart';
import '../../../../common/device_manager/strings.dart';
import '../../../../common/helper.dart';
import '../../../routes/app_routes.dart';


class CITipsView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor:const Color(0xff08084a),
          centerTitle: true,
          title:const Text(AppLabels.CITHeader),
          leading: GestureDetector(
            onTap: () {
              Get.offAllNamed(Routes.HOME);
            },
            child: Container(
              margin: const EdgeInsets.all(13.0),
              padding: const EdgeInsets.all(1.0),
              decoration: BoxDecoration(
                  border: Border.all(color:const Color(0xffffffff)),
                  borderRadius: BorderRadius.circular(5)),
              child:const Icon(
                Icons.arrow_back,
                color: Color(0xffffffff),
              ),
            ),
          ),
        ),
        backgroundColor: const Color(0xffffffff),
        body:
        SingleChildScrollView(child:
        ListView(
          physics:const ClampingScrollPhysics(),
          shrinkWrap: true,
          children: [
        Center(child: Padding(
                padding: ScreenConstant.spacingAllMedium,
                child: Text(AppLabels.CITTitle,style: TextStyle(fontSize: 20,color: CustomColor.darkBlue),textAlign: TextAlign.center,)
            ),),

            Center(child:
            Padding(
                padding: ScreenConstant.spacingAllMedium,
                child: const Text(AppLabels.CITBody)
            ),)
          ],
        ),)
    );
  }
}
