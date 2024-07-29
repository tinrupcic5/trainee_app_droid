import 'package:dartz/dartz.dart';
import 'package:trainee_app/core/error/failure.dart';
import 'package:trainee_app/features/common/message_body.dart';
import 'package:trainee_app/features/locations/presentation/controller/card/calendar_items.dart';
import 'package:trainee_app/features/training/data/api/model/Training.dart';
import 'package:trainee_app/features/training/data/api/model/TrainingCalendarRequest.dart';
import 'package:trainee_app/features/training/data/api/model/TrainingRequest.dart';
import 'package:trainee_app/features/training/data/domain/repository/training_repository.dart';

class TrainingService {
  final TrainingRepository _trainingRepository;

  const TrainingService(this._trainingRepository);

  Future<Either<Exception, List<TrainingDetails>>> getAllTrainingForToday(
          int schoolDetailsId) =>
      _trainingRepository.getAllTrainingForToday(schoolDetailsId);

  Future<Either<Failure, List<TrainingDetails>>> getAllTrainingForDate(
          int userDetailsId, int schoolDetailsId, String date) =>
      _trainingRepository.getAllTrainingForDate(
          userDetailsId, schoolDetailsId, date);

  Future<Either<Exception, TrainingDetails>> getTrainingById(int trainingId,
          int userDetailsId, int schoolDetailsId, String date) =>
      _trainingRepository.getTrainingById(
          trainingId, userDetailsId, schoolDetailsId, date);

  Future<Either<Exception, MessageBody>> saveDatesUntilEndDateForEveryWeek(
          TrainingCalendarRequest request) =>
      _trainingRepository.saveDatesUntilEndDateForEveryWeek(request);

  Future<Either<Exception, MessageBody>> saveTrainingForTheDate(
          TrainingRequest request) =>
      _trainingRepository.saveTrainingForTheDate(request);

  Future<Either<Exception, MessageBody>> updateTraining(
          TrainingRequest request) =>
      _trainingRepository.updateTraining(request);

  gettingAllTrainingForDate(
      CalendarItemModel Function(dynamic training) param0) {}
}
