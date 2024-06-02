import 'package:apamobile/common/device_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../controller/home_controller.dart';
import 'curtesy_apartment_details.dart';

class CourtesyApartmentsTabView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(() => controller.courtesyApartmentListData.isEmpty
        ? Container()
        : SingleChildScrollView(
            child: ListView.builder(
                itemCount: controller.courtesyApartmentListData.length,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: () {
                        Get.to(()=> CourtesyApartmentDetailsScreen(
                          address: controller.courtesyApartmentListData[index]
                              .apartmentLocation,
                          image: controller
                              .courtesyApartmentListData[index].apartmentImage,
                          title:
                          controller.courtesyApartmentListData[index].title,
                          phNo: controller
                              .courtesyApartmentListData[index].apartmentPhone,
                          lat: controller.courtesyApartmentListData[index]
                              .apartmentLatitude,
                          lng: controller.courtesyApartmentListData[index]
                              .apartmentLongitude,
                        ));
                      },
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Card(
                              elevation: 4,
                              surfaceTintColor: AppColors.white,
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.grey.withOpacity(.1),
                                  backgroundImage:
                                      AssetImage('assets/icon/apartment.png'),
                                ),
                                title: Text(
                                  controller.courtesyApartmentListData
                                      .value[index].title,
                                  style: const TextStyle(
                                      fontSize: 20.0,
                                      color: AppColors.appPrimaryColor,
                                      fontWeight: FontWeight.w600),
                                ),
                                trailing: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey[400]),
                                  child: const Padding(
                                    padding: EdgeInsets.all(7.0),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 15,
                                      color: AppColors.appPrimaryColor,
                                    ),
                                  ),
                                ),
                              ))));
                })));
  }
}
