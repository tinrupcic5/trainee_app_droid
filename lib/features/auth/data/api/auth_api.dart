import 'package:dio/dio.dart';
import 'package:trainee_app/features/auth/data/api/model/user/UserLogin.dart';
import 'package:trainee_app/features/auth/data/api/model/user/UserRegisterRequest.dart';
import 'package:trainee_app/features/auth/data/api/model/user/userLogin/UserLoginResponse.dart';
import 'package:trainee_app/features/auth/presentation/util/AppStrings.dart';
import 'package:retrofit/retrofit.dart';
import 'package:trainee_app/features/common/message_body.dart';

part 'auth_api.g.dart';

@RestApi(baseUrl: AppStrings.baseUrl)
abstract class AuthAPI {
  factory AuthAPI(Dio dio, {String baseUrl}) = _AuthAPI;

  @POST('/user/login')
  Future<UserLoginResponse> loginUser(@Body() UserLogin userLogin);

  @POST('')
  Future<UserLoginResponse> registerUser(
      UserRegisterRequest userRegisterRequest);

  @GET('/user/logout')
  Future<MessageBody> logout(
      @Header('Authorization')
      String authorizationHeader); // authorizationHeader = token
}
