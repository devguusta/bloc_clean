import 'package:estudo_bloc/app/app_controller.dart';
import 'package:estudo_bloc/app/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends ModularState<AppWidget, AppController> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Slidy',
      theme: ThemeData(
          elevatedButtonTheme: controller.isDark
              ? ElevationButtonTheme.darkElevationButton
              : ElevationButtonTheme.lightElevationButton,
          primarySwatch: Colors.blue,
          appBarTheme: controller.isDark
              ? AppBarThemeCore.darkAppBarTheme
              : AppBarThemeCore.lighAppBarTime),
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
    );
  }
}
