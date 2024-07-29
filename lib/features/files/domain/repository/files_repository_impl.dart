import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:trainee_app/core/error/failure.dart';
import 'package:trainee_app/features/common/message_body.dart';
import 'package:trainee_app/features/files/data/api/file_details_api.dart';
import 'package:trainee_app/features/files/domain/file_uri_response.dart';
import 'package:trainee_app/features/files/domain/repository/files_repository.dart';

class FilesRepositoryImpl implements FilesRepository {
  final FileDetailsAPI _fileDetailsAPI;

  const FilesRepositoryImpl(
    this._fileDetailsAPI,
  );

  @override
  Future<Either<Failure, MessageBody>> deleteFileDetails(int fileId) async {
    try {
      final response = await _fileDetailsAPI.deleteFileDetails(fileId);
      return Right(response);
    } on DioException catch (_) {
      print("deleteFileDetails response _fileDetailsAPI :  $_fileDetailsAPI");
      return const Left(Failure.unauthorized());
    }
  }

  @override
  Future<Either<Failure, List<FileUriResponse>>> getAllFilesAndNotifications(
      int userId) async {
    try {
      final response =
          await _fileDetailsAPI.getAllFilesAndNotifications(userId);
      return Right(response);
    } on DioException catch (_) {
      print(
          "getAllFilesAndNotifications response _fileDetailsAPI :  $_fileDetailsAPI");
      return const Left(Failure.unauthorized());
    }
  }

  @override
  Future<Either<Failure, MessageBody>> renameFileName(
      int fileId, String newFileName) async {
    try {
      final response =
          await _fileDetailsAPI.renameFileName(fileId, newFileName);
      return Right(response);
    } on DioException catch (_) {
      print("renameFileName response _fileDetailsAPI :  $_fileDetailsAPI");
      return const Left(Failure.unauthorized());
    }
  }

  @override
  Future<Either<Failure, MessageBody>> uploadFile(
      File file, int sectionId, String viewStatus, String comment) async {
    try {
      final response = await _fileDetailsAPI.uploadFile(
          file, sectionId, viewStatus, comment);
      return Right(response);
    } on DioException catch (_) {
      print("uploadFile response _fileDetailsAPI :  $_fileDetailsAPI");
      return const Left(Failure.unauthorized());
    }
  }
}
