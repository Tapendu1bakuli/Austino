import 'package:apamobile/common/ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/device_manager/screen_constants.dart';
import '../../../../common/device_manager/strings.dart';
import '../../../../common/widgets/required_text_field.dart';
import '../../../routes/app_routes.dart';
import '../../global_widgets/loader.dart';
import '../controllers/auth_controller.dart';

class ForgotPasswordView extends GetView<AuthController> {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xffffffff),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        height: ScreenConstant.defaultHeightTwoHundredTen,
                        child: Image.asset(
                          'assets/icon/icon_without_shadow.png',
                        ),
                      ),
                      Container(
                        height: ScreenConstant.sizeExtraSmall,
                      ),
                      const Text(AppLabels.forgotPassword,
                          style:
                              TextStyle(color: Colors.black45, fontSize: 25)),
                      Container(
                        height: ScreenConstant.sizeExtraSmall,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenConstant.sizeXL,
                            vertical: ScreenConstant.sizeSmall),
                        child: Form(
                          key: controller.forgotPasswordFormEmailKey,
                          child: RequireTextField(
                            controller: controller.emailTextController,
                            labelText: AppLabels.emailAddress,
                            type: Type.email,
                            validationFunction: (String? value) {},
                          ),
                        ),
                      ),
                      Container(
                        height: ScreenConstant.sizeExtraSmall,
                      ),
                      Text(AppLabels.or,
                          style: Get.textTheme.bodyMedium?.merge(
                              const TextStyle(color: Color(0xff01153d)))),
                      Container(
                        height: ScreenConstant.sizeExtraSmall,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenConstant.sizeXL,
                            vertical: ScreenConstant.sizeSmall),
                        child: Form(
                          key: controller.forgotPasswordFormPhoneKey,
                          child: RequireTextField(
                            controller: controller.phoneNumberTextController,
                            labelText: AppLabels.cellPhone,
                            type: Type.phone,
                            validationFunction: (String? value) {},
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (controller.phoneNumberTextController.text != "" ||
                              controller.emailTextController.text != "") {
                            bool result = await controller.forgotPassword();
                            debugPrint("Result- $result");
                            if (result) {
                              Get.toNamed(Routes.LOGIN);
                              controller.emailTextController.text = "";
                              controller.phoneNumberTextController.text = "";
                              Get.defaultDialog(
                                  title: "Success!",
                                  middleText:
                                      "A link to reset your password has been emailed/messaged to you!",
                                  backgroundColor: Colors.white,
                                  titleStyle:
                                      const TextStyle(color: Colors.black),
                                  middleTextStyle:
                                      const TextStyle(color: Colors.black),
                                  radius: 5,
                                  confirm: ElevatedButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: const Text("OK")));
                            } else {
                              controller.phoneNumberTextController.text = "";
                              Get.defaultDialog(
                                  title: "Sorry!",
                                  middleText: "This number is not US number!",
                                  backgroundColor: Colors.white,
                                  titleStyle:
                                      const TextStyle(color: Colors.black),
                                  middleTextStyle:
                                      const TextStyle(color: Colors.black),
                                  radius: 5,
                                  confirm: ElevatedButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: const Text("OK")));
                            }
                          } else {
                            Get.defaultDialog(
                                title: "Message",
                                middleText: "Please enter a valid input.",
                                backgroundColor: Colors.white,
                                titleStyle:
                                    const TextStyle(color: Colors.black),
                                middleTextStyle:
                                    const TextStyle(color: Colors.black),
                                radius: 5,
                                confirm: ElevatedButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: const Text("OK")));
                            // Get.showSnackbar(Ui.ErrorSnackBar(message: "Please enter a valid input."));
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: ScreenConstant.sizeXXL,
                              vertical: ScreenConstant.sizeSmall),
                          child: Container(
                            height: ScreenConstant.defaultHeightFifty,
                            decoration: BoxDecoration(
                                color: const Color(0xff08084a),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(
                              AppLabels.retrievePassword,
                              style: Get.textTheme.bodyMedium?.merge(
                                  const TextStyle(
                                      color: Color(0xffffffff),
                                      fontWeight: FontWeight.bold)),
                            )),
                          ),
                        ),
                      ),
                      Container(
                        height: ScreenConstant.sizeSmall,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.offAllNamed(Routes.LOGIN);
                        },
                        child: Container(
                          child: Text(
                            AppLabels.loginNow,
                            style: Get.textTheme.bodyMedium?.merge(
                              const TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Obx(() => Visibility(
                    visible: controller.loading.value,
                    child: const Loader(),
                  ))
            ],
          )),
    );
  }
}
