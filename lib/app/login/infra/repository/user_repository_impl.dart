import 'package:dartz/dartz.dart';
import 'package:estudo_bloc/app/core/error/failure.dart';
import 'package:estudo_bloc/app/login/domain/entities/user.dart';
import 'package:estudo_bloc/app/login/domain/infra/user_repository.dart';
import 'package:estudo_bloc/app/login/infra/datasource/user_data_source.dart';

import '../../domain/errors/user_failure.dart';

class UserRepositoryImplements implements UserRepository {
  final UserDataSource dataSource;
  UserRepositoryImplements({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, List<User>>> getUser() async {
    try {
      var result = await dataSource.getUser();
      if (result.isEmpty) {
        return Left(NoDataFound(
          errorMessage: "No data found",
          exception: null,
        ));
      }
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(UnknownError(
        errorMessage: "Server Failure",
        exception: e.runtimeType,
      ));
    }
  }
}
