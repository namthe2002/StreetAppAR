import 'package:flutter_bloc/flutter_bloc.dart';
import '../login.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial()) {
      // TODO
  }

  void submitData({String? name, String? password}) {
    emit(LoginLoading());

    if (name == null || name.isEmpty || password == null || password.isEmpty) {
      emit(LoginFailure("Input fields are invalid"));
      return;
    }
    emit(LoginSuccess());
    
  }
}