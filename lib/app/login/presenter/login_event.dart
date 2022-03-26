abstract class LoginEvent {}

class LoginFetchListUser extends LoginEvent {}

class LoginToValidateEmail extends LoginEvent {
  final String email;
  final String password;

  LoginToValidateEmail({
    required this.email,
    required this.password,
  });
}
