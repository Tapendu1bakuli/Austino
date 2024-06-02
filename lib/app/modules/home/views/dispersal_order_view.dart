import 'package:apamobile/app/modules/home/controller/home_controller.dart';
import 'package:apamobile/common/CustomColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import '../../../../common/device_manager/screen_constants.dart';
import '../../../../common/device_manager/strings.dart';
import '../../../../common/helper.dart';
import '../../../routes/app_routes.dart';


class DispersalOrderView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor:const Color(0xff08084a),
          centerTitle: true,
          title:const Text(AppLabels.dispersalOrderHeader),
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
                child: const Text(AppLabels.dispersalorderHeaderOne,style: TextStyle(fontSize: 20,color: CustomColor.darkBlue),textAlign: TextAlign.center,)
            ),),
            Center(child: Padding(
                padding: ScreenConstant.spacingAllMedium,
                child: const Text("Notice to Persons Obstructing Highway or Passageway:",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: CustomColor.myCustomBlack),textAlign: TextAlign.center,)
            ),),

            Center(child:
            Padding(
                padding: ScreenConstant.spacingAllMedium,
                child:
            RichText(
              text: const TextSpan(
                text:"Street : ",
                // Note: Styles for TextSpans must be explicitly defined.
                // Child text spans will inherit styles from parent
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,fontWeight: FontWeight.w600
                ),
                children: <TextSpan>[
                  TextSpan(style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,fontWeight: FontWeight.normal
                  ),text: '"You are violating state law. You must move out of the street immediately. If you do not move, you will be subject to arrest for obstructing the roadway."'),
                ],
              ),
            ))),

            Center(child:
            Padding(
                padding: ScreenConstant.spacingAllMedium,
                child:
                RichText(
                  text: const TextSpan(
                    text:"Entrance : ",
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,fontWeight: FontWeight.w600
                    ),
                    children: <TextSpan>[
                      TextSpan(style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,fontWeight: FontWeight.normal
                      ),text: '"You are violating state law. You must move away from the entrance to this building immediately. If you do not move, you will be subject to arrest for obstructing the entrance."'),
                    ],
                  ),
                ))),

            Center(child:
            Padding(
                padding: ScreenConstant.spacingAllMedium,
                child:
                RichText(
                  text: const TextSpan(
                    text:"Sidewalk : ",
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,fontWeight: FontWeight.w600
                    ),
                    children: <TextSpan>[
                      TextSpan(style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,fontWeight: FontWeight.normal
                      ),text: '"You are violating state law. You must move immediately so the sidewalk is not obstructed. If you do not move, you will be subject to arrest for obstructing the sidewalk."'),
                    ],
                  ),
                ))),

            Center(child:
            Padding(
                padding: ScreenConstant.spacingAllMedium,
                child:
                RichText(
                  text: const TextSpan(

                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,fontWeight: FontWeight.w600
                    ),
                    children: <TextSpan>[
                      TextSpan(style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,fontWeight: FontWeight.normal
                      ),text: '(Officers should allow persons a reasonable amount of time to comply with the order to move before enforcement action is taken. A second warning should be given before enforcement action is taken.)'),
                    ],
                  ),
                ))),

            Center(child: Padding(
                padding: ScreenConstant.spacingAllMedium,
                child: const Text(AppLabels.dispersalorderHeaderTwo,style: TextStyle(fontSize: 20,color: CustomColor.darkBlue),textAlign: TextAlign.center,)
            ),),

            Center(child:
            Padding(
                padding: ScreenConstant.spacingAllMedium,
                child:
                RichText(
                  text: const TextSpan(

                    text: "Calle:",
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,fontWeight: FontWeight.w600
                    ),
                    children: <TextSpan>[
                      TextSpan(style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,fontWeight: FontWeight.normal
                      ),text: '"Usted está violando la ley estatal. Debes salir de la calle de inmediato. Si usted no se muda, usted estará sujeto a ser arrestado por obstruir la calzada".'),
                    ],
                  ),
                ))),


            Center(child:
            Padding(
                padding: ScreenConstant.spacingAllMedium,
                child:
                RichText(
                  text: const TextSpan(

                    text: "Entrada:",
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,fontWeight: FontWeight.w600
                    ),
                    children: <TextSpan>[
                      TextSpan(style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,fontWeight: FontWeight.normal
                      ),text: '"Usted está violando la ley estatal. Usted debe alejarse de la entrada a este edificio inmediatamente. Si usted no se muda, usted estará sujeto a arrestado por obstruir la entrada".'),
                    ],
                  ),
                ))),

            Center(child:
            Padding(
                padding: ScreenConstant.spacingAllMedium,
                child:
                RichText(
                  text: const TextSpan(

                    text: "Acera:",
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,fontWeight: FontWeight.w600
                    ),
                    children: <TextSpan>[
                      TextSpan(style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,fontWeight: FontWeight.normal
                      ),text: '"Usted está violando la ley estatal. Usetd debe pasar de inmediato por lo que la acera no esté obstruido. Si usted no se muda, usted estará sujeto a ser arrestado por obstruir la acera".'),
                    ],
                  ),
                ))),

            Container(height: 50,)

          ],
        ),)
    );
  }
}
