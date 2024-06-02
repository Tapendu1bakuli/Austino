import 'package:apamobile/app/modules/global_widgets/loader.dart';
import 'package:apamobile/common/device_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Service/global_service.dart';
import '../../../../common/device_manager/screen_constants.dart';
import '../../../../common/device_manager/strings.dart';
import '../../../../common/widgets/required_text_field.dart';
import '../../../../main.dart';
import '../../../routes/app_routes.dart';
import '../controllers/auth_controller.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Form(
                  key: controller.loginFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: ScreenConstant.sizeLarge),
                        child: Text(AppLabels.welcome,
                            style: Get.textTheme.displaySmall?.merge(
                                const TextStyle(
                                    color: AppColors.primaryColorDash))),
                      ),
                      Container(
                        padding: ScreenConstant.spacingAllDefault,
                        height: ScreenConstant.defaultHeightOneEighty,
                        width: ScreenConstant.defaultImageWidth,
                        child: Image.asset(
                          'assets/icon/icon_without_shadow.png',
                        ),
                      ),
                      Container(
                        height: ScreenConstant.sizeXL,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenConstant.sizeXXL,
                            vertical: ScreenConstant.sizeSmall),
                        child: RequireTextField(
                          controller: controller.phoneOrEmailTextController,
                          type: Type.email,
                          validationFunction: (String? value) {},
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenConstant.sizeXXL,
                            vertical: ScreenConstant.sizeSmall),
                        child: RequireTextField(
                          controller: controller.passwordTextController,
                          labelText: AppLabels.password,
                          type: Type.passWord,
                          validationFunction: (String? value) {},
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(ScreenConstant.sizeXXL),
                        child: GestureDetector(
                          onTap: () {
                            controller.login();
                          },
                          child: Container(
                            height: ScreenConstant.sizeXXXL,
                            decoration: BoxDecoration(
                                color: const Color(0xff08084a),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(
                              AppLabels.login,
                              style: Get.textTheme.bodyMedium?.merge(
                                  const TextStyle(
                                      color: Color(0xffffffff),
                                      fontWeight: FontWeight.bold)),
                            )),
                          ),
                        ),
                      ),
                      Container(
                        height: ScreenConstant.sizeExtraSmall,
                      ),
                      GestureDetector(
                        onTap: () {
                          // controller.gotoRegister();
                          Get.toNamed(Routes.REGISTER);
                        },
                        child: Text(
                          AppLabels.registerNow,
                          style: Get.textTheme.titleLarge?.merge(
                            const TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 15),
                          ),
                        ),
                      ),
                      Container(
                        height: ScreenConstant.sizeSmall,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.sendSupportMail();
                            },
                            child: Text(
                              AppLabels.contactSupport,
                              style: Get.textTheme.bodyMedium?.merge(
                                const TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 15),
                              ),
                            ),
                          ),
                          Container(
                            width: ScreenConstant.sizeExtraSmall,
                          ),
                          Text(
                            "|",
                            style: Get.textTheme.bodyMedium?.merge(
                              const TextStyle(
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                          Container(
                            width: ScreenConstant.sizeExtraSmall,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.FORGOT_PASSWORD);
                            },
                            child: Text(
                              AppLabels.forgotPassword,
                              style: Get.textTheme.titleLarge?.merge(
                                const TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 15),
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        height: 10,
                      ),
                      Text(
                        "${AppLabels.version} ${Get.find<GlobalService>().getPlatformVersion()}",
                        style: TextStyle(fontSize: 18, color: Colors.blueGrey),
                      )
                    ],
                  ),
                ),
              ),
              Obx(() => Visibility(
                    child: Loader(),
                    visible: controller.loading.value,
                  ))
            ],
          )),
    );
  }
}
