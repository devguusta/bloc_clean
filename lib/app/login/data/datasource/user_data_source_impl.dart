import 'package:dio/dio.dart';
import 'package:estudo_bloc/app/login/data/mapper/user_mapper.dart';
import 'package:estudo_bloc/app/login/domain/entities/user.dart';
import 'package:estudo_bloc/app/login/infra/datasource/user_data_source.dart';

import '../../domain/errors/user_failure.dart';

class UserDataSourceImplements implements UserDataSource {
  final Dio dio;
  UserDataSourceImplements({
    required this.dio,
  });
  @override
  Future<List<User>> getUser() async {
    try {
      final response = await dio.get('/users');
      return (response.data as List)
          .map((e) => UserMapper.fromMap(e).toEntity())
          .toList();
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        throw UserNoInternetConnection(
            errorMessage: "No internet connection", exception: e.type);
      } else if (e.type == DioErrorType.other) {
        throw UserNoInternetConnection(
            errorMessage: "No internet connection", exception: e.type);
      } else {
        throw UserError(
            errorMessage: "Ocorreu um erro no servidor", exception: null);
      }
    }
  }
}
