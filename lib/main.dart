import 'package:apamobile/Service/global_service.dart';
import 'package:apamobile/Service/one_signal_messaging_service.dart';
import 'package:apamobile/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/routes/theme1_app_pages.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await HiveStore().initBox();
  await Get.putAsync(() => OneSignalMessagingService().init());
  await Get.putAsync(() => GlobalService().init());
  await initServices();
  runApp(const ApaMobile());
}

bool logged_in = false;
initServices() async {
  Get.log('starting services ...');
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getBool('logged_in') == true) {
    logged_in = true;
  } else {
    logged_in = false;
  }
}

class ApaMobile extends StatelessWidget {
  const ApaMobile({key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: logged_in ? Routes.HOME : Theme1AppPages.INITIAL,
      getPages: Theme1AppPages.routes,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
    );
  }
}
