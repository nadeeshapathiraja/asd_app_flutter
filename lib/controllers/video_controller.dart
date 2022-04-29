import 'package:cloud_firestore/cloud_firestore.dart';

class VideoController {
  //Firestore inctanec create
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Create a CollectionReference called category that references the firestore collection
  CollectionReference video =
      FirebaseFirestore.instance.collection('video_url');

  //get all video data
  Stream<QuerySnapshot> getVideos() =>
      FirebaseFirestore.instance.collection('video_url').snapshots();
}
