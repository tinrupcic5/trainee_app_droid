import 'package:trainee_app/features/files/domain/file_uri_response.dart';

class FilesState {
  final List<FileUriResponse>? notifications;
  final String? errorMessage;
  final bool isLoading;

  const FilesState._({
    this.notifications,
    this.errorMessage,
    this.isLoading = false,
  });

  const FilesState.loading() : this._(isLoading: true);
  const FilesState.loaded({
    required List<FileUriResponse> notifications,
  }) : this._(
          notifications: notifications,
        );
  const FilesState.error(String error) : this._(errorMessage: error);
}
