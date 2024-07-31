import 'package:trainee_app/features/files/domain/profile_image.dart';

class ProfileImageState {
  final ProfileImage? profileImage;
  final String? errorMessage;
  final bool isLoading;

  const ProfileImageState._({
    this.profileImage,
    this.errorMessage,
    this.isLoading = false,
  });

  const ProfileImageState.loading() : this._(isLoading: true);
  const ProfileImageState.loaded({
    required ProfileImage profileImage,
  }) : this._(
          profileImage: profileImage,
        );
  const ProfileImageState.error(String error) : this._(errorMessage: error);
}
