
import 'package:cloud_firestore/cloud_firestore.dart';

class StorageService {
  final CollectionReference contratos =
      FirebaseFirestore.instance.collection('contratos');

  Future<void> guardarContrato(String texto, {String? resultadoIA}) async {
    await contratos.add({
      'texto': texto,
      'resultadoIA': resultadoIA ?? '',
      'fecha': Timestamp.now(),
    });
  }

  Stream<QuerySnapshot> obtenerContratos() {
    return contratos.orderBy('fecha', descending: true).snapshots();
  }
}
