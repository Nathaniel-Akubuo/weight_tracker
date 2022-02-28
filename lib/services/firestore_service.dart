import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weight_tracker/models/weight_model.dart';

class FireStoreService {
  final _weightData = FirebaseFirestore.instance.collection('weight-data');

  void addWeightEntry(WeightModel weightModel) {
    var doc = _weightData.doc();
    weightModel.id = doc.id;
    doc.set(weightModel.toMap());
  }

  void deleteEntry(WeightModel weightModel) =>
      _weightData.doc(weightModel.id).delete();

  void editEntry(WeightModel weightModel) =>
      _weightData.doc(weightModel.id).update(weightModel.toMap());

  Stream<QuerySnapshot> get weightStream =>
      _weightData.orderBy('date', descending: true).snapshots();
}
