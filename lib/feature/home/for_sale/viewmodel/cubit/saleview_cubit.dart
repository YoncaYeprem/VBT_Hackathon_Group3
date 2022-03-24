import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../product/utils/firebase/firebase_storage_functions.dart';
import '../../../../addBook/book_model/productmodel.dart';

part 'saleview_state.dart';

class SaleviewCubit extends Cubit<SaleviewState> {
  List<BookModel>? bookModel;
  bool isLoading = false;
  SaleviewCubit() : super(SaleviewInitial()) {
    init();
  }

  Future<void> getBookData() async {
    changeLoading();
    bookModel = await FirebaseStorageFunctions().getBookModelsExchange();
    changeLoading();
  }

  void changeLoading() {
    isLoading = !isLoading;
  }

  void init() async {
    await getBookData();
    emit(SaleViewComplited(bookModel: bookModel));
  }
}
