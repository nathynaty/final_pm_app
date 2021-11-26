// ignore_for_file: avoid_print

import 'package:flutteractivity/app/export/export.dart';
import 'dart:io';

class HomeController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  var image = File('path');

  Future<void> takePhoto() async {
    final img = await _picker.pickImage(source: ImageSource.camera);
    if (img != null) {
      image = File(img.path);
      Get.toNamed(MyRoutes.IMAGE, arguments: image);
    } else {
      print("no hay nada");
    }
  }

  Future<void> pickImage() async {
    final img = await _picker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      image = File(img.path);
      Get.toNamed(MyRoutes.IMAGE, arguments: image);
    } else {
      print("no hay nada");
    }
  }
}
