import 'package:flutteractivity/app/export/export.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    // espera 2 segundos y luego lo envia a homePage
    await 2.delay();
    Get.toNamed(MyRoutes.HOME);
    super.onReady();
  }
}
