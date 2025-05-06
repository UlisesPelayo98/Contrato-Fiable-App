
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  String textoDetectado = '';

  Future<void> escanearDesdeCamara() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      final inputImage = InputImage.fromFilePath(image.path);
      final textDetector = GoogleMlKit.vision.textRecognizer();
      final RecognizedText recognizedText = await textDetector.processImage(inputImage);
      String texto = recognizedText.text;

      setState(() {
        textoDetectado = texto;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Escanear Contrato')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: escanearDesdeCamara,
              child: Text('Abrir Cámara'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Text(textoDetectado),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
