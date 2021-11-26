import 'package:flutter/material.dart';
import 'package:flutteractivity/app/export/export.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ejemplo'),
      ),
      body: SafeArea(
        child: Container(
          width: context.width,
          height: context.height,
          padding: const EdgeInsets.all(20.0),
          alignment: AlignmentDirectional.topCenter,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Flutter Activity",
                  textScaleFactor: 2.0,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: context.isPhone ? 12.sp : 27.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: context.height * .25),
                const Cards()
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(height: 50.0,),
      ),
    );
  }
}

class Cards extends StatelessWidget {
  const Cards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController ctrl = Get.find();
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      runAlignment: WrapAlignment.center,
      spacing: 20.0,
      runSpacing: 20.0,
      children: [
        CardImageButtonHomeWidget(
          imageUrl: 'https://www.svgrepo.com/show/71314/camera.svg',
          title: 'Tomar una foto',
          onPressed: ctrl.takePhoto,
        ),
        CardImageButtonHomeWidget(
          imageUrl: 'https://www.svgrepo.com/show/286480/gallery.svg',
          title: 'Elegir imagen',
          onPressed: ctrl.pickImage,
        )
      ],
    );
  }
}
