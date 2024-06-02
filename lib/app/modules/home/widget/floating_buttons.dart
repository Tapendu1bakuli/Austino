import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';

class BookingsListWidget extends GetView<HomeController> {
  BookingsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
        return ListView.builder(
          padding: EdgeInsets.only(bottom: 10, top: 10),
          primary: false,
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: ((_, index) {
            if (index == 10) {
              return Obx(() {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child:  Opacity(
                      opacity: controller.isLoading.value ? 1 : 0,
                      child:  CircularProgressIndicator(),
                    ),
                  ),
                );
              });
            }
            else {
              return Container();
            }
          }),
        );

    });
  }
}
