import 'package:get/get.dart';

import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/nurse/bindings/nurse_binding.dart';
import '../modules/nurse/views/nurse_view.dart';
import '../modules/patient/bindings/patient_binding.dart';
import '../modules/patient/views/patient_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.NURSE,
      page: () => const NurseView(),
      binding: NurseBinding(),
    ),
    GetPage(
      name: _Paths.PATIENT,
      page: () => const PatientView(),
      binding: PatientBinding(),
    ),
  ];
}
