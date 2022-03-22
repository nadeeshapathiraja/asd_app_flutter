import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryController {
  //Firestore inctanec create
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Create a CollectionReference called category that references the firestore collection
  CollectionReference category =
      FirebaseFirestore.instance.collection('category');

  Future<void> saveCategory(
    String uid,
    String name,
    File img,
    String voice,
  ) async {
    String docId = category.doc().id;

    await category.doc(docId).set({
      'id': docId,
      'uid': 1,
      'name': name,
      'img': "https://www.imgacademy.com/sites/default/files/home-bs.jpg",
      'voice': "https://www.imgacademy.com/sites/default/files/home-bs.jpg",
    });
  }
}
