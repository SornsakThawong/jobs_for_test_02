// import 'dart:io';

// import 'package:dio/dio.dart';

// abstract class BaseException implements Exception {
//   final String message;

//   BaseException({this.message = ""});
// }

// class AppException extends BaseException {
//   AppException({
//     String message = "",
//   }) : super(message: message);
// }

// abstract class BaseApiException extends AppException {
//   final int httpCode;
//   final String status;

//   BaseApiException({this.httpCode = -1, this.status = "", String message = ""})
//       : super(message: message);
// }

// // =================== extends from BaseApiException ===================
// class ServiceUnavailableException extends BaseApiException {
//   ServiceUnavailableException(String message)
//       : super(
//             httpCode: HttpStatus.serviceUnavailable,
//             message: message,
//             status: "");
// }

// class ApiException extends BaseApiException {
//   ApiException({
//     required int httpCode,
//     required String status,
//     String message = "",
//   }) : super(httpCode: httpCode, status: status, message: message);
// }

// // =================== extends from ApiException ===================
// class NotFoundException extends ApiException {
//   NotFoundException(String message, String status)
//       : super(httpCode: HttpStatus.notFound, status: status, message: message);
// }

// // ======================== Function ========================
// AppException handleError(String error) {
//   // final logger = BuildConfig.instance.config.logger;
//   // final logger = AppConfig.logger;
//   // logger.e("Generic exception: $error");

//   return AppException(message: error);
// }

// Object handleDioError(DioException dioError) {
//   return _parseDioErrorResponse(dioError);
//   // switch (dioError.type) {
//   //   case DioExceptionType.cancel:
//   //     return AppException(message: "Request to API server was cancelled");
//   //   case DioExceptionType.badCertificate:
//   //     return AppException(message: "Request to API server was badCertificate");
//   //   case DioExceptionType.badResponse:
//   //     return AppException(message: "Request to API server was badResponse");
//   //   case DioExceptionType.connectionError:
//   //     return AppException(message: "Request to API server was connectionError");
//   //   case DioExceptionType.connectionTimeout:
//   //     return AppException(
//   //         message: "Request to API server was connectionTimeout");
//   //   case DioExceptionType.receiveTimeout:
//   //     return AppException(message: "Request to API server was receiveTimeout");
//   //   case DioExceptionType.sendTimeout:
//   //     return AppException(message: "Request to API server was sendTimeout");
//   //   case DioExceptionType.unknown:
//   //     return _parseDioErrorResponse(dioError);
//   //   default:
//   //     return AppException(message: "Request to API server was other");
//   // }
// }

// Exception _parseDioErrorResponse(DioException dioError) {
//   // final logger = BuildConfig.instance.config.logger;
//   int statusCode = dioError.response?.statusCode ?? -1;
//   String? status;
//   String? serverMessage;

//   // return ApiException(
//   //     httpCode: statusCode, status: status ?? "", message: serverMessage ?? "");

//   try {
//     if (statusCode == -1 || statusCode == HttpStatus.ok) {
//       statusCode = dioError.response?.data["statusCode"];
//     }
//     status = dioError.response?.data["status"];
//     serverMessage = dioError.response?.data["message"];
//     // ignore: unused_catch_stack
//   } catch (e, s) {
//     serverMessage = "Something went wrong. Please try again later.";
//   }

//   switch (statusCode) {
//     case HttpStatus.serviceUnavailable:
//       return ServiceUnavailableException("Service Temporarily Unavailable");
//     case HttpStatus.notFound:
//       return NotFoundException(serverMessage ?? "", status ?? "");
//     default:
//       return ApiException(
//           httpCode: statusCode,
//           status: status ?? "",
//           message: serverMessage ?? "");
//   }
// }
