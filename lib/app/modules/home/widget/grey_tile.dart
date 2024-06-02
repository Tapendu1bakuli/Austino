import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/CustomColor.dart';
import '../controller/home_controller.dart';

class GreyTileWidget extends GetView<HomeController> {
  String tileOne,tileTwo;
  GreyTileWidget({Key? key,required this.tileOne,required this.tileTwo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(padding: const EdgeInsets.only(top: 5,bottom: 5),child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: MediaQuery.of(context).size.width/2.5,
          height: 50.0,
          decoration:  BoxDecoration(
            color: CustomColor.customGrey,
            //border:  Border.all(color: Colors.white, width: 2.0),
            borderRadius:  BorderRadius.circular(5.0),
          ),
          child:   Center(child:  Text(tileOne, style:  TextStyle(fontSize: 18.0, color: Colors.black),),),
        ),
        Container(
          width: MediaQuery.of(context).size.width/2.5,
          height: 50.0,
          decoration:  BoxDecoration(
            color: CustomColor.customGrey,
            //border:  Border.all(color: Colors.white, width: 2.0),
            borderRadius:  BorderRadius.circular(5.0),
          ),
          child:   Center(child:  Text(tileTwo, style:  TextStyle(fontSize: 18.0, color: Colors.black),),),
        ),
      ],),);

  }
  }