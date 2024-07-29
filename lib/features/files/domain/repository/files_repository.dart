import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:trainee_app/core/error/failure.dart';
import 'package:trainee_app/features/common/message_body.dart';
import 'package:trainee_app/features/files/domain/file_uri_response.dart';

abstract interface class FilesRepository {
  Future<Either<Failure, MessageBody>> uploadFile(
    File file,
    int sectionId,
    String viewStatus,
    String comment,
  );

  Future<Either<Failure, MessageBody>> renameFileName(
    int fileId,
    String newFileName,
  );

  Future<Either<Failure, MessageBody>> deleteFileDetails(
    int fileId,
  );

  Future<Either<Failure, List<FileUriResponse>>> getAllFilesAndNotifications(
    int userId,
  );
}
