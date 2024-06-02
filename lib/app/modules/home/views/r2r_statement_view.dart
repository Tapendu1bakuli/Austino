import 'package:apamobile/app/modules/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import '../../../../common/device_manager/screen_constants.dart';
import '../../../../common/device_manager/strings.dart';
import '../../../../common/helper.dart';
import '../../../routes/app_routes.dart';


class R2rStatementView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor:const Color(0xff08084a),
          centerTitle: true,
          title:const Text(AppLabels.R2RStatement),
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
            SingleChildScrollView(child: GestureDetector(
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);

                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              child: ListView(
                physics:const ClampingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Padding(
                      padding: ScreenConstant.spacingAllMedium,
                      child: Text(AppLabels.R2RStatementBody)
                  ),
                  Container(
                    padding:EdgeInsets.only(bottom: 10,top: 10) ,
                    child: Divider(color: Colors.black,thickness: 1,),
                  ),
                  Center(child: Text("Disclaimer",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),),
                  Padding(
                      padding: ScreenConstant.spacingAllMedium,
                      child: Text(AppLabels.R2RStatementDisclaimer)
                  ),
                ],
              ),
            ),)
        );
  }
}
