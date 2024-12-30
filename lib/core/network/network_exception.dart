
const String logoutMessage = "Your session expired. Please log in again.";
const String noInternetMessage = "Please check your internet connection and try again";
const successApiCode = 1;
const failedApiCode = 0;

class LogoutException implements Exception {
  final String message = logoutMessage;
  const LogoutException();
}

class NoInternetException implements Exception {
  final String message = noInternetMessage;
  const NoInternetException();
}

class ApiException implements Exception {
  final int statusCode;
  final int apiCode;
  final String message;

  const ApiException({required this.statusCode, required this.apiCode, required this.message});

  @override
  String toString() {
    return "api code $statusCode - error message $message";
  }
}

class FetchException implements Exception {
  final String message;

  const FetchException({required this.message});
}
