import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
class Firebase_Functions {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> signup(email, password, Map<String, String> data) async {
    try {
      UserCredential _user = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      data['id'] = _user.user!.uid;
      await _firebaseFirestore
          .collection('users')
          .doc(_user.user!.uid)
          .set(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserCredential> login(email, password) async {
    try {
      UserCredential _user = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _user;
    } catch (e) {
      rethrow;
    }
  }
  

  get1Product() async {
    await _firebaseFirestore.collection('users').doc('id').get();
  }

  updateProduct() async {
    await _firebaseFirestore.collection('users').doc('id').update({});
  }
 deleteProduct() async {
    await _firebaseFirestore.collection('users').doc('id').delete();
  }

  getMoreProduct() async {
    QuerySnapshot<Map<String, dynamic>> data =
        await _firebaseFirestore.collection('users').get();
 
  }
   
  Future<String> uploadPost(String path, String name, File file) async {
    Reference ref = _storage.ref().child('$path/$name');
    UploadTask uploadTask = ref.putFile(file);
    await Future.value(uploadTask);
    String link = await ref.getDownloadURL();

    return link;
  }
}
