import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:trainee_app/features/auth/presentation/util/AppStrings.dart';
import 'package:trainee_app/features/common/message_body.dart';
import 'package:trainee_app/features/files/domain/file_uri_response.dart';

part 'file_details_api.g.dart';

@RestApi(baseUrl: AppStrings.baseUrl)
abstract class FileDetailsAPI {
  factory FileDetailsAPI(Dio dio, {String baseUrl}) = _FileDetailsAPI;

  @POST('/filedetails//upload/{sectionId}/{viewStatus}')
  @MultiPart()
  Future<MessageBody> uploadFile(
    @Part() File file,
    @Path("sectionId") int sectionId,
    @Path("viewStatus") String viewStatus,
    @Part() String comment,
  );

  @PUT('/filedetails/rename/{fileId}/{newFileName}')
  Future<MessageBody> renameFileName(
    @Path("fileId") int fileId,
    @Path("newFileName") String newFileName,
  );

  @DELETE('/filedetails/{fileId}')
  Future<MessageBody> deleteFileDetails(
    @Path("fileId") int fileId,
  );

  @GET('/filedetails/stream/{userId}')
  Future<List<FileUriResponse>> getAllFilesAndNotifications(
    @Path("userId") int userId,
  );
}
