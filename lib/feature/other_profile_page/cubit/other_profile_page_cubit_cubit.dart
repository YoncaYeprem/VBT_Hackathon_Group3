import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'other_profile_page_cubit_state.dart';

class OtherProfilePageCubit extends Cubit<OtherProfilePageCubitState> {
  OtherProfilePageCubit() : super(OtherProfilePageCubitInitial()) {
    getBookData();
  }

  void getBookData() {}
}
