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
    String audio,
  ) async {
    UploadTask? task = uploadItemImg(img);
    final snapshot = await task?.whenComplete(() {});
    final downloadUrl = await snapshot?.ref.getDownloadURL();
    Logger().d(downloadUrl);

    //Get the unique document
    String docId = item.doc().id;

    await item.doc(docId).set({
      'id': docId,
      'uid': uid,
      'categoryId': categoryId,
      'name': name,
      'img': downloadUrl,
      'audio': audio,
    });
  }

  //Upload file to db
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

  //get all item data
  Stream<QuerySnapshot> testStream() =>
      FirebaseFirestore.instance.collection('item').snapshots();
}
