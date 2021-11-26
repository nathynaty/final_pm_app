import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutteractivity/app/export/export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    systemNavigationBarColor: Colors.grey.shade900,
  ));
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Sizer(builder: (_, __, ___) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Activity',
        initialRoute: MyRoutes.INITIAL,
        theme: ThemeData.light(),
        defaultTransition: Transition.fade,
        initialBinding: SplashBinding(),
        getPages: AppPages.pages,
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (_) => SplashPage(),
          );
        },
      );
    });
  }
}
