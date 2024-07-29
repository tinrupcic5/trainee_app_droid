import 'package:dio/dio.dart';
import 'package:trainee_app/features/auth/presentation/util/AppStrings.dart';
import 'package:retrofit/retrofit.dart';

part 'application_props_api.g.dart';

@RestApi(baseUrl: AppStrings.baseUrl)
abstract class ApplicationPropsAPI {
  factory ApplicationPropsAPI(Dio dio, {String baseUrl}) = _ApplicationPropsAPI;

  @GET('/properties/version')
  Future<String> getVersion();

  @GET('/properties/name')
  Future<String> getName();
}
