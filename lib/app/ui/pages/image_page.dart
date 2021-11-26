import 'package:flutter/material.dart';
import 'package:flutteractivity/app/export/export.dart';

class ImagePage extends StatelessWidget {
  ImagePage({Key? key}) : super(key: key);

  final ImageController ctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BackgroundWidget(
          child: Container(
            width: context.width,
            height: context.height,
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // imagen
                  FadeInDown(
                    delay: const Duration(milliseconds: 0),
                    child: Container(
                      width: context.width,
                      height: context.height * .5,
                      alignment: AlignmentDirectional.center,
                      child: Image.file(ctrl.image),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  // Formulario para el nombre de la imagen
                  FadeInDown(
                    delay: const Duration(milliseconds: 50),
                    child: FormWidget(
                      ctrl: ctrl.formNameCtrl,
                      labelText: 'Nombre de la imagen',
                      hintText: '',
                      prefixIcon: Icons.image_outlined,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  // texto descripcion
                  FadeInDown(
                    delay: const Duration(milliseconds: 100),
                    child: Text(
                      'Descripcion',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: context.theme.colorScheme.onPrimary,
                        fontSize: context.isPhone ? 14.sp : 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // formulario para la descripcion
                  FadeInDown(
                    delay: const Duration(milliseconds: 150),
                    child: FormWidget(
                      ctrl: ctrl.formDescripcionCtrl,
                      type: FormWidgetType.textArea,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  // boton guardar y enviar
                  FadeInDown(
                    delay: const Duration(milliseconds: 200),
                    child: ButtonImageWidget(
                      title: 'Guarda y enviar',
                      onPressed: () => ctrl.saveToBackend(
                        name: ctrl.formNameCtrl.text.trim(),
                        descripcion: ctrl.formDescripcionCtrl.text.trim(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
