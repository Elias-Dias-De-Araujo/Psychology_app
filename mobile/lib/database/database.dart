import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  DatabaseService._();

  static final DatabaseService _instance = DatabaseService._();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static FirebaseFirestore get() {
    return DatabaseService._instance._firestore;
  }
}

/* class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  // collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  //todo
  /*   Future<void> updateUserData(String sugars, String name, int strength) async {
    return await userCollection.doc(uid).update({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  } */

  // user list from snapshot
  List<User> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      //print(doc.data);
      return User(
        nome: doc['nome'],
        email: doc['email'],
        telefone: doc['telefone'],
        genero: doc['genero'],
        endereco: doc['endereco'],
      );
    }).toList();
  }

  // get user stream
  Stream<List<User>> get users {
    return userCollection.snapshots().map(_userListFromSnapshot);
  }
} */
