import 'package:bloc/bloc.dart';

class ImageCubit extends Cubit<String?> {
  ImageCubit() : super(null); 

  void setImagepath(String? imagepath) {
    emit(imagepath);
  }

  void clearImagepath() {
    emit(null);
  }
}