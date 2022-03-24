import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../product/utils/firebase/firebase_storage_functions.dart';
import '../../book_model/productmodel.dart';
part 'add_book_state.dart';

class AddBookCubit extends Cubit<AddBookState> {
  AddBookCubit() : super(AddBookInitial());
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  TextEditingController bookNameController = TextEditingController();
  TextEditingController overviewController = TextEditingController();
  TextEditingController autherController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController pageCountController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  TextEditingController publisherController = TextEditingController();
  TextEditingController publishYearController = TextEditingController();
  FocusNode bookNameFocus = FocusNode();
  FocusNode overviewFocus = FocusNode();
  FocusNode autherFocus = FocusNode();
  FocusNode categoryFocus = FocusNode();
  FocusNode priceFocus = FocusNode();
  FocusNode pageCountFocus = FocusNode();
  FocusNode languageFocus = FocusNode();
  FocusNode publisherFocus = FocusNode();
  FocusNode publishYearFocus = FocusNode();

  bool? groupValue;
  String? photo;
  Uint8List? image;
  String? id;
  String? userId;
  String? createDate;
  XFile? imagePath;
  String? uploadPath;
  String? imageName;
  String? selectedValue;
  BookModel? bookModel;
  String tittleText = LocaleKeys.addBook_selectCategory.tr();
  List<String> category = [
    LocaleKeys.addBook_category_remembrance.tr(),
    LocaleKeys.addBook_category_novel.tr(),
    LocaleKeys.addBook_category_research.tr(),
    LocaleKeys.addBook_category_science.tr(),
    LocaleKeys.addBook_category_biography.tr(),
    LocaleKeys.addBook_category_attempt.tr(),
    LocaleKeys.addBook_category_education.tr(),
    LocaleKeys.addBook_category_philosophy.tr(),
    LocaleKeys.addBook_category_travel.tr(),
    LocaleKeys.addBook_category_poetry.tr(),
    LocaleKeys.addBook_category_story.tr(),
    LocaleKeys.addBook_category_religion.tr(),
    LocaleKeys.addBook_category_child.tr(),
    LocaleKeys.addBook_category_tale.tr(),
    LocaleKeys.addBook_category_selfImprovement.tr(),
    LocaleKeys.addBook_category_psychology.tr(),
    LocaleKeys.addBook_category_history.tr(),
    LocaleKeys.addBook_category_humor.tr()
  ];

  isExchange(bool? val) {
    groupValue = val;
    emit(IsExchange());
  }

  void changeSelectItems(String? data) {
    selectedValue = data;
    emit(AddBookonChange());
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
    emit(SelectImage());
  }

  Future addBook() async {
    if (image != null) {
      uploadPath = await FirebaseStorageFunctions()
          .uploadBookImage(imagePath: imagePath);
    }
    if (groupValue == true) {
      priceController.text = (0.0).toString();
    }
    bookModel = BookModel(
      id: "",
      userId: "",
      bookName: bookNameController.text,
      overview: overviewController.text,
      author: autherController.text,
      exchange: groupValue,
      publishYear: publishYearController.text,
      publisher: publisherController.text,
      pageCount: int.parse(pageCountController.text),
      category: selectedValue,
      photo: uploadPath ?? "",
      language: languageController.text,
      price: double.parse(priceController.text),
      createdAt: DateFormat.yMd().format(DateTime.now()).toString(),
    );
    await firestore.collection("books").doc().set(bookModel!.toJson());
    emit(AddBookComplete());
  }
}
