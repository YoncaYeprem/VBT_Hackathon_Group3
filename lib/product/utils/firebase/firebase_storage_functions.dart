import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../../feature/authentication/register/model/user_model.dart';
import '../../../feature/addBook/book_model/productmodel.dart';

class FirebaseStorageFunctions {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  String? uploadPath;

  Future<String?> uploadGallery({XFile? imagePath}) async {
    String uploadFileName =
        DateTime.now().microsecondsSinceEpoch.toString() + '.jpg';
    Reference reference = storage.ref().child("images").child(uploadFileName);
    UploadTask uploadTask = reference.putFile(File(imagePath!.path));
    uploadTask.snapshotEvents.listen((event) {});

    await uploadTask.whenComplete(() async {
      uploadPath = await uploadTask.snapshot.ref.getDownloadURL();
      return uploadPath;
    });
    return uploadPath;
  }

  Future saveUserInStorage(userId, user) async {
    await firestore.collection("users").doc(userId).set(user.toJson());
  }

  Future<UserModel?> getUserModel(String userId) async {
    try {
      final user = FirebaseFirestore.instance
          .collection("users")
          .withConverter<UserModel>(
              fromFirestore: (snapshot, options) =>
                  UserModel.fromJson(snapshot.data()!),
              toFirestore: (model, _) => UserModel().toJson());

      final model = await user.doc(userId).get().then((value) => value.data());
      if (model != null) {
        return model;
      }
    } on FirebaseStorage catch (e) {
      log(e.bucket);
    }
    return null;
  }

  Future<String?> uploadBookImage({XFile? imagePath}) async {
    String uploadFileName =
        DateTime.now().microsecondsSinceEpoch.toString() + '.jpg';
    Reference reference = storage.ref().child("books").child(uploadFileName);
    UploadTask uploadTask = reference.putFile(File(imagePath!.path));
    uploadTask.snapshotEvents.listen((event) {});

    await uploadTask.whenComplete(() async {
      uploadPath = await uploadTask.snapshot.ref.getDownloadURL();
      return uploadPath;
    });
    return uploadPath;
  }

  Future<List<BookModel>?> getBookModelsExchange() async {
    CollectionReference _bookRef = firestore.collection("books")
      ..where('exchange', isEqualTo: true);
    QuerySnapshot snapshot = await _bookRef.get();
    final response = snapshot.docs.map((e) => e.data()).toList();

    if (response is List) {
      return response.map((e) => BookModel.fromJson(e)).toList();
    } else {
      return null;
    }
  }

  Future<List<BookModel>?> getBookModels({required String ownedUID}) async {
    List<BookModel>? _temp;
    CollectionReference _collRef = firestore.collection("books");
    QuerySnapshot snapshot = await _collRef.get();
    final response = snapshot.docs.map((e) => e.data()).toList();

    if (response is List) {
      return response.map((e) => BookModel.fromJson(e)).toList();
    } else {
      return null;
    }
  }
}
