import 'package:dio/dio.dart';

class TrafficInterceptor extends Interceptor {
  final accessToken = 'pk.eyJ1IjoieWFkZXJtYyIsImEiOiJjbWFieHlsanYxODB5Mm5wdXd6M3J0dWk1In0.7YCbV8OwJ76hd1uhj80-ag';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({
      'alternatives': true,
      'geometries': 'polyline6',
      'overview': 'simplified',
      'steps': false,
      'access_token': accessToken
    });

    super.onRequest(options, handler);
  }
}