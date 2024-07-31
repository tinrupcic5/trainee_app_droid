import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:trainee_app/core/error/failure.dart';
import 'package:trainee_app/features/common/message_body.dart';
import 'package:trainee_app/features/files/domain/profile_image.dart';
import 'package:trainee_app/features/files/domain/repository/profile_image_repository.dart';

class ProfileImageService {
  final ProfileImageRepository _profileImageRepository;

  const ProfileImageService(this._profileImageRepository);

  Future<Either<Failure, MessageBody>> uploadFile(
    File file,
    int schoolId,
  ) =>
      _profileImageRepository.uploadFile(file, schoolId);

  Future<Either<Failure, ProfileImage>> getProfileImageBySchoolId(
    int schoolId,
  ) =>
      _profileImageRepository.getProfileImageBySchoolId(schoolId);
}
