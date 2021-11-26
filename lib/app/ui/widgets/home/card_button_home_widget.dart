import 'package:flutter/material.dart';
import 'package:flutteractivity/app/export/export.dart';

/// card que consiste de una imagen y un boton
class CardImageButtonHomeWidget extends StatelessWidget {
  const CardImageButtonHomeWidget({
    Key? key,
    this.imageUrl = 'https://www.svgrepo.com/show/24747/image.svg',
    this.title = 'Tomar foto',
    this.onPressed,
  }) : super(key: key);

  final String imageUrl;
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final textSize = context.isPhone ? 12.sp : 27.0;

    return SizedBox(
      width: context.width * .4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            width: context.width * .2,
            height: context.height * .2,
            child: SvgPicture.network(
              imageUrl,
              placeholderBuilder: (_) => Image.asset(
                'assets/img/flutter_logo.png',
                color: Colors.grey.shade300,
              ),
              fit: BoxFit.cover,
            ),
          ),
          // Image.asset(
          //   image,
          //   width: context.width * .2,
          //   height: context.height * .2,
          //   fit: BoxFit.cover,
          // ),
          const SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            onPressed: onPressed,
            child: Text(
              title,
              style: TextStyle(
                // color: context.theme.colorScheme.onBackground,
                fontSize: textSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
