import 'package:dartz/dartz.dart';
import 'package:estudo_bloc/app/core/error/failure.dart';
import 'package:estudo_bloc/app/login/domain/entities/user.dart';

import '../infra/user_repository.dart';

abstract class IGetUser {
  Future<Either<Failure, List<User>>> call();
}

class GetUser implements IGetUser {
  final UserRepository repository;
  GetUser({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<User>>> call() async {
    return await repository.getUser();
  }
}
