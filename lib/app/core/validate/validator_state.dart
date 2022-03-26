abstract class ValidatorState {}

class ValidatorLoginStateSuccess extends ValidatorState {}

class ValidatorLoginStateFailure extends ValidatorState {
  final String error;
  ValidatorLoginStateFailure({required this.error});
}

class ValidatorStateEmpty extends ValidatorState {}
