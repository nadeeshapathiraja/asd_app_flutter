import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';

class ItemController {
  //Firestore inctanec create
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Create a CollectionReference called category that references the firestore collection
  CollectionReference item = FirebaseFirestore.instance.collection('item');

  Future<void> saveItem(
    String uid,
    String categoryId,
    String name,
    File img,
    File audio,
  ) async {
    //Image upload
    UploadTask? task = uploadItemImg(img);
    final snapshot = await task?.whenComplete(() {});
    final downloadUrl = await snapshot?.ref.getDownloadURL();
    Logger().d(downloadUrl);

    //Audio file upload
    UploadTask? task2 = uploadItemAudio(audio);
    final snapshot2 = await task2?.whenComplete(() {});
    final downloadUrl2 = await snapshot2?.ref.getDownloadURL();
    Logger().d(downloadUrl2);

    //Get the unique document
    String docId = item.doc().id;

    await item.doc(docId).set({
      'id': docId,
      'uid': uid,
      'categoryId': categoryId,
      'name': name,
      'img': downloadUrl,
      'audio': downloadUrl2,
    });
  }

  //Upload Image file to db
  UploadTask? uploadItemImg(File file) {
    try {
      final fileName = basename(file.path);
      final destination = 'itemImage/$fileName';
      final ref = FirebaseStorage.instance.ref(destination);
      return ref.putFile(file);
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }

  //Upload Audio file to db
  UploadTask? uploadItemAudio(File audioFile) {
    try {
      final fileName = basename(audioFile.path);
      final destination = 'itemAudio/$fileName';
      final ref = FirebaseStorage.instance.ref(destination);
      return ref.putFile(audioFile);
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }

  //get all item data
  Stream<QuerySnapshot> getItems() =>
      FirebaseFirestore.instance.collection('item').snapshots();

  //Update Category
  Future<void> updateCategory(
    String id,
    String uid,
    String name,
    File? img,
  ) async {
    return item
        .doc(id)
        .update({'company': 'Stokes and Sons'})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  //Delete Category
  Future<void> deleteCategory(String itemId) {
    return item
        .doc(itemId)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }
}
