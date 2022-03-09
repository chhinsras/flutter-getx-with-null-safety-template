import 'package:get/get.dart';
import 'package:sunac_flutter/pages/unknown/unknown_view.dart';

import '../pages/home/bindings/home_binding.dart';
import '../pages/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];

  static final unknownRoute = GetPage(
    name: Routes.notFound,
    page: () => const UnknownPage(),
  );
}
