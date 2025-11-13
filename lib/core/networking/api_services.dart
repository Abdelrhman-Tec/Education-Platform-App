import 'package:dio/dio.dart';
import 'package:education_platform_app/core/networking/api_constants.dart';
import 'package:education_platform_app/features/cart/data/model/cart_request_model.dart';
import 'package:education_platform_app/features/cart/data/model/cart_response_model.dart';
import 'package:education_platform_app/features/categories/data/model/categories_response_model.dart';
import 'package:education_platform_app/features/courses/data/model/courses_response_model.dart';
import 'package:education_platform_app/features/enrollments/data/model/enrollments_request_model.dart';
import 'package:education_platform_app/features/enrollments/data/model/enrollments_response_model.dart';
import 'package:education_platform_app/features/enrollments/data/model/unenroll_response_model.dart';
import 'package:education_platform_app/features/favorites/data/model/favorites_request_model.dart';
import 'package:education_platform_app/features/favorites/data/model/favorites_response_model.dart';
import 'package:education_platform_app/features/lessons/data/model/lessons_response_model.dart';
import 'package:education_platform_app/features/my_courses/data/model/my_course_response_model.dart';
import 'package:education_platform_app/features/sign_in/data/model/login_request_model.dart';
import 'package:education_platform_app/features/sign_in/data/model/login_response_model.dart';
import 'package:education_platform_app/features/sign_up/data/model/register_request_model.dart';
import 'package:education_platform_app/features/sign_up/data/model/register_response_model.dart';
import 'package:retrofit/retrofit.dart';
part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponseModel> login(@Body() LoginRequestModel loginRequestModel);

  @POST(ApiConstants.register)
  Future<RegisterResponseModel> register(
    @Body() RegisterRequestModel registerRequestModel,
  );

  @GET(ApiConstants.categories)
  Future<List<CategoriesResponseModel>> getCategories();

  // Courses
  @GET(ApiConstants.courses)
  Future<List<CoursesResponseModel>> getCourses();

  @GET(ApiConstants.searchCourses)
  Future<List<CoursesResponseModel>> searchCourses(
    @Query("query") String query,
  );

  //cart
  @GET(ApiConstants.cart)
  Future<CartResponseModel> getCart(@Path("id") int id);

  @POST(ApiConstants.addToCart)
  Future<CartResponseBody> addToCart(@Body() CartRequestModel request);

  @DELETE(ApiConstants.removeFromCart)
  Future<RemoveCartResponse> removeFromCart(@Path("id") int id);

  @GET(ApiConstants.myCourses)
  Future<List<MyCoursesResponseModel>> getMyCourses(@Path("id") int id);

  @POST(ApiConstants.enrrollment)
  Future<EnrollmentsResponseModel> enroll(
    @Body() EnrollmentsRequestModel request,
  );

  @GET(ApiConstants.getEnrollments)
  Future<List<EnrollmentsResponseModel>> getEnrollments(@Path("id") int id);

  @DELETE(ApiConstants.unenroll)
  Future<UnenrollResponseModel> unenroll(
    @Path("userId") int userId,
    @Path("courseId") int courseId,
  );

  @POST(ApiConstants.logout)
  Future<String> logout(@Header("Authorization") String token);

  // Favorites
  @GET(ApiConstants.getFavorites)
  Future<FavoritesResponseModel> getFavorites(@Path("id") int userId);

  @POST(ApiConstants.addToFavorites)
  Future<FavoritesResponseModel> addToFavorites(
    @Body() FavoritesRequestModel body,
  );

  @DELETE(ApiConstants.removeFromFavorites)
  Future<FavoritesRemoveResponseModel> removeFromFavorites(
    @Path("id") int userId,
    @Path("courseId") int courseId,
  );

  @GET(ApiConstants.getCourseLessons)
  Future<LessonsResponseModel> getCourseLessons(
    @Path("course_id") int courseId,
    @Query("user_id") int userId,
  );
}
