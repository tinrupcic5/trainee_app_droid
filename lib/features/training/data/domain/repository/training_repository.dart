import 'package:dartz/dartz.dart';
import 'package:trainee_app/features/common/MessageBody.dart';
import 'package:trainee_app/features/training/data/api/model/Training.dart';
import 'package:trainee_app/features/training/data/api/model/TrainingCalendarRequest.dart';
import 'package:trainee_app/features/training/data/api/model/TrainingRequest.dart';

abstract interface class TrainingRepository {
  Future<Either<Exception, List<TrainingDetails>>> getAllTrainingForToday(
      int schoolDetailsId);
  Future<Either<Exception, List<TrainingDetails>>> getAllTrainingForDate(
      int userDetailsId, int schoolDetailsId, String date);
  Future<Either<Exception, TrainingDetails>> getTrainingById(
      int trainingId, int userDetailsId, int schoolDetailsId, String date);
  Future<Either<Exception, MessageBody>> saveDatesUntilEndDateForEveryWeek(
      TrainingCalendarRequest request);
  Future<Either<Exception, MessageBody>> saveTrainingForTheDate(
      TrainingRequest request);
  Future<Either<Exception, MessageBody>> updateTraining(
      TrainingRequest request);
}
