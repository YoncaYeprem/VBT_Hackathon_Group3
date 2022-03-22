import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../product/utils/firebase/firebase_auth.dart';
import '../../../../../product/utils/firebase/firebase_storage_functions.dart';
import '../../../login/view/login_view.dart';
import '../../model/user_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();

  FocusNode firstNameNode = FocusNode();
  FocusNode lastNameNode = FocusNode();
  FocusNode usernameNode = FocusNode();
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  FocusNode repeatPasswordNode = FocusNode();

  Uint8List? image;
  UserModel? user;
  String? userId;
  String? uploadPath;
  String? photo;
  XFile? imagePath;
  String? imageName;

  bool isVisiblePass = true;
  void changeVisibility() {
    isVisiblePass = !isVisiblePass;
    emit(RegisterLoading());
  }

  bool isVisibleRepeatPass = true;
  void changeVisibilityRepeat() {
    isVisibleRepeatPass = !isVisibleRepeatPass;
    emit(RegisterLoading());
  }

  bool isLoading = false;

  void changeLoading() {
    isLoading = !isLoading;
  }

  Future<void> userSignUp(BuildContext context) async {
    changeLoading();

    if (formKey.currentState!.validate()) {
      //emit(RegisterLoading());
      UserCredential userCredential = await Authentication()
          .signUp(emailController.text, passwordController.text, context);

      if (userCredential != null) {
        userId = userCredential.user!.uid;
      }

      if (image != null) {
        uploadPath = await FirebaseStorageFunctions()
            .uploadGallery(imagePath: imagePath);
      }
       user = UserModel(
            id: userId,
            firstName: firstNameController.text,
            lastName: lastNameController.text,
            userName: usernameController.text,
            email: emailController.text,
            password: passwordController.text,
            photo: uploadPath ?? "");

      await FirebaseStorageFunctions()
          .saveUserInStorage(userId, user)
          .then(
            (value) async => await ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Register Succesfull"),
              ),
            ),
          )
          .then((value) => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginView(),
              )));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Please Fill Required Places"),
              ),
            );
    }
    changeLoading();
    emit(RegisterComplete());
  }

  void selectImage() async {
    final XFile? selectedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (selectedImage != null) {
      imagePath = selectedImage;
      imageName = selectedImage.name.toString();
    }
    File imageFile = File(selectedImage!.path);
    Uint8List imageRaw = await imageFile.readAsBytes();
    image = imageRaw;
    emit(RegisterSelectImage());
  }
}
