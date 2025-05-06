
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/storage_service.dart';

class HistorialPage extends StatelessWidget {
  final StorageService storage = StorageService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Historial de Contratos')),
      body: StreamBuilder<QuerySnapshot>(
        stream: storage.obtenerContratos(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

          final docs = snapshot.data!.docs;
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final data = docs[index].data() as Map<String, dynamic>;
              return ListTile(
                title: Text(data['texto'].toString().substring(0, 50) + "..."),
                subtitle: Text(data['resultadoIA'] != ''
                    ? 'Evaluado con IA'
                    : 'Sin evaluación IA'),
              );
            },
          );
        },
      ),
    );
  }
}
