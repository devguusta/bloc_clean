abstract class Failure {
  final String errorMessage;
  final dynamic exception;
  Failure({
    required this.errorMessage,
    required this.exception,
  });
}

class UnknownError extends Failure {
  UnknownError({required String errorMessage, required exception})
      : super(errorMessage: errorMessage, exception: exception);
}
