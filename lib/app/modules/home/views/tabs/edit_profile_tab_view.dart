import 'package:apamobile/app/modules/home/controller/home_controller.dart';
import 'package:apamobile/common/device_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../../common/device_manager/screen_constants.dart';
import '../../../../routes/app_routes.dart';

class EditProfileTabScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetX<HomeController>(initState: (state) {
      Future.delayed(const Duration(milliseconds: 100), () {
        controller.getUserDetails();
      });
    }, builder: (_) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.appPrimaryColor,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            "Edit Profile",
            style: TextStyle(fontSize: 18, color: AppColors.white),
          ),
          leading: GestureDetector(
            onTap: () {
              // Get.back();
              Get.offAllNamed(Routes.HOME);
            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 5,
                width: 5,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(4)),
                child: const Icon(
                  Icons.arrow_back,
                  color: AppColors.white,
                  size: 18,
                ),
              ),
            ),
          ),
        ),
        body: controller.getUserDetailsData.value.id == null
            ? Container()
            : SingleChildScrollView(
                reverse: true,
                child: Column(
                  children: [
                    Container(
                      color: Colors.grey.withOpacity(.1),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 15.0,
                              left: 15,
                              right: 15,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Expanded(
                                  flex: 1,
                                  child: Text(
                                    "Rank",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        controller.rankName.value,
                                        style: const TextStyle(
                                            color: Colors.black54,
                                            fontSize: 14),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          selectContact();
                                        },
                                        child: const Icon(
                                            Icons.keyboard_arrow_down_outlined),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Divider(
                              thickness: 1,
                              color: Colors.grey[400],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                              right: 15,
                            ),
                            child: Row(
                              children: [
                                const Expanded(
                                  flex: 1,
                                  child: Text(
                                    "First Name",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: TextFormField(
                                    controller: controller.firstNameController,
                                    keyboardType: TextInputType.name,
                                    autofocus: false,
                                    enabled: false,
                                    onChanged: (v) {
                                      controller.isEditDetails.value = true;
                                    },
                                    style: const TextStyle(
                                        color: Colors.black54, fontSize: 14),
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.all(0),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 14),
                                    ),
                                  ),
                                  // Text(
                                  //   controller
                                  //       .getUserDetailsData.value.firstName!,
                                  //   style: const TextStyle(
                                  //       color: Colors.black54, fontSize: 14),
                                  // ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Divider(
                              thickness: 1,
                              color: Colors.grey[400],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                              right: 15,
                            ),
                            child: Row(
                              children: [
                                const Expanded(
                                  flex: 1,
                                  child: Text(
                                    "Last Name",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: TextFormField(
                                    controller: controller.lastNameController,
                                    keyboardType: TextInputType.name,
                                    autofocus: false,
                                    enabled: false,
                                    onChanged: (v) {
                                      controller.isEditDetails.value = true;
                                    },
                                    style: const TextStyle(
                                        color: Colors.black54, fontSize: 14),
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.all(0),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 14),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Divider(
                              thickness: 1,
                              color: Colors.grey[400],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                              right: 15,
                            ),
                            child: Row(
                              children: [
                                const Expanded(
                                  flex: 1,
                                  child: Text(
                                    "Email Address",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: TextFormField(
                                    controller: controller.emailController,
                                    autofocus: false,
                                    enabled: false,
                                    onChanged: (v) {
                                      controller.isEditDetails.value = true;
                                    },
                                    style: const TextStyle(
                                        color: Colors.black54, fontSize: 14),
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.all(0),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 14),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Divider(
                              thickness: 1,
                              color: Colors.grey[400],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                              right: 15,
                            ),
                            child: Row(
                              children: [
                                const Expanded(
                                  flex: 1,
                                  child: Text(
                                    "Employee No.",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: TextFormField(
                                    controller: controller.employeeController,
                                    autofocus: false,
                                    enabled: false,
                                    onChanged: (v) {
                                      controller.isEditDetails.value = true;
                                    },
                                    style: const TextStyle(
                                        color: Colors.black54, fontSize: 14),
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.all(0),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 14),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Divider(
                              thickness: 1,
                              color: Colors.grey[400],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                              right: 15,
                            ),
                            child: Row(
                              children: [
                                const Expanded(
                                  flex: 1,
                                  child: Text(
                                    "Cell Phone",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: TextFormField(
                                    controller: controller.cellPhoneController,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(15),
                                    ],
                                    autofocus: false,
                                    onChanged: (v) {
                                      controller.isEditDetails.value = true;
                                    },
                                    keyboardType: TextInputType.number,
                                    style: const TextStyle(
                                        color: Colors.black54, fontSize: 14),
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.all(0),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 14),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 15,
                    ),
                    Container(
                      color: Colors.grey.withOpacity(.1),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                              right: 15,
                            ),
                            child: Row(
                              children: [
                                const Expanded(
                                  flex: 1,
                                  child: Text(
                                    "New password",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: TextFormField(
                                    controller:
                                        controller.newPassWordController,
                                    autofocus: false,
                                    onChanged: (v) {
                                      controller.isChagePassword.value = true;
                                    },
                                    keyboardType: TextInputType.number,
                                    style: const TextStyle(
                                        color: Colors.black54, fontSize: 14),
                                    decoration: const InputDecoration(
                                      hintText: "Enter new password",
                                      contentPadding: EdgeInsets.all(0),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 14),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Divider(
                              thickness: 1,
                              color: Colors.grey[400],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                              right: 15,
                            ),
                            child: Row(
                              children: [
                                const Expanded(
                                  flex: 1,
                                  child: Text(
                                    "Confirm password",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: TextFormField(
                                    controller:
                                        controller.confirmPasswordController,
                                    autofocus: false,
                                    keyboardType: TextInputType.number,
                                    onChanged: (v) {
                                      controller.isChagePassword.value = true;
                                    },
                                    style: const TextStyle(
                                        color: Colors.black54, fontSize: 14),
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.all(0),
                                      hintText: "Confirm new password",
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      hintStyle: TextStyle(
                                          color: Colors.black54, fontSize: 14),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: controller.isEditDetails.value &&
                              controller.isChagePassword.value
                          ? () {
                              Get.showSnackbar(const GetSnackBar(
                                snackPosition: SnackPosition.BOTTOM,
                                message:
                                    "You are not able to change password and edit profile details at a time.",
                                duration: Duration(seconds: 2),
                                margin: EdgeInsets.only(
                                    bottom: 20, left: 10, right: 10),
                              ));
                            }
                          : controller.isEditDetails.value
                              ? () {
                                  if (controller.cellPhoneController.text
                                              .toString()
                                              .substring(0, 6) ==
                                          "512974" ||
                                      controller.cellPhoneController.text
                                              .toString()
                                              .substring(0, 6) ==
                                          "512802" ||
                                      controller.cellPhoneController.text
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
                                  } else {
                                    controller.editDetailsTap();
                                  }
                                }
                              : controller.isChagePassword.value
                                  ? () {
                                      controller.changePasswordTap();
                                    }
                                  : () {},
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: AppColors.appPrimaryColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: const Center(
                              child: Text(
                            "Submit",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          )),
                        ),
                      ),
                    ),
                    Container(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5, bottom: 5),
                        child: Text(
                            "Version: ${controller.getUserDetailsData.value.appVersion!}"),
                      ),
                    ),
                  ],
                ),
              ),
      );
    });
  }

  Future<dynamic> selectContact() {
    return Get.bottomSheet(
      Container(
        decoration: const BoxDecoration(
          color: Colors.black87,
        ),
        margin: const EdgeInsets.only(bottom: 40, left: 40, right: 40),
        //height: ScreenConstant.screenHeightHalf,
        child: ListView.builder(
            itemCount: controller.rankList.length,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (BuildContext context, index) {
              return GestureDetector(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              controller.rankList[index].title ?? "",
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: FontSize.s18,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: ScreenConstant.sizeSmall,
                              ),
                            ),
                            controller.rankList[index].isSelected
                                ? const Icon(
                                    Icons.radio_button_checked,
                                    color: Colors.blue,
                                  )
                                : const Icon(
                                    Icons.circle_outlined,
                                    color: Colors.white,
                                  ),
                          ]),
                    ),
                    index == controller.rankList.length - 1
                        ? const Offstage()
                        : const Divider(
                            color: Colors.white,
                            thickness: 1,
                          ),
                  ],
                ),
                onTap: () {
                  controller.isEditDetails.value = true;
                  for (int i = 0; i < controller.rankList.length; i++) {
                    if (controller.rankList[i].isSelected) {
                      controller.rankList[i].isSelected = false;
                    }
                  }
                  controller.rankList[index].isSelected = true;
                  controller.rankName.value = controller.rankList[index].title!;
                  controller.rankId.value =
                      controller.rankList[index].id!.toString();
                  Get.back();
                },
              );
            }),
      ),
    );
  }
}
