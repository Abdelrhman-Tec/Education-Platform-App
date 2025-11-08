import 'package:dio/dio.dart';
import 'package:education_platform_app/core/networking/api_constants.dart';
import 'package:education_platform_app/features/categories/data/model/categories_response_model.dart';
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
  Future<CategoriesResponseModel> getCategories();
}
