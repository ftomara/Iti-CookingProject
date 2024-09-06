import 'package:flutter_bloc/flutter_bloc.dart';

class IdRecipe extends Cubit<int> {
  IdRecipe() : super(0); // Initial value
  int _id = 0;

  void setId(int id) {
    _id = id;
    emit(id); // Emit new ID when setId is called
  }

  int get getId => _id; // Getter for the current state
}
