import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:trainee_app/features/auth/presentation/util/AppStrings.dart';
import 'package:trainee_app/features/common/message_body.dart';
import 'package:trainee_app/features/files/domain/profile_image.dart';

part 'profile_image_api.g.dart';

@RestApi(baseUrl: AppStrings.baseUrl)
abstract class ProfileImageAPI {
  factory ProfileImageAPI(Dio dio, {String baseUrl}) = _ProfileImageAPI;

  @POST('/image/upload/{schoolId}')
  @MultiPart()
  Future<MessageBody> uploadFile(
    @Part() File file,
    @Path("schoolId") int schoolId,
  );

  @GET('/image/stream/{schoolId}')
  Future<ProfileImage> getProfileImageBySchoolId(
    @Path("schoolId") int schoolId,
  );
}
