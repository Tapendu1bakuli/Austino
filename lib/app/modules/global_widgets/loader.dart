import 'package:flutter/material.dart';

import '../../../common/CustomColor.dart';

class Loader extends StatelessWidget {
  final String text;
  final bool isTransparent;


  const Loader({Key? key, this.text = "Loading",this.isTransparent=true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: isTransparent ? Colors.black.withOpacity(0.3) : CustomColor.myCustomBlack,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
              height: 30,
              width: 30,
              child: SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(
                  backgroundColor: CustomColor.customButtonYellow,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0xFF707070),
                  ),
                ),
              )),
          const SizedBox(
            height: 25,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

