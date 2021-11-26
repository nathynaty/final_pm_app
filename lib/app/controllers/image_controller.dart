import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutteractivity/app/export/export.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:connectivity/connectivity.dart';

class ImageController extends GetxController {
  late File image;
  late TextEditingController formNameCtrl;
  late TextEditingController formDescripcionCtrl;

  var coords;

  @override
  void onInit() {
    image = Get.arguments as File;
    formNameCtrl = TextEditingController();
    formDescripcionCtrl = TextEditingController();
    
    Geolocator
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.best, forceAndroidLocationManager: true)
      .then((Position position) {
        coords = position;
      }).catchError((e) {
        print(e);
      });

    super.onInit();
  }


  /// enviar al backend
  Future<void> saveToBackend({
    required String name,
    required String descripcion,
  }) async {
    //TODO Enviar el nombre y la descripcion al backend y la image

print(image);
    var connectivityResult = await (Connectivity().checkConnectivity());
    var typeNetwork;
    if (connectivityResult == ConnectivityResult.mobile) {
      typeNetwork = "Datos moviles";
    } else if (connectivityResult == ConnectivityResult.wifi) {
      typeNetwork = "Wifi";
    }

    String url = 'https://finalpm-back.herokuapp.com/filepics';

    var body = json.encode({
      "filepic": {
        "name": name,
        "picture": image,
        "geolocation": coords.latitude.toString() +", "+ coords.longitude.toString(),
        "devicetype": typeNetwork,
        "description": descripcion
      }
    });

    http.post(Uri.parse(url),
            body: body,
            headers: { 'Content-type': 'application/json',
              'Accept': 'application/json'}
            );
  

    // una vez que se ah enviado los datos al backend
    // se ejecuta el codigo de abajo
    Get.toNamed(MyRoutes.HOME);
    formNameCtrl.clear();
    formDescripcionCtrl.clear();
  }
}
