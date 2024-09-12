import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' hide Response;
import 'package:master_vpn/app/controllers/connectivity_provider.dart';
import 'package:master_vpn/app/utils/snackbar_utils.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioService extends GetxService {
  late Dio dio;
  final ConnectivityProvider _connectivityProvider = Get.find();

  @override
  void onInit() {
    super.onInit();
    dio = Dio(
      BaseOptions(
        /// Base URL
        baseUrl: "",

        /// API connection timeout
        connectTimeout: const Duration(seconds: 5),

        /// API reponse timeout
        receiveTimeout: const Duration(seconds: 30),
      ),
    );

    dio.interceptors.addAll(
      [
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            /// Will check for internet connection before making any call
            bool connectionStatus = _connectivityProvider.isOnline.value;
            if (!connectionStatus) {
              DialogUtil.error(msg: "No internet connection available. Please check your connection.");
              return handler.reject(DioException(
                requestOptions: options,
                type: DioExceptionType.unknown,
                error: "No internet connection",
              ));
            }

            return handler.next(options);
          },
          onResponse: (response, handler) {
            return handler.next(response);
          },
          onError: (DioException error, handler) async {
            /// Retry logic for the APIs if request fails due to time out
            if (_shouldRetry(error)) {
              try {
                return handler.resolve(await _retry(error.requestOptions));
              } catch (e) {
                return handler.next(error);
              }
            }
            return handler.next(error);
          },
        ),

        /// Will be helpful in debug process
        ///
        /// It will log the complete request in console while debugging the app
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          enabled: false,
        )
      ],
    );
  }

  bool _shouldRetry(DioException error) {
    return error.type == DioExceptionType.connectionTimeout || error.type == DioExceptionType.receiveTimeout || error.type == DioExceptionType.sendTimeout;
  }

  Future<Response> _retry(RequestOptions requestOptions) async {
    return dio.request(
      requestOptions.path,
      options: Options(
        method: requestOptions.method,
        headers: requestOptions.headers,
      ),
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
    );
  }
}
