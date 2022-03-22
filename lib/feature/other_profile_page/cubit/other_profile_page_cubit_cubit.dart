import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vbt_hackathon_group3/product/productmodel.dart';

part 'other_profile_page_cubit_state.dart';

class OtherProfilePageCubit extends Cubit<OtherProfilePageCubitState> {
  OtherProfilePageCubit() : super(OtherProfilePageCubitInitial()) {}
  BookModel? model;
}
