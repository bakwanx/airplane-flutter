import 'package:airplane/models/user_model.dart';
import 'package:airplane/services/auth_service.dart';
import 'package:airplane/services/user_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signIn({
    required String email,
    required String password
  }) async {
    try{
      emit(AuthLoading());
      UserModel userModel = await AuthService().signIn(
        email: email,
        password: password
      );
      emit(AuthSuccess(userModel));
    }catch(e){
      emit(AuthFailed(e.toString()));
    }
  }

  void signUp({
    required String email,
    required String password,
    required String name,
    String hobby = "",
  }) async {
    try {
      emit(AuthLoading());
      UserModel userModel = await AuthService()
          .signUp(email: email, password: password, name: name, hobby: hobby);

      emit(AuthSuccess(userModel));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signOut() async {
    try{
      emit(AuthLoading());
      await AuthService().signOut();
      emit(AuthInitial());
    }catch(e){
      emit(AuthFailed(e.toString()));
    }
  }

  void getCurrentUser(String id) async {
    try{
      UserModel userModel = await UserService().getUserById(id);
      emit(AuthSuccess(userModel));
    }catch(e){
      emit(AuthFailed(e.toString()));
    }
  }
}
