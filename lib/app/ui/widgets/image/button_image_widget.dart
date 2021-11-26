import 'package:flutter/material.dart';
import 'package:flutteractivity/app/export/export.dart';

class ButtonImageWidget extends StatelessWidget {
  const ButtonImageWidget({
    Key? key,
    this.onPressed,
    required this.title,
  }) : super(key: key);

  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          onPrimary: Colors.black,
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
        onPressed: onPressed,
        icon: Icon(
          Icons.save,
          color: context.theme.colorScheme.primary,
        ),
        label: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: context.isPhone ? 12.sp : 27.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
