import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trainee_app/core/di.dart';
import 'package:trainee_app/features/auth/presentation/controller/state/files_state.dart';
import 'package:trainee_app/features/files/domain/service/files_service.dart';

class FilesNotifier extends Notifier<FilesState> {
  late final FilesService _filesService;

  FilesNotifier() {}

  @override
  FilesState build() {
    _filesService = ref.watch(filesServiceProviderWithToken);
    return const FilesState.loading();
  }

  Future<void> getAllFilesAndNotifications(int userId) async {
    state = const FilesState.loading();

    try {
      final result = await _filesService.getAllFilesAndNotifications(userId);

      result.fold(
        (error) {
          state = FilesState.error(error.toString());
        },
        (files) {
          final notifications = files.toList()
            ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

          state = FilesState.loaded(
            notifications: notifications,
          );
        },
      );
    } catch (e) {
      state = FilesState.error('Failed to fetch files: $e');
    }
  }
}
