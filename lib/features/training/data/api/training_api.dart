import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:trainee_app/features/common/message_body.dart';
import 'package:trainee_app/features/training/data/api/model/Training.dart';
import 'package:trainee_app/features/auth/presentation/util/AppStrings.dart';
import 'package:trainee_app/features/training/data/api/model/TrainingCalendarRequest.dart';
import 'package:trainee_app/features/training/data/api/model/TrainingRequest.dart';

part 'training_api.g.dart';

@RestApi(baseUrl: AppStrings.baseUrl)
abstract class TrainingAPI {
  factory TrainingAPI(Dio dio, {String baseUrl}) = _TrainingAPI;

  @GET('/training/{schoolDetailsId}')
  Future<List<TrainingDetails>> getAllTrainingForToday(
      @Path('schoolDetailsId') int schoolDetailsId);

  @GET('/training/{userDetailsId}/{schoolDetailsId}/{date}')
  Future<List<TrainingDetails>> getAllTrainingForDate(
      @Path('userDetailsId') int userDetailsId,
      @Path('schoolDetailsId') int schoolDetailsId,
      @Path('date') String date);

  @GET('/training/{trainingId}/{userDetailsId}/{schoolDetailsId}/{date}')
  Future<TrainingDetails> getTrainingById(
      @Path('trainingId') int trainingId,
      @Path('userDetailsId') int userDetailsId,
      @Path('schoolDetailsId') int schoolDetailsId,
      @Path('date') String date);

  @PUT('/training')
  Future<MessageBody> saveDatesUntilEndDateForEveryWeek(
      @Body() TrainingCalendarRequest trainingCalendarRequest);

  @POST('/training')
  Future<MessageBody> saveTrainingForTheDate(
      @Body() TrainingRequest trainingRequest);

  @PUT('/training/update')
  Future<MessageBody> updateTraining(@Body() TrainingRequest trainingRequest);
}
