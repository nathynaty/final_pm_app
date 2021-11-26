import 'package:flutteractivity/app/export/export.dart';
part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: MyRoutes.INITIAL,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: MyRoutes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: MyRoutes.IMAGE,
      page: () => ImagePage(),
      binding: ImageBinding(),
    ),
  ];
}
