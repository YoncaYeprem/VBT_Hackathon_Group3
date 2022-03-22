import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vbt_hackathon_group3/feature/authentication/register/model/user_model.dart';
import 'package:vbt_hackathon_group3/product/productmodel.dart';
import 'package:vbt_hackathon_group3/product/utils/firebase/firebase_auth.dart';

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

  Future saveUserInStorage(userId, user) async {
    await firestore.collection("users").doc(userId).set(user.toJson());
  }

  Future<UserModel?> getUserModel(String doc) async {
    try {
      final user = FirebaseFirestore.instance
          .collection("users")
          .withConverter<UserModel>(
              fromFirestore: (snapshot, options) =>
                  UserModel.fromJson(snapshot.data()!),
              toFirestore: (model, _) => UserModel().toJson());

      final model = await user.doc(doc).get().then((value) => value.data());
      if (model != null) {
        return model;
      }
    } on FirebaseStorage catch (e) {
      log(e.bucket);
    }

    return null;
  }

  Future<BookModel?> getBookModels(String bookId) async {
    if (bookId.isEmpty) {
      return null;
    }
    try {
      final books = FirebaseFirestore.instance
          .collection("books")
          .withConverter<BookModel>(
              fromFirestore: (snapshot, options) =>
                  BookModel.fromJson(snapshot.data()!),
              toFirestore: (model, _) => BookModel().toJson());
      final model = await books.doc(bookId).get().then((value) => value.data());
      return model;
    } on FirebaseStorage catch (e) {
      log(e.bucket);
    }
  }
}
