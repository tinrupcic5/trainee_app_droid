import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:trainee_app/core/error/failure.dart';
import 'package:trainee_app/features/common/message_body.dart';
import 'package:trainee_app/features/training/data/api/model/Training.dart';
import 'package:trainee_app/features/training/data/api/model/TrainingCalendarRequest.dart';
import 'package:trainee_app/features/training/data/api/model/TrainingRequest.dart';
import 'package:trainee_app/features/training/data/api/training_api.dart';
import 'package:trainee_app/features/training/data/domain/repository/training_repository.dart';

class TrainingRepositoryImpl implements TrainingRepository {
  final TrainingAPI _trainingApi;

  const TrainingRepositoryImpl(
    this._trainingApi,
  );

  @override
  Future<Either<Failure, List<TrainingDetails>>> getAllTrainingForDate(
      int userDetailsId, int schoolDetailsId, String date) async {
    try {
      final response = await _trainingApi.getAllTrainingForDate(
          userDetailsId, schoolDetailsId, date);
      return Right(response);
    } on DioException catch (_) {
      print("response trainingApi :  $_trainingApi");
      return const Left(Failure.unauthorized());
    }
  }

  @override
  Future<Either<Exception, List<TrainingDetails>>> getAllTrainingForToday(
      int schoolDetailsId) {
    // TODO: implement getAllTrainingForToday
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, TrainingDetails>> getTrainingById(
      int trainingId, int userDetailsId, int schoolDetailsId, String date) {
    // TODO: implement getTrainingById
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, MessageBody>> saveDatesUntilEndDateForEveryWeek(
      TrainingCalendarRequest request) {
    // TODO: implement saveDatesUntilEndDateForEveryWeek
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, MessageBody>> saveTrainingForTheDate(
      TrainingRequest request) {
    // TODO: implement saveTrainingForTheDate
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, MessageBody>> updateTraining(
      TrainingRequest request) {
    // TODO: implement updateTraining
    throw UnimplementedError();
  }
}
