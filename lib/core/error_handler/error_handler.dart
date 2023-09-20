
import 'package:dio/dio.dart';
import '../resources/manager_strings.dart';
import 'package:service/core/extensions/extensions.dart';
class Failure {
  int code;
  String message;

  Failure({
    required this.code,
    required this.message,
  });
}

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      failure = Failure(
        code: error.response!.statusCode.parseError(),
        message: error.response?.data['message'] ??
            error.response?.data['errors'].toString() ??
            ManagerStrings.error,
      );
    } else {
      failure = Failure(
        code: 400,
        message: ManagerStrings.error,
      );
    }
  }
}

