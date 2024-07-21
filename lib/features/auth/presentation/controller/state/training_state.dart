import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trainee_app/features/common/MessageBody.dart';
import 'package:trainee_app/features/training/data/api/model/Training.dart';

part 'training_state.freezed.dart';

@freezed
class TrainingState with _$TrainingState {
  const factory TrainingState.initial() = _Initial;

  const factory TrainingState.loading() = _Loading;

  const factory TrainingState.loaded({
    required List<TrainingDetails> trainings,
  }) = _Loaded;

  const factory TrainingState.error(String message) = _Error;

  const factory TrainingState.saving() = _Saving;

  const factory TrainingState.saved({
    required MessageBody messageBody,
  }) = _Saved;

  const factory TrainingState.updating() = _Updating;

  const factory TrainingState.updated({
    required MessageBody messageBody,
  }) = _Updated;
}
