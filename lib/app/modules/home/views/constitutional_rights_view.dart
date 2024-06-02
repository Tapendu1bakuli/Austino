import 'package:apamobile/app/modules/home/controller/home_controller.dart';
import 'package:apamobile/common/CustomColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import '../../../../common/device_manager/screen_constants.dart';
import '../../../../common/device_manager/strings.dart';
import '../../../../common/helper.dart';
import '../../../routes/app_routes.dart';


class CRightsView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor:const Color(0xff08084a),
          centerTitle: true,
          title:const Text(AppLabels.constitutionalRightsHeader),
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
                child: const Text("To Protect Your Constitutional Rights in the Following Situations:",style: TextStyle(fontSize: 20,color: CustomColor.darkBlue),textAlign: TextAlign.center,)
            ),),

            Center(child:
            Padding(
                padding: ScreenConstant.spacingAllMedium,
                child: const Text("• If you are read the Miranda warning or are accused of or charged with a criminal offense, or\n• If you have discharged your firearm or a person in your custody has sustained an injury as a result of your actions, or\n• If you are ordered by Internal Affairs or a supervisor to make a statement, or\n• If you receive a lawsuit by personal delivery or by mail, whether specifically naming you as a party or not.")
            ),),


            Center(child: Padding(
                padding: ScreenConstant.spacingAllMedium,
                child: const Text("The Austin Police Association instructs that you do the following:",style: TextStyle(fontSize: 15,color: CustomColor.myCustomBlack,fontWeight: FontWeight.w600),textAlign: TextAlign.center,)
            ),),

            Center(child:
            Padding(
                padding: ScreenConstant.spacingAllMedium,
                child: Text('1. IMMEDIATELY contact APA\'s CLEAT Hotline: 24 Hour Legal Assistance Number: 800-752-5328 \n\n2. DO NOT UNSER ANY CIRCUMSTANCES talk about your case with anyone, including your partners, superiors, or friends, unless advised to do so by your attorney.\n\n3. When compelled to make a written statement without the benefit of legal assistance, write at the beginning of your statement:')
            ),),

            Center(child:
            Padding(
                padding: ScreenConstant.spacingAllMedium,
                child: Text('"This statement is being made only as a result of a command by my supervisor to do so and is not a voluntary act on my part."',style: TextStyle(fontWeight: FontWeight.w500),)

                    //Text('1. IMMEDIATELY contact APA\'s CLEAT Hotline: 24 Hour Legal Assistance Number: 800-752-5328 \n\n2. DO NOT UNSER ANY CIRCUMSTANCES talk about your case with anyone, including your partners, superiors, or friends, unless advised to do so by your attorney.\n\n3. When compelled to make a written statement without the benefit of legal assistance, write at the beginning of your statement:\n')
            ),),


            Center(child: Padding(
                padding: ScreenConstant.spacingAllMedium,
                child: const Text("CLEAT Constitutional Protections Statement",style: TextStyle(fontSize: 20,color: CustomColor.darkBlue),textAlign: TextAlign.center,)
            ),),

            Center(child:
            Padding(
                padding: ScreenConstant.spacingAllMedium,
                child: const Text('On________ (date/time) at _______________ (place), I was ordered to submit this report (give this statement) by ____________________ (name & rank). I submit this report (give this statement) at their order as a condition of employment. In view of possible job forfeiture, I have no alternative but to abide by this order. It is my belief and understanding that the department requires this report (statement) solely and exclusively for internal purposes and will not release it to any other agency or authority except as is required by law. It is my further belief that this report (statement) will not and cannot be used against me in any subsequent proceeding other than disciplinary proceedings within the confines of the department itself.\n\nFor any and all other purposes, I hereby reserve my constitutional right to remain silent under the FIFTH and FOURTEENTH AMENDMENTS to the UNITED STATES CONSTITION and other rights prescribed by law. Further, I rely specifically upon the protection afforded me under Garrity vs. New Jersey 385 U.S. 439 (1967), Spevak vs. Klein, 385 US 511 (1967) and Gardner vs. Broderick, 392 US 273 (1968), should this report (statement) be used for any other purpose whatsoever kind or description.\n(Word the above verbatim at the end of your statement)',)

            ),),

          ],
        ),)
    );
  }
}
