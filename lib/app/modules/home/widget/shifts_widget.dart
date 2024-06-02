import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../common/device_manager/colors.dart';
import '../../../../model/CompleteShiftsListResponseModel.dart';

class ShiftWidgets extends StatefulWidget {
  List<OvertimeSchedules>? completedList;
  int? index;
  ShiftWidgets({this.completedList, this.index});

  @override
  State<ShiftWidgets> createState() => _ShiftWidgetsState();
}

class _ShiftWidgetsState extends State<ShiftWidgets> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              widget.completedList![widget.index!].isOpen =
                  !widget.completedList![widget.index!].isOpen!;
            });
          },
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.appPrimaryColor.withOpacity(.2)),
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Icon(
                      Icons.calendar_month,
                      size: 20,
                      color: AppColors.appPrimaryColor,
                    ),
                  ),
                ),
                title: Text(
                    widget.completedList![widget.index!].vendorDetails!
                        .companyName!,
                    style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.appPrimaryColor,
                        fontWeight: FontWeight.bold)),
                subtitle: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Icon(
                      Icons.calendar_month_outlined,
                      color: Colors.grey[200],
                      size: 15,
                    ),
                    Container(
                      width: 5,
                    ),
                    Text(
                      widget.completedList![widget.index!].postedDate!,
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                trailing: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.appPrimaryColor.withOpacity(.2)),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Icon(
                      widget.completedList![widget.index!].isOpen!
                          ? Icons.arrow_drop_up
                          : Icons.arrow_drop_down,
                      size: 20,
                      color: AppColors.appPrimaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        widget.completedList![widget.index!].isOpen!
            ? Padding(
                padding: const EdgeInsets.only(
                    left: 5.0, right: 5, top: 10, bottom: 10),
                child: Container(
                  // height: 150,
                  //width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.appPrimaryColor.withOpacity(1),
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.completedList![widget.index!].vendorDetails!
                              .companyName!,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Icon(
                                  Icons.calendar_month_outlined,
                                  color: Colors.grey[200],
                                  size: 15,
                                ),
                                Container(
                                  width: 5,
                                ),
                                Text(
                                  widget.completedList![widget.index!]
                                      .postedDate!,
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.grey[500],
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12),
                                child: Text(
                                  "${parseTime(dateTime: widget.completedList![widget.index!].startTime, returnFormat: "h:mm a")} - ${parseTime(dateTime: widget.completedList![widget.index!].endTime, returnFormat: "h:mm a")}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          height: 12,
                        ),
                        Container(
                          width: double.infinity,
                          //height: 60,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  "Officer(s) :",
                                  style: TextStyle(
                                      color: AppColors.appPrimaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  height: 5,
                                ),
                                ListView.builder(
                                    shrinkWrap: true,
                                    physics: const ClampingScrollPhysics(),
                                    itemCount: widget
                                        .completedList![widget.index!]
                                        .signUps!
                                        .length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 4.0),
                                        child: Text(
                                          widget.completedList![widget.index!]
                                              .signUps![index].user!.name!,
                                          style: const TextStyle(
                                            color: AppColors.appPrimaryColor,
                                            fontSize: 14,
                                          ),
                                        ),
                                      );
                                    }),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            : const Offstage(),
      ],
    );
  }
}

String parseTime({String? dateTime, String? returnFormat}) {
  DateFormat dtFor = DateFormat("HH:mm:ss");
  DateTime dt = dtFor.parse(dateTime!);
  DateFormat dateFormat = DateFormat(returnFormat);
  String returnDT = dateFormat.format(dt);
  return returnDT;
}
