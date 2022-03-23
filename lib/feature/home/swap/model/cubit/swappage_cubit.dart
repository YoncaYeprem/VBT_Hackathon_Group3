import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../addBook/book_model/productmodel.dart';
import '../../../../../product/utils/firebase/firebase_storage_functions.dart';

part 'swappage_state.dart';

class SwappageCubit extends Cubit<SwapPageState> {
  List<BookModel>? bookModel;
  bool isLoading = false;
  SwappageCubit() : super(SwapPageInitial()) {
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
    emit(SwapBookComplited(bookModel: bookModel));
  }
}
