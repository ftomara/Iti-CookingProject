import 'package:bloc/bloc.dart';

class SearchCubit extends Cubit<String> {
  SearchCubit() : super("");
  void getItem(String item) {
    emit(item);
  }
}
