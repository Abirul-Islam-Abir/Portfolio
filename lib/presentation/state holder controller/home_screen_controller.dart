import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreenController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  void onInit() {
    listenToDataChanges();
    super.onInit();
  }

  final List  _myStringList = [];
    get myStringList => _myStringList;

  void listenToDataChanges() {
    // Reference to the "users" collection
    CollectionReference users = FirebaseFirestore.instance.collection('portfolio');

    // Create a stream subscription to listen for changes
    var subscription = users.snapshots().listen((QuerySnapshot querySnapshot) {
      for (var change in querySnapshot.docChanges) {
        // Handle different types of changes: added, modified, or removed
        if (change.type == DocumentChangeType.added) {
          print('Document added: ${change.doc.data()}');
        } else if (change.type == DocumentChangeType.modified) {
          print('Document modified: ${change.doc.data()}');
        } else if (change.type == DocumentChangeType.removed) {
          print('Document removed: ${change.doc.data()}');
        }
      }
    });
  }
}
