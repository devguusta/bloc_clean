import 'package:estudo_bloc/app/app_controller.dart';
import 'package:estudo_bloc/app/login/data/datasource/user_data_source_impl.dart';
import 'package:estudo_bloc/app/login/domain/usecase/get_user.dart';
import 'package:estudo_bloc/app/login/infra/repository/user_repository_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';

import './login_controller.dart';
import './login_page.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    // domain
    Bind.lazySingleton(
      (i) => GetUser(
        repository: i.get<UserRepositoryImplements>(),
      ),
    ),

    // infra

    Bind.lazySingleton(
      (i) => UserRepositoryImplements(
        dataSource: i.get<UserDataSourceImplements>(),
      ),
    ),

    // data
    Bind.lazySingleton(
      (i) => UserDataSourceImplements(
        dio: i.get<AppController>().dio,
      ),
    ),

    //presentation

    Bind.lazySingleton(
      (i) => LoginController(
        i.get<GetUser>(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => const LoginPage(),
    ),
  ];
}
