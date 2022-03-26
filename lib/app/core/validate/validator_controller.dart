import 'package:estudo_bloc/app/core/validate/validate_event.dart';
import 'package:estudo_bloc/app/core/validate/validator_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ValidatorController extends Bloc<ValidatorEvent, ValidatorState> {
  final String title = 'Validator';
  bool emailValid = false;

  ValidatorController() : super(ValidatorStateEmpty()) {
    on<LoginToValidatorEmail>(
      (event, emit) {
        if (event.email.length > 8 && event.password.length > 6) {
          emit(ValidatorLoginStateSuccess());
        } else {
          emit(ValidatorLoginStateFailure(error: 'Invalid email or password'));
        }
      },
    );
  }
}
