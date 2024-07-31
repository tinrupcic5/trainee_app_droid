import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trainee_app/core/di.dart';
import 'package:trainee_app/features/auth/presentation/controller/state/profile_image_state.dart';
import 'package:trainee_app/features/files/domain/profile_image.dart';
import 'package:trainee_app/features/files/domain/service/profile_image_service.dart';

class ProfileImageNotifier extends Notifier<ProfileImageState> {
  late final ProfileImageService _profileImageService;

  @override
  ProfileImageState build() {
    _profileImageService = ref.watch(profileImageServiceProviderWithToken);
    return const ProfileImageState.loading();
  }

  Future<ProfileImage?> getProfileImageBySchoolId(int schoolId) async {
    state = const ProfileImageState.loading();

    try {
      final result =
          await _profileImageService.getProfileImageBySchoolId(schoolId);
      print("getProfileImageBySchoolId: $result");

      return result.fold(
        (error) {
          state = ProfileImageState.error(error.toString());
          return null; // Return null if there was an error
        },
        (profileImage) {
          state = ProfileImageState.loaded(
            profileImage: profileImage,
          );
          return profileImage; // Return the fetched profile image
        },
      );
    } catch (e) {
      state = ProfileImageState.error('Failed to fetch files: $e');
      return null; // Return null in case of exception
    }
  }
}
