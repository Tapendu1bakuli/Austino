import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/CustomColor.dart';
import '../../../../../common/device_manager/screen_constants.dart';
import '../../../../../common/device_manager/strings.dart';
import '../../controller/home_controller.dart';

class FallenOfficersTabView extends GetView<HomeController> {
  const FallenOfficersTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView(
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: CustomColor.lightWhite,
                    borderRadius: BorderRadius.circular(10.0),

                    // make rounded corner of border
                  ),
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Cornelius L. Fahey",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            "03-08-1875",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: CustomColor.lightWhite,
                    borderRadius: BorderRadius.circular(10.0),

                    // make rounded corner of border
                  ),
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "John Gaines",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            "11-19-1913",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: CustomColor.lightWhite,
                    borderRadius: BorderRadius.circular(10.0),

                    // make rounded corner of border
                  ),
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "Tom Allen",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            "10-24-1915",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: CustomColor.lightWhite,
                    borderRadius: BorderRadius.circular(10.0),

                    // make rounded corner of border
                  ),
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "James N Littlepage",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            "10-09-1928",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: CustomColor.lightWhite,
                    borderRadius: BorderRadius.circular(10.0),

                    // make rounded corner of border
                  ),
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "William M. Stuart",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            "10-16-1933",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: CustomColor.lightWhite,
                    borderRadius: BorderRadius.circular(10.0),

                    // make rounded corner of border
                  ),
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "James R. Cummings",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            "12-03-1933",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: CustomColor.lightWhite,
                    borderRadius: BorderRadius.circular(10.0),

                    // make rounded corner of border
                  ),
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "Elkins P. Morrison",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            "02-02-1936",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: CustomColor.lightWhite,
                    borderRadius: BorderRadius.circular(10.0),

                    // make rounded corner of border
                  ),
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "Walter L. Tucker",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            "10-14-1948",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: CustomColor.lightWhite,
                    borderRadius: BorderRadius.circular(10.0),

                    // make rounded corner of border
                  ),
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "Donald E. Carpenter",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            "01-30-1964",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: CustomColor.lightWhite,
                    borderRadius: BorderRadius.circular(10.0),

                    // make rounded corner of border
                  ),
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "Billy P. Speed",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            "08-01-1966",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: CustomColor.lightWhite,
                    borderRadius: BorderRadius.circular(10.0),

                    // make rounded corner of border
                  ),
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "Thomas W. Birtrong",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            "08-23-1974",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: CustomColor.lightWhite,
                    borderRadius: BorderRadius.circular(10.0),

                    // make rounded corner of border
                  ),
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "Leland D. Anderson",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            "06-06-1975",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: CustomColor.lightWhite,
                    borderRadius: BorderRadius.circular(10.0),

                    // make rounded corner of border
                  ),
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "Ralph A. Ablanedo",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            "05-18-1978",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: CustomColor.lightWhite,
                    borderRadius: BorderRadius.circular(10.0),

                    // make rounded corner of border
                  ),
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "Lee Craig Smith",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            "12-15-1979",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: CustomColor.lightWhite,
                    borderRadius: BorderRadius.circular(10.0),

                    // make rounded corner of border
                  ),
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "Robert T. Martinez Jr.",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            "02-25-1989",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: CustomColor.lightWhite,
                    borderRadius: BorderRadius.circular(10.0),

                    // make rounded corner of border
                  ),
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "Drew A. Bolin",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            "06-02-1995",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: CustomColor.lightWhite,
                    borderRadius: BorderRadius.circular(10.0),

                    // make rounded corner of border
                  ),
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "William D. Jones Sr.",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            "05-28-2000",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: CustomColor.lightWhite,
                    borderRadius: BorderRadius.circular(10.0),

                    // make rounded corner of border
                  ),
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "Clinton W. Hunter",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            "11-29-2001",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: CustomColor.lightWhite,
                    borderRadius: BorderRadius.circular(10.0),

                    // make rounded corner of border
                  ),
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "Earl A. Hall",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            "03-04-2002",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: CustomColor.lightWhite,
                    borderRadius: BorderRadius.circular(10.0),

                    // make rounded corner of border
                  ),
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "Amy L. Donovan",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            "10-31-2004",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: CustomColor.lightWhite,
                    borderRadius: BorderRadius.circular(10.0),

                    // make rounded corner of border
                  ),
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "Jaime D. Padron",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            "04-06-2012",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: CustomColor.lightWhite,
                    borderRadius: BorderRadius.circular(10.0),

                    // make rounded corner of border
                  ),
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "Clay D. Crabb",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            "10-16-2013",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: CustomColor.lightWhite,
                    borderRadius: BorderRadius.circular(10.0),

                    // make rounded corner of border
                  ),
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "Amir Abdul-Khaliq",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            "09-04-2016",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: CustomColor.lightWhite,
                    borderRadius: BorderRadius.circular(10.0),

                    // make rounded corner of border
                  ),
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "Lewis A. Traylor",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            "07-31-2021",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: CustomColor.lightWhite,
                    borderRadius: BorderRadius.circular(10.0),

                    // make rounded corner of border
                  ),
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "Randolph Boyd Jr.",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            "08-25-2021",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: CustomColor.lightWhite,
                    borderRadius: BorderRadius.circular(10.0),

                    // make rounded corner of border
                  ),
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "Steve Urias",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            "08-26-2021",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: CustomColor.lightWhite,
                    borderRadius: BorderRadius.circular(10.0),

                    // make rounded corner of border
                  ),
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "Eric S. Lindsey",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            "12-05-2021",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: CustomColor.lightWhite,
                    borderRadius: BorderRadius.circular(10.0),

                    // make rounded corner of border
                  ),
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "Anthony Martin",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            "09-23-2022",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),

          // datetime.png
          const SizedBox(
            height: 120,
          )
        ],
      ),
    );
  }
}
