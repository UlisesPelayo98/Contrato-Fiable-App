
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class IaPage extends StatefulWidget {
  @override
  _IaPageState createState() => _IaPageState();
}

class _IaPageState extends State<IaPage> {
  final TextEditingController _controller = TextEditingController();
  String resultado = '';
  final apiKey = 'TU_API_KEY'; // Sustituye con tu clave de OpenAI

  Future<void> analizarConIA(String texto) async {
    final response = await http.post(
      Uri.parse("https://api.openai.com/v1/chat/completions"),
      headers: {
        "Authorization": "Bearer $apiKey",
        "Content-Type": "application/json"
      },
      body: jsonEncode({
        "model": "gpt-3.5-turbo",
        "messages": [
          {"role": "system", "content": "Eres un abogado experto en contratos."},
          {"role": "user", "content": "Analiza este contrato: $texto"}
        ]
      }),
    );

    final data = json.decode(response.body);
    setState(() {
      resultado = data["choices"][0]["message"]["content"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Análisis con IA')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              maxLines: 6,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Pega el contrato aquí',
              ),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => analizarConIA(_controller.text),
              child: Text('Analizar con IA'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Text(resultado),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
