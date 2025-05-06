
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class TranslatePage extends StatefulWidget {
  @override
  _TranslatePageState createState() => _TranslatePageState();
}

class _TranslatePageState extends State<TranslatePage> {
  final TextEditingController _controller = TextEditingController();
  String traduccion = '';

  Future<void> traducirTexto(String texto) async {
    final translator = GoogleTranslator();
    var result = await translator.translate(texto, to: 'en');

    setState(() {
      traduccion = result.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Traducir Contrato')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Texto en español',
              ),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => traducirTexto(_controller.text),
              child: Text('Traducir al Inglés'),
            ),
            SizedBox(height: 20),
            Expanded(child: SingleChildScrollView(child: Text(traduccion))),
          ],
        ),
      ),
    );
  }
}
