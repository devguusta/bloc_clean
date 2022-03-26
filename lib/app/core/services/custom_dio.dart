import 'package:dio/native_imp.dart';
import 'package:estudo_bloc/app/core/endpoints/jsonplaceholder.dart';

class CustomDio extends DioForNative {
  CustomDio() {
    options.baseUrl = JsonPlaceHolderEndPoints.apiKey;
    options.contentTypeWithRequestBody("application/json");
    interceptors.addAll([
      // TokenInterceptors(),
    ]);
  }
}
