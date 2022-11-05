import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // final FirebaseFirestore _createUser = FirebaseFirestore.instance;

  User? get currentUser => _firebaseAuth.currentUser;
  
  get documentpath => null;
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
  adduser(
    {required String Username,required String email, required int phone}) {
      return createUser
      .collection("User")
      .doc(currentUser!.uid)
      .set({"userName": userName, "email": email, "phone": phone});
    }
  final CollectionRefrence _User = FirebaseFirestore.instance.collection("Users");
  Future<void> update({
    String? Username, 
    String? email,
     String? location, 
     int? phone,
     String? birthDate })async{
    await _User.doc(currentUser!.uid).set({
      "userName": Username,
      "email": email,
      "location": location,
      "phone": phone,
      "birthdate": birthDate
    }, SetOptions(merge: true));
  }
  Future<void> deleteDoc()async {
    await _Users.doc(currentUser!.uid).delete();
  }
}

class Users {

}
