import 'package:flutter/material.dart';
import 'package:flutteractivity/app/export/export.dart';

enum FormWidgetType { defaultStyle, textArea }

class FormWidget extends StatelessWidget {
  const FormWidget({
    Key? key,
    required this.ctrl,
    this.type = FormWidgetType.defaultStyle,
    this.labelText = 'Label',
    this.hintText = 'Hint',
    this.prefixIcon = Icons.layers,
    this.showPrefixIcon = true,
    this.onFieldSubmitted,
    this.textInputType = TextInputType.text,
  }) : super(key: key);

  final TextEditingController ctrl;
  final FormWidgetType type;
  final String labelText;
  final String hintText;
  final IconData prefixIcon;
  final bool showPrefixIcon;
  final void Function(String)? onFieldSubmitted;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case FormWidgetType.textArea:
        return _FormTextArea(ctrl: ctrl, onFieldSubmitted: onFieldSubmitted);

      default:
        return _FormDefault(
          ctrl: ctrl,
          hintText: hintText,
          labelText: labelText,
          prefixIcon: prefixIcon,
          showPrefixIcon: showPrefixIcon,
          onFieldSubmitted: onFieldSubmitted,
          textInputType: textInputType,
        );
    }
  }
}

class _FormDefault extends StatelessWidget {
  const _FormDefault({
    Key? key,
    required this.textInputType,
    this.prefixIcon,
    required this.showPrefixIcon,
    required this.labelText,
    required this.hintText,
    required this.onFieldSubmitted,
    required this.ctrl,
  }) : super(key: key);

  final TextEditingController ctrl;
  final TextInputType textInputType;
  final IconData? prefixIcon;
  final bool showPrefixIcon;
  final String labelText;
  final String hintText;
  final void Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final textSize = context.isPhone ? 12.sp : 27.0;
    final textColor = theme.primary;
    final iconSize = context.isPhone ? 25.0 : 35.0;
    final contentPadding = context.isPhone ? 5.0 : 15.0;

    return Card(
      color: Colors.white,
      margin: const EdgeInsets.all(8.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.0),
          bottomLeft: Radius.circular(50.0),
        ),
      ),
      child: TextFormField(
        controller: ctrl,
        onFieldSubmitted: onFieldSubmitted,
        keyboardType: textInputType,
        style: TextStyle(fontSize: textSize, color: textColor),
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          contentPadding: EdgeInsets.all(contentPadding),
          counterStyle: const TextStyle(),
          labelStyle: TextStyle(fontSize: textSize, color: textColor),
          hintStyle: TextStyle(fontSize: textSize, color: textColor),
          prefixIcon: showPrefixIcon
              ? Icon(
                  prefixIcon,
                  size: iconSize,
                  color: theme.primary,
                )
              : null,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class _FormTextArea extends StatelessWidget {
  const _FormTextArea({
    Key? key,
    required this.ctrl,
    this.onFieldSubmitted,
  }) : super(key: key);

  final TextEditingController ctrl;
  final void Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    final textSize = context.isPhone ? 12.sp : 27.0;
    final textColor = Colors.black;
    final counterSize = context.isPhone ? 10.sp : 24.0;
    final counterColor = Colors.black.withAlpha(127);

    return Container(
      margin: const EdgeInsets.all(8.0),
      child: TextFormField(
        textAlign: TextAlign.start,
        maxLines: 8,
        maxLength: 1000,
        controller: ctrl,
        keyboardType: TextInputType.text,
        style: TextStyle(fontSize: textSize, color: textColor),
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          hintText: "Descripcion de la imagen",
          labelText: " ",
          counterStyle: TextStyle(color: counterColor, fontSize: counterSize),
          labelStyle: TextStyle(
            fontSize: textSize,
            fontWeight: FontWeight.bold,
          ),
          filled: true,
          fillColor: Colors.white,
          hintStyle: TextStyle(fontSize: textSize),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
