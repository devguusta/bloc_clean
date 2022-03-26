abstract class ValidatorEvent {}

class LoginToValidatorEmail extends ValidatorEvent {
  final String email;
  final String password;

  LoginToValidatorEmail({
    required this.email,
    required this.password,
  });
}
