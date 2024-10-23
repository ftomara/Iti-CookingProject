import 'package:flutter_bloc/flutter_bloc.dart';

class ApiOrFbsCubit extends Cubit<bool?>
{
  ApiOrFbsCubit():super(false);

  void setdatasource(bool where)
  {
    emit(where);
  }
  
  
}