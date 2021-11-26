import 'package:flutteractivity/app/export/export.dart';

class ImageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImageController>(() => ImageController());
  }
}
