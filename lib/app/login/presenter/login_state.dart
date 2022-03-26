import 'package:estudo_bloc/app/login/domain/entities/user.dart';

import '../../core/error/failure.dart';

abstract class LoginState {}

class LoginStateSuccess extends LoginState {
  List<User> users = [];
  LoginStateSuccess({
    required this.users,
  });
}

class LoginStateFailure extends LoginState {
  late Failure error;
  LoginStateFailure({
    required this.error,
  });
}

class LoginStateLoading extends LoginState {}

class LoginStateEmpty extends LoginState {}

class LoginStateInvalidForms extends LoginState {}

class LoginStateValidForms extends LoginState {}
