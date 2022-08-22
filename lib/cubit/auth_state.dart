part of 'auth_cubit.dart';

@immutable
abstract class AuthState extends Equatable{
  const AuthState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final UserModel userModel;

  AuthSuccess(this.userModel);

  @override
  // TODO: implement props
  List<Object?> get props => [userModel];
}

class AuthFailed extends AuthState {
  final String error;

  AuthFailed(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
