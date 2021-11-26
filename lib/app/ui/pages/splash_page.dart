import 'package:flutter/material.dart';
import 'package:flutteractivity/app/export/export.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);
  final SplashController ctrl = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: context.width,
        height: context.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ZoomIn(
              child: Image.asset(
                'assets/img/flutter_logo.png',
                width: context.width * .2,
                height: context.width * .2,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 30.0),
            FadeIn(
              delay: const Duration(milliseconds: 50),
              child: const CircularProgressIndicator(),
            )
          ],
        ),
      ),
    );
  }
}
