abstract class ApiConstants {
  static const String baseUrl = "http://192.168.1.2";

  /// Authentication
  static const String login = "/api/login";
  static const String register = "/api/register";
  static const String users = "/api/users";

  /// Categories
  static const String categories = "/api/categories";

  /// Courses
  static const String courses = "/api/courses";

  /// Search Courses
  static const String searchCourses = "/courses/search";
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
