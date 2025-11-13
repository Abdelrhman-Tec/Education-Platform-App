abstract class ApiConstants {
  static const String baseUrl = "http://192.168.1.2";

  static const String login = "/api/login";
  static const String register = "/api/register";
  static const String logout = "/api/logout";
  static const String users = "/api/users";

  static const String categories = "/api/categories";

  static const String courses = "/api/courses";

  static const String searchCourses = "/api/courses/search";
  static const String unenroll = "/api/enrollments/{userId}/{courseId}";
  static const String cart = "/api/cart/{id}";
  static const String addToCart = "/api/cart";
  static const String removeFromCart = "/api/cart/{id}";
  static const String getEnrollments = '/api/enrollments/{id}';
  static const String myCourses = '/api/my-courses/{id}';
  static const String enrrollment = '/api/enrollments-cart';

  static const String getFavorites = "/api/favorites/{id}";
  static const String addToFavorites = "/api/favorites";
  static const String removeFromFavorites = "/api/favorites/{id}/{courseId}";
  static const String getCourseLessons = "/api/courses/{course_id}/lessons";
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
