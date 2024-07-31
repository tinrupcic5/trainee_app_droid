import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:trainee_app/core/error/failure.dart';
import 'package:trainee_app/features/common/message_body.dart';
import 'package:trainee_app/features/files/data/api/profile_image_api.dart';
import 'package:trainee_app/features/files/domain/profile_image.dart';
import 'package:trainee_app/features/files/domain/repository/profile_image_repository.dart';

class ProfileImageRepositoryImpl implements ProfileImageRepository {
  final ProfileImageAPI _profileImageAPI;

  const ProfileImageRepositoryImpl(
    this._profileImageAPI,
  );

  @override
  Future<Either<Failure, ProfileImage>> getProfileImageBySchoolId(
      int schoolId) async {
    try {
      final response =
          await _profileImageAPI.getProfileImageBySchoolId(schoolId);
      return Right(response);
    } on DioException catch (_) {
      print(
          "getProfileImageBySchoolId response _profileImageAPI :  $_profileImageAPI");
      return const Left(Failure.unauthorized());
    }
  }

  @override
  Future<Either<Failure, MessageBody>> uploadFile(
      File file, int schoolId) async {
    try {
      final response = await _profileImageAPI.uploadFile(file, schoolId);
      return Right(response);
    } on DioException catch (_) {
      print("uploadFile response _profileImageAPI :  $_profileImageAPI");
      return const Left(Failure.unauthorized());
    }
  }
}
