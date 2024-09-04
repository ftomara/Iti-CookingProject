import 'package:bloc/bloc.dart';

class ItemCubit extends Cubit<String> {
  String _searchItem = ""; 
  String _category = "breakfast"; 

  ItemCubit() : super("breakfast");

 
  void change(String item, String search) {
    if (search.isNotEmpty) {
      _searchItem = search;
      emit(search); 
    } else {
      _category = item;
      _searchItem = "";
      emit(item); 
    }
  }

  String get searchItem => _searchItem;

  String get category => _category;
}
