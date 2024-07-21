import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:trainee_app/core/di.dart';
import 'package:trainee_app/features/auth/data/api/model/user/userdetails/UserDetails.dart';
import 'package:trainee_app/features/auth/presentation/controller/state/training_state.dart';
import 'package:trainee_app/features/auth/presentation/util/SharedPrefsManager.dart';
import 'package:trainee_app/features/training/data/domain/service/training_service.dart';

class TrainingNotifier extends Notifier<TrainingState> {
  late final TrainingService _trainingService;
  late final SharedPrefsManager _sharedPrefsManager;

  TrainingNotifier() {
    _sharedPrefsManager = SharedPrefsManager();
    _attemptGettingAllTrainingForDate();
  }

  @override
  TrainingState build() {
    _trainingService = ref.watch(trainingServiceProviderWithToken);
    return const TrainingState.loading();
  }

  Future<void> _attemptGettingAllTrainingForDate() async {
    state = const TrainingState.loading();

    final DateTime selectedDay =
        DateTime.now(); // replace with actual selected date

    final userDetails =
        await _sharedPrefsManager.getUserDetailsFromLocalCache();

    if (userDetails == null) {
      state = TrainingState.error('User details not found.');
      return;
    }

    final result = await _trainingService.getAllTrainingForDate(
      userDetails.id!,
      userDetails.schoolDetails.id!,
      selectedDay.toString(),
    );

    result.fold(
      (error) {
        state = TrainingState.error(error.toString());
      },
      (trainings) {
        state = TrainingState.loaded(trainings: trainings);
      },
    );
  }
}
