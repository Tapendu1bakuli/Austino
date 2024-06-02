import 'package:apamobile/common/device_manager/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/device_manager/screen_constants.dart';
import '../../../../common/device_manager/text_styles.dart';
import '../../../../common/widgets/app_button.dart';
import '../../../../common/widgets/required_text_field.dart';
import '../../../routes/app_routes.dart';
import '../../global_widgets/loader.dart';
import '../controllers/auth_controller.dart';

class RegisterView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    //controller.getAllRanks();
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: const Color(0xff08084a),
              centerTitle: true,
              title: const Text(AppLabels.register),
              leading: GestureDetector(
                onTap: () {
                  Get.offAllNamed(Routes.LOGIN);
                },
                child: Container(
                  margin: const EdgeInsets.all(13.0),
                  padding: const EdgeInsets.all(1.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffffffff)),
                      borderRadius: BorderRadius.circular(5)),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Color(0xffffffff),
                  ),
                ),
              ),
            ),
            backgroundColor: const Color(0xffffffff),
            body: Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);

                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                  },
                  child: ListView(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      Padding(
                        padding: ScreenConstant.spacingAllMedium,
                        child: Form(
                          key: controller.registerFormKey,
                          child: ListView(
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            children: [
                              Container(
                                height: ScreenConstant.sizeSmall,
                              ),
                              Row(
                                children: [
                                  const Expanded(
                                      flex: 1,
                                      child: Text(
                                        AppLabels.rank,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Expanded(
                                    flex: 2,
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.bottomSheet(
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.black87,
                                            ),
                                            margin: const EdgeInsets.all(20),
                                            height:
                                                ScreenConstant.screenHeightHalf,
                                            child: ListView.builder(
                                                itemCount: controller
                                                        .ranks?.ranks.length ??
                                                    0,
                                                shrinkWrap: true,
                                                physics:
                                                    const ClampingScrollPhysics(),
                                                itemBuilder:
                                                    (BuildContext context,
                                                        index) {
                                                  return GestureDetector(
                                                    child: Padding(
                                                      padding: ScreenConstant
                                                          .spacingAllMedium,
                                                      child: Column(
                                                        children: [
                                                          Row(children: [
                                                            controller
                                                                        .ranks
                                                                        ?.ranks[
                                                                            index]
                                                                        .isSelected ??
                                                                    false
                                                                ? const Icon(
                                                                    Icons
                                                                        .circle,
                                                                    color: Colors
                                                                        .white,
                                                                  )
                                                                : const Icon(
                                                                    Icons
                                                                        .circle_outlined,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                            Container(
                                                              width:
                                                                  ScreenConstant
                                                                      .sizeXL,
                                                            ),
                                                            Expanded(
                                                              child: Text(
                                                                controller
                                                                        .ranks
                                                                        ?.ranks[
                                                                            index]
                                                                        .title ??
                                                                    "",
                                                                style: TextStyles
                                                                    .subTitleWhite
                                                                    .copyWith(
                                                                        fontSize:
                                                                            22),
                                                              ),
                                                            ),
                                                          ]),
                                                          const Divider(
                                                            color:
                                                                Colors.black45,
                                                            thickness: 2,
                                                            indent: 5,
                                                            endIndent: 5,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      // controller.myRanks[index].isSelected=false;
                                                      controller.SelectedRankId
                                                          .value = controller
                                                              .ranks
                                                              ?.ranks[index]
                                                              .id ??
                                                          0;
                                                      controller.SelectedRank
                                                          .value = controller
                                                              .ranks
                                                              ?.ranks[index]
                                                              .title ??
                                                          "------- Select Rank -------";
                                                      Get.back();
                                                    },
                                                  );
                                                }),
                                          ),
                                        );
                                      },
                                      child: Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        spacing: ScreenConstant.sizeUltraXXXL,
                                        children: [
                                          Obx(
                                            () => Text(
                                              controller.SelectedRank.value,
                                              style: Get.textTheme
                                                  .bodyMedium, //TextStyle(color: Get.theme.hintColor),
                                            ),
                                          ),
                                          Icon(
                                            Icons.keyboard_arrow_down,
                                            color: Get.theme.hintColor,
                                            size: 21,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 1,
                                color: Colors.black,
                              ),
                              Row(
                                children: [
                                  const Expanded(
                                      flex: 1,
                                      child: Text(
                                        AppLabels.firstName,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Expanded(
                                    flex: 2,
                                    child: RequireTextField(
                                      controller:
                                          controller.firstNameTextController,
                                      labelText: AppLabels.enterFirstName,
                                      type: Type.userFName,
                                      validationFunction: (String? value) {},
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 1,
                                color: Colors.black,
                              ),
                              Row(
                                children: [
                                  const Expanded(
                                      flex: 1,
                                      child: Text(
                                        AppLabels.lastName,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Expanded(
                                    flex: 2,
                                    child: RequireTextField(
                                      controller:
                                          controller.lastNameTextController,
                                      labelText: AppLabels.enterLastName,
                                      type: Type.userLName,
                                      validationFunction: (String? value) {},
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 1,
                                color: Colors.black,
                              ),
                              Row(
                                children: [
                                  const Expanded(
                                      flex: 1,
                                      child: Text(
                                        AppLabels.emailAddress,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Expanded(
                                    flex: 2,
                                    child: RequireTextField(
                                      controller:
                                          controller.emailRegTextController,
                                      showDecoration: true,
                                      labelText: AppLabels.emailAddress,
                                      type: Type.email,
                                      validationFunction: (String? value) {},
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 1,
                                color: Colors.black,
                              ),
                              Row(
                                children: [
                                  const Expanded(
                                      flex: 1,
                                      child: Text(
                                        AppLabels.employeeNo,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Expanded(
                                    flex: 2,
                                    child: RequireTextField(
                                      controller: controller
                                          .employeeNumberTextController,
                                      labelText: AppLabels.enterEmployeeNo,
                                      type: Type.general,
                                      hintText: "Enter AP Number",
                                      validationFunction: (String? value) {},
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 1,
                                color: Colors.black,
                              ),
                              Row(
                                children: [
                                  const Expanded(
                                      flex: 1,
                                      child: Text(
                                        AppLabels.cellPhone,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Expanded(
                                    flex: 2,
                                    child: RequireTextField(
                                      controller:
                                          controller.cellphoneTextController,
                                      showDecorationForCall: true,
                                      labelText: AppLabels.enterCellPhone,
                                      type: Type.phone,
                                      validationFunction: (String? value) {},
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: ScreenConstant.spacingAllXXL,
                                child: AppButton(
                                  buttonText: AppLabels.register,
                                  onPressed: () async {
                                    if (controller.cellphoneTextController.text
                                                .toString()
                                                .substring(0, 6) ==
                                            "512974" ||
                                        controller.cellphoneTextController.text
                                                .toString()
                                                .substring(0, 6) ==
                                            "512802" ||
                                        controller.cellphoneTextController.text
                                                .toString()
                                                .substring(0, 6) ==
                                            "737228") {
                                      Get.showSnackbar(const GetSnackBar(
                                        snackPosition: SnackPosition.BOTTOM,
                                        message:
                                            "You are not able to register because your cell phone numer is restricted.",
                                        duration: Duration(seconds: 2),
                                        margin: EdgeInsets.only(
                                            bottom: 20, left: 10, right: 10),
                                      ));
                                    } else if (controller
                                            .emailRegTextController.text
                                            .toString()
                                            .contains("@austintexas.gov") ||
                                        controller.emailRegTextController.text
                                            .toString()
                                            .contains("@ausps.org")) {
                                      Get.showSnackbar(const GetSnackBar(
                                        snackPosition: SnackPosition.BOTTOM,
                                        message:
                                            "You are not able to register because your email domains are restricted.",
                                        duration: Duration(seconds: 2),
                                        margin: EdgeInsets.only(
                                            bottom: 20, left: 10, right: 10),
                                      ));
                                    } else {
                                      bool result = await controller.register();
                                      if (result) {
                                        Get.toNamed(Routes.LOGIN);
                                        Get.defaultDialog(
                                          title: "Success!",
                                          middleText:
                                              "Success! You will receive an automated email once your account has been approved. Approvals are done by the APA office during normal business hours.",
                                          backgroundColor: Colors.white,
                                          titleStyle:
                                              TextStyle(color: Colors.black),
                                          middleTextStyle:
                                              TextStyle(color: Colors.black),
                                          radius: 5,
                                        );
                                      }
                                    }
                                  },
                                ),
                              ),
                              Container(
                                height: ScreenConstant.sizeXXXL,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: ScreenConstant.sizeXL,
                      ),
                    ],
                  ),
                ),
                Obx(() => Visibility(
                      visible: controller.loading.value,
                      child: const Loader(),
                    ))
              ],
            )));
  }
}
