import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:trainee_app/core/error/failure.dart';
import 'package:trainee_app/features/common/message_body.dart';
import 'package:trainee_app/features/files/domain/profile_image.dart';

abstract interface class ProfileImageRepository {
  Future<Either<Failure, MessageBody>> uploadFile(
    File file,
    int schoolId,
  );

  Future<Either<Failure, ProfileImage>> getProfileImageBySchoolId(
    int schoolId,
  );
}
