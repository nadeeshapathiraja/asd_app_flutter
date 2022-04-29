import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';

class CategoryController {
  //Firestore inctanec create
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Create a CollectionReference called category that references the firestore collection
  CollectionReference category =
      FirebaseFirestore.instance.collection('category');

  Future<void> saveCategory(
    String uid,
    String? name,
    File? img,
  ) async {
    UploadTask? task = uploadImg(img!);
    final snapshot = await task!.whenComplete(() {});
    final downloadUrl = await snapshot.ref.getDownloadURL();

    //Get the unique document
    String docId = category.doc().id;

    await category.doc(docId).set({
      'id': docId,
      'uid': uid,
      'name': name,
      'img': downloadUrl,
    });
  }

  //Upload file to db
  UploadTask? uploadImg(File file) {
    try {
      final fileName = basename(file.path);
      final destination = 'categoryImage/$fileName';
      final ref = FirebaseStorage.instance.ref(destination);
      return ref.putFile(file);
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }

  //Get All Category data
  Stream<QuerySnapshot> testStream() =>
      FirebaseFirestore.instance.collection('category').snapshots();

//Update Category
  Future<void> updateCategory(
    String uid,
    String name,
    File? img,
  ) async {
    return category
        .doc('ABC123')
        .update({'company': 'Stokes and Sons'})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  //Delete Category
  Future<void> deleteCategory(String categoryId) {
    return category
        .doc(categoryId)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }
}
