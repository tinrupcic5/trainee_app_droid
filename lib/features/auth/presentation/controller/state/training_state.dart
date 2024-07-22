import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trainee_app/features/common/MessageBody.dart';
import 'package:trainee_app/features/locations/presentation/controller/card/calendar_items.dart';
import 'package:trainee_app/features/training/data/api/model/Training.dart';

part 'training_state.freezed.dart';

@freezed
class TrainingState with _$TrainingState {
  const factory TrainingState.loading() = _Loading;

  const factory TrainingState.loaded({
    required List<TrainingDetails> trainings,
  }) = _Loaded;

  const factory TrainingState.error(String message) = _Error;
}
