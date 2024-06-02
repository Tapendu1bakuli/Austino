import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../../../common/device_manager/colors.dart';
import '../../../../../common/device_manager/screen_constants.dart';
import '../../../../../common/device_manager/text_styles.dart';
import '../../../../../common/localStorage.dart';
import '../../../../routes/app_routes.dart';
import '../../controller/home_controller.dart';

class ContactUsTabView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetX<HomeController>(initState: (state) {
      Future.delayed(const Duration(milliseconds: 100), () {
        Get.find<HomeController>().getAdminContactsList();
      });
    }, builder: (_) {
      return controller.adminContactsList.isEmpty
          ? Container()
          : ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              children: [
                Container(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text(
                    "Contact us",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                contactUsCard(context),
                messageCard(),
                cancelAndSendBottons()
              ],
            );
    });
  }

  Padding cancelAndSendBottons() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
              controller.contactUsMessController.text = "";
              controller.selectContactTitle.value = "Select Contacts";
              for (int i = 0; i < controller.adminContactsList.length; i++) {
                if (controller.adminContactsList[i].isSelect!) {
                  controller.adminContactsList[i].isSelect = false;
                }
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(40),
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    const BoxShadow(
                      color: AppColors.appPrimaryColor,
                      blurRadius: 0,
                      offset: Offset(0, 2),
                    ),
                  ]),
              child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  )),
            ),
          ),
          GestureDetector(
            onTap: () async {
              var localStorage = new LocalStorage();
              controller.userId.value = await localStorage.getValue("id");
              FocusManager.instance.primaryFocus?.unfocus();
              controller.contactUsSubmit();
            },
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.appPrimaryColor,
                  borderRadius: BorderRadius.circular(40),
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    const BoxShadow(
                      color: AppColors.appPrimaryColor,
                      blurRadius: 10,
                      offset: Offset(0, 0),
                    ),
                  ]),
              child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 55, vertical: 15),
                  child: Text(
                    "Send Now",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Padding messageCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller.contactUsMessController,
        maxLines: 8,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          filled: true,
          contentPadding: const EdgeInsets.all(10),
          //hintStyle: TextStyles.popUpSubTitleColor,
          hintText: "Message",
          fillColor: Colors.white,
        ),
      ),
    );
  }

  Padding contactUsCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          selectContact();
        },
        child: Card(
          elevation: 4,
          surfaceTintColor: AppColors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.appPrimaryColor.withOpacity(0.2)),
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Image(image: AssetImage("assets/icon/contact.png")),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 20,
                ),
                Obx(() => Text(
                      controller.selectContactTitle.value == ""
                          ? "Select Contacts"
                          : controller.selectContactTitle.value,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    )),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 40,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.appPrimaryColor.withOpacity(0.2)),
                  child: const Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Icon(
                      Icons.arrow_drop_down,
                      size: 15,
                      color: AppColors.appPrimaryColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
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
            itemCount: controller.adminContactsList.length,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (BuildContext context, index) {
              return GestureDetector(
                child: Column(
                  children: [
                    Container(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              controller.adminContactsList[index].name ?? "",
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
                            controller.adminContactsList[index].isSelect!
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
                    index == controller.adminContactsList.length - 1
                        ? const Offstage()
                        : const Divider(
                            color: Colors.white,
                            thickness: 1,
                          ),
                  ],
                ),
                onTap: () {
                  for (int i = 0;
                      i < controller.adminContactsList.length;
                      i++) {
                    if (controller.adminContactsList[i].isSelect!) {
                      controller.adminContactsList[i].isSelect = false;
                    }
                  }
                  controller.adminContactsList[index].isSelect = true;
                  controller.selectContactTitle.value =
                      controller.adminContactsList[index].name!;
                  controller.selectContactId.value =
                      controller.adminContactsList[index].id!.toString();
                  // controller.myRanks[index].isSelected=false;
                  // controller.SelectedRankId.value =
                  //     controller.ranks?.ranks[index].id ?? 0;
                  // controller.SelectedRank.value =
                  //     controller.ranks?.ranks[index].title ??
                  //         "------- Select Rank -------";
                  Get.back();
                },
              );
            }),
      ),
    );
  }
}
