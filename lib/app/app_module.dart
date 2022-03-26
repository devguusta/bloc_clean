import 'package:estudo_bloc/app/app_controller.dart';
import 'package:estudo_bloc/app/core/validate/validator_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'login/presenter/login_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton(
      (i) => AppController(),
    ),
    Bind.lazySingleton(
      (i) => ValidatorController(),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      Modular.initialRoute,
      module: LoginModule(),
    ),
  ];
}
