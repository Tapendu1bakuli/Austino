import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../common/CustomColor.dart';
import '../../../../../common/device_manager/screen_constants.dart';
import '../../../../../common/device_manager/strings.dart';
import '../../controller/home_controller.dart';
import '../../widget/grey_tile.dart';

class SafeDriveTabView extends GetView<HomeController> {
  const SafeDriveTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.safeDriveBackgeoundChange();
    return SingleChildScrollView(
      child:
        Obx(()=> Container(color: controller.isSafeRideYellow.value ? Colors.yellow : Colors.black,
          height: MediaQuery.of(context).size.height,
          child:   ListView(
            physics:const ClampingScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: [
              Container(height: 10,),
              Center(child: Padding(
                padding: ScreenConstant.spacingAllMedium,
                child:  Text("Yellow Cab",style: TextStyle(fontSize: 24,color: controller.isSafeRideYellow.value ? Colors.black : Colors.white,fontWeight: FontWeight.w500),textAlign: TextAlign.center,)
                ),),
              const SizedBox(height: 20,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(()=>  TextButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                            backgroundColor: controller.isSafeRideYellow.value ? MaterialStateProperty.all<Color>(Colors.black) : MaterialStateProperty.all<Color>(Colors.yellow),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),

                                )
                            )
                        ),
                        onPressed: () async{
                          const url = "tel:5124529999";
                          if (await canLaunch(url)) {
                          await launch(url);
                          } else {
                          throw 'Could not launch $url';
                          }
                        },
                        child: Text(
                            "      TAP TO CALL     ".toUpperCase(),
                            style: TextStyle(fontSize: 22,color: controller.isSafeRideYellow.value ? Colors.yellow : Colors.black)
                        )
                    )),
                 //   SizedBox(width: 10),

                  ]
              ),
              const SizedBox(height: 20,),
              Center(child: Padding(
                  padding: ScreenConstant.spacingAllMedium,
                  child:  Text("Account Number\n8176",style: TextStyle(fontSize: 24,color: controller.isSafeRideYellow.value ? Colors.black : Colors.white,fontWeight: FontWeight.w500),textAlign: TextAlign.center,)
              ),),

              const SizedBox(height: 120,)
            ],
          ),))
    );
  }
}