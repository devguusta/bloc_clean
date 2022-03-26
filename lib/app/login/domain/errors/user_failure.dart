import '../../../core/error/failure.dart';

class NoDataFound extends Failure {
  NoDataFound({required String errorMessage, required exception})
      : super(
          errorMessage: 'No data founds',
          exception: exception,
        );
}

abstract class NoInternetConnection extends Failure {
  NoInternetConnection({required String errorMessage, required exception})
      : super(errorMessage: 'No internet connection', exception: exception);
}

class UserNoInternetConnection extends NoInternetConnection {
  UserNoInternetConnection({required String errorMessage, required exception})
      : super(errorMessage: 'No internet connection', exception: exception);
}

class UserError extends Failure {
  UserError({required String errorMessage, required exception})
      : super(errorMessage: errorMessage, exception: exception);
}
