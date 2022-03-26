import 'package:dio/dio.dart';

import 'core/services/custom_dio.dart';

class AppController {
  bool isDark = false;
  final Dio dio = CustomDio();
}
