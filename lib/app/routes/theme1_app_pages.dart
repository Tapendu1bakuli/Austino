import 'package:apamobile/app/modules/home/views/home_view.dart';
import 'package:apamobile/app/modules/home/views/public_safety_view.dart';
import 'package:get/get.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/forgot_password.dart';
import '../modules/auth/views/login_view.dart';
import '../modules/auth/views/register_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/bill_of_rights_view.dart';
import '../modules/home/views/constitutional_rights_view.dart';
import '../modules/home/views/critical_incident_tips_view.dart';
import '../modules/home/views/dispersal_order_view.dart';
import '../modules/home/views/r2r_statement_view.dart';
import 'app_routes.dart';

class Theme1AppPages {
  static const INITIAL = Routes.LOGIN;
  static final routes = [
    GetPage(
        name: Routes.LOGIN, page: () => LoginView(), binding: AuthBinding()),
    GetPage(
        name: Routes.FORGOT_PASSWORD,
        page: () => ForgotPasswordView(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.REGISTER,
        page: () => RegisterView(),
        binding: AuthBinding()),
    GetPage(name: Routes.HOME, page: () => HomeView(), binding: HomeBinding()),
    GetPage(
        name: Routes.R2RStatement,
        page: () => R2rStatementView(),
        binding: HomeBinding()),
    GetPage(
        name: Routes.R2RStatement,
        page: () => R2rStatementView(),
        binding: HomeBinding()),
    GetPage(
        name: Routes.CriticalIncidentTips,
        page: () => CITipsView(),
        binding: HomeBinding()),
    GetPage(
        name: Routes.PublicSafetyQuestions,
        page: () => PublicSafetyView(),
        binding: HomeBinding()),
    GetPage(
        name: Routes.DispersalOrderView,
        page: () => DispersalOrderView(),
        binding: HomeBinding()),
    GetPage(
        name: Routes.CRightsView,
        page: () => CRightsView(),
        binding: HomeBinding()),
    GetPage(
        name: Routes.BillofRightsView,
        page: () => BillofRightsView(),
        binding: HomeBinding()),
  ];
}
