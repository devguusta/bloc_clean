import 'package:estudo_bloc/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'login/presenter/login_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton(
      (i) => AppController(),
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
