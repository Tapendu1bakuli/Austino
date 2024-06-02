import 'dart:io';

import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../common/helper.dart';
import '../model/global_model.dart';

class GlobalService extends GetxService {
  final global = Global().obs;
  PackageInfo? packageInfo;

  Future<GlobalService> init() async {
    // var response = await Helper.getJsonFile('config/global.json');
    // global.value = Global.fromJson(response);
    packageInfo = await PackageInfo.fromPlatform();
    return this;
  }

  String getPlatformVersion() {
    return packageInfo?.version.replaceAll(".0", "") ?? "";
  }

  String getPlatformCode() {
    return Platform.isAndroid ? "1" : "2";
  }

  String? get baseUrl => global.value.laravelBaseUrl;
}
