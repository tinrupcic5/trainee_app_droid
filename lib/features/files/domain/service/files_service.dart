import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:trainee_app/core/error/failure.dart';
import 'package:trainee_app/features/common/message_body.dart';
import 'package:trainee_app/features/files/domain/file_uri_response.dart';
import 'package:trainee_app/features/files/domain/repository/files_repository.dart';

class FilesService {
  final FilesRepository _filesRepository;

  const FilesService(this._filesRepository);

  Future<Either<Failure, MessageBody>> uploadFile(
    File file,
    int sectionId,
    String viewStatus,
    String comment,
  ) =>
      _filesRepository.uploadFile(file, sectionId, viewStatus, comment);

  Future<Either<Failure, MessageBody>> renameFileName(
    int fileId,
    String newFileName,
  ) =>
      _filesRepository.renameFileName(fileId, newFileName);

  Future<Either<Failure, MessageBody>> deleteFileDetails(
    int fileId,
  ) =>
      _filesRepository.deleteFileDetails(fileId);

  Future<Either<Failure, List<FileUriResponse>>> getAllFilesAndNotifications(
    int userId,
  ) =>
      _filesRepository.getAllFilesAndNotifications(userId);
}
