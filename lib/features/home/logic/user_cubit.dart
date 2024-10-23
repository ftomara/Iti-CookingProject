import 'package:bloc/bloc.dart';

class UserCubit extends Cubit<String?> {
  UserCubit() : super(null); 

  void setUserId(String? userId) {
    emit(userId);
  }

  void clearUserId() {
    emit(null);
  }
}