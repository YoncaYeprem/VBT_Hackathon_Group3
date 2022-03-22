import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';


class FirebaseStorageFunctions {

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  String? uploadPath;

   Future<String?> uploadGallery({XFile? imagePath}) async {
    String uploadFileName =
          DateTime.now().microsecondsSinceEpoch.toString() + '.jpg';
      Reference reference = storage.ref().child("images").child(uploadFileName);
      UploadTask uploadTask = reference.putFile(File(imagePath!.path));
      uploadTask.snapshotEvents.listen((event) {
        print(event.bytesTransferred.toString() +
            "\t" +
            event.totalBytes.toString());
      });

      await uploadTask.whenComplete(() async {
        uploadPath = await uploadTask.snapshot.ref.getDownloadURL();
        return uploadPath;
      });
      return uploadPath;
  }


  Future saveUserInStorage(userId, user)async {
    await firestore.collection("users")
    .doc(userId)
    .set(user.toJson());
  }
}
