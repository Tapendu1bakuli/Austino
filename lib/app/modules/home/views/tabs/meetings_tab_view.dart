import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/CustomColor.dart';
import '../../../../../common/device_manager/screen_constants.dart';
import '../../../../../common/device_manager/strings.dart';
import '../../controller/home_controller.dart';

class MeetingTabView extends GetView<HomeController> {
  const MeetingTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView(
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        children: [
          Container(height: 10,),
          Center(
            child: Padding(
                padding: ScreenConstant.spacingAllMedium,
                child: const Text(
                  AppLabels.meetingsHeaderOne,
                  style: TextStyle(
                      fontSize: 20,
                      color: CustomColor.darkBlue,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2.5,
                height: 50.0,
                decoration: BoxDecoration(
                  color: CustomColor.customGrey,
                  //border:  Border.all(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: const Center(
                  child: Text(
                    'Feb 01',
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2.5,
                height: 50.0,
                decoration: BoxDecoration(
                  color: CustomColor.customGrey,
                  //border:  Border.all(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: const Center(
                  child: Text(
                    'Apr 04',
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
          Container(
              padding: const EdgeInsets.only(top: 10, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: CustomColor.customGrey,
                      //border:  Border.all(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Center(
                      child: Text(
                        'Jun 06',
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: CustomColor.customGrey,
                      //border:  Border.all(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Center(
                      child: Text(
                        'Aug 01',
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              )),
          Container(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: CustomColor.customGrey,
                      //border:  Border.all(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Center(
                      child: Text(
                        'Oct 03',
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: CustomColor.customGrey,
                      //border:  Border.all(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Center(
                      child: Text(
                        'Dec 05',
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              )),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            color: Colors.black,
            thickness: 1,
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Padding(
                padding: ScreenConstant.spacingAllMedium,
                child: const Text(
                  AppLabels.meetingsHeaderTwo,
                  style: TextStyle(
                      fontSize: 20,
                      color: CustomColor.darkBlue,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                )),
          ),
          Container(
              padding: const EdgeInsets.only(top: 10, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: CustomColor.customGrey,
                      //border:  Border.all(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Center(
                      child: Text(
                        'Jan 16',
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: CustomColor.customGrey,
                      //border:  Border.all(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Center(
                      child: Text(
                        'Feb 20',
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              )),
          Container(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: CustomColor.customGrey,
                      //border:  Border.all(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Center(
                      child: Text(
                        'Mar 19',
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: CustomColor.customGrey,
                      //border:  Border.all(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Center(
                      child: Text(
                        'Apr 16',
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              )),
          Container(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: CustomColor.customGrey,
                      //border:  Border.all(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Center(
                      child: Text(
                        'May 21',
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: CustomColor.customGrey,
                      //border:  Border.all(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Center(
                      child: Text(
                        'Jun 18',
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              )),
          Container(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: CustomColor.customGrey,
                      //border:  Border.all(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Center(
                      child: Text(
                        'Jul 16',
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: CustomColor.customGrey,
                      //border:  Border.all(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Center(
                      child: Text(
                        'Aug 20',
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              )),
          Container(
              padding: const EdgeInsets.only(top: 5, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: CustomColor.customGrey,
                      //border:  Border.all(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Center(
                      child: Text(
                        'Sep 17',
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: CustomColor.customGrey,
                      //border:  Border.all(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Center(
                      child: Text(
                        'Oct 15',
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              )),
          Container(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: CustomColor.customGrey,
                    //border:  Border.all(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: const Center(
                    child: Text(
                      'Nov 19',
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: CustomColor.customGrey,
                    //border:  Border.all(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: const Center(
                    child: Text(
                      'Dec 17',
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
                padding: ScreenConstant.spacingAllMedium,
                child: const Text(
                  AppLabels.meetingsfooter,
                  textAlign: TextAlign.center,
                )),
          ),
          const SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}
