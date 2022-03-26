import 'package:estudo_bloc/app/login/domain/usecase/get_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginController extends Bloc<LoginEvent, LoginState> {
  final GetUser getUser;
  final String title = 'Login';
  bool emailValid = false;

  LoginController(
    this.getUser,
  ) : super(LoginStateEmpty()) {
    on<LoginFetchListUser>(
      (event, emit) async {
        emit(LoginStateLoading());

        final result = await getUser.call();
        result.fold(
          (l) => emit(LoginStateFailure(error: l)),
          (r) => emit(
            LoginStateSuccess(users: r),
          ),
        );
      },
    );
  }
}
