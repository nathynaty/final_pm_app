import 'package:flutter/material.dart';
import 'package:flutteractivity/app/export/export.dart';
import 'dart:math' as math;

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: context.width,
        height: context.height,
        child: Stack(
          children: [
            Positioned(
              top: context.height * .3,
              left: -context.height * .25,
              child: Transform.rotate(
                angle: math.pi / 5,
                child: Container(
                  width: context.height * .6,
                  height: context.height * .6,
                  decoration: BoxDecoration(
                    color: context.theme.colorScheme.primary,
                    borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                  ),
                ),
              ),
            ),
            Center(child: child),
          ],
        ));
  }
}
