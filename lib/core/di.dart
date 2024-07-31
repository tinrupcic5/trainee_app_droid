import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trainee_app/features/auth/data/api/TokenInterceptor.dart';
import 'package:trainee_app/features/auth/data/api/auth_api.dart';
import 'package:trainee_app/features/auth/data/api/application_props_api.dart';
import 'package:trainee_app/features/auth/domain/repository/ApplicationPropsRepositoryImpl.dart';
import 'package:trainee_app/features/auth/domain/repository/user_repository.dart';
import 'package:trainee_app/features/auth/domain/repository/application_props_repository.dart';
import 'package:trainee_app/features/auth/domain/service/UserService.dart';
import 'package:trainee_app/features/auth/domain/repository/UserRepositoryImpl.dart';
import 'package:trainee_app/features/auth/domain/service/ApplicationPropsService.dart';
import 'package:trainee_app/features/auth/presentation/controller/auth_notifier.dart';
import 'package:trainee_app/features/auth/presentation/controller/files_notifier.dart';
import 'package:trainee_app/features/auth/presentation/controller/logout_notifier.dart';
import 'package:trainee_app/features/auth/presentation/controller/profile_image_notifier.dart';
import 'package:trainee_app/features/auth/presentation/controller/state/auth_state.dart';
import 'package:trainee_app/features/auth/presentation/controller/state/files_state.dart';
import 'package:trainee_app/features/auth/presentation/controller/state/logout_state.dart';
import 'package:trainee_app/features/auth/presentation/controller/state/profile_image_state.dart';
import 'package:trainee_app/features/auth/presentation/controller/state/training_state.dart';
import 'package:trainee_app/features/auth/presentation/controller/state/application_props_state.dart';
import 'package:trainee_app/features/auth/presentation/controller/training_notifier.dart';
import 'package:trainee_app/features/auth/presentation/controller/application_props_notifier.dart';
import 'package:trainee_app/features/files/data/api/file_details_api.dart';
import 'package:trainee_app/features/files/data/api/profile_image_api.dart';
import 'package:trainee_app/features/files/domain/repository/files_repository.dart';
import 'package:trainee_app/features/files/domain/repository/files_repository_impl.dart';
import 'package:trainee_app/features/files/domain/repository/profile_image_repository.dart';
import 'package:trainee_app/features/files/domain/repository/profile_image_repository_impl.dart';
import 'package:trainee_app/features/files/domain/service/files_service.dart';
import 'package:trainee_app/features/files/domain/service/profile_image_service.dart';
import 'package:trainee_app/features/training/data/api/training_api.dart';
import 'package:trainee_app/features/training/data/domain/repository/training_repository.dart';
import 'package:trainee_app/features/training/data/domain/repository/training_repository_impl.dart';
import 'package:trainee_app/features/training/data/domain/service/training_service.dart';

// // // ***************** EXTERNAL LIBRARIES ***************** //

final dioProviderWithToken =
    Provider<Dio>((ref) => createDioWithTokenInterceptor());
final dioProviderWithoutToken =
    Provider<Dio>((ref) => createDioWithoutTokenInterceptor());
// final dioProvider = Provider<Dio>((ref) => dioProviderWithToken);

// // // ***************** CONVERTERS ***************** //

// // // ***************** DATASOURCE ***************** //

final trainingApiProviderWithToken = Provider<TrainingAPI>(
  (ref) => TrainingAPI(ref.watch(dioProviderWithToken)),
);
final authApiProviderWithToken = Provider<AuthAPI>(
  (ref) => AuthAPI(ref.watch(dioProviderWithToken)),
);
final authApiProvider = Provider<AuthAPI>(
  (ref) => AuthAPI(ref.watch(dioProviderWithoutToken)),
);
final filesApiProvider = Provider<FileDetailsAPI>(
  (ref) => FileDetailsAPI(ref.watch(dioProviderWithToken)),
);
final versionApiProvider = Provider<ApplicationPropsAPI>(
  (ref) => ApplicationPropsAPI(ref.watch(dioProviderWithoutToken)),
);
final profileImageApiProvider = Provider<ProfileImageAPI>(
  (ref) => ProfileImageAPI(ref.watch(dioProviderWithToken)),
);

// // // ***************** REPOSITORY ***************** //
final userRepositoryProvider = Provider<UserRepository>(
  (ref) => UserRepositoryImpl(ref.watch(authApiProvider)),
);
final trainingRepositoryProviderWithToken = Provider<TrainingRepository>(
  (ref) => TrainingRepositoryImpl(ref.watch(trainingApiProviderWithToken)),
);
final userRepositoryProviderWithToken = Provider<UserRepository>(
  (ref) => UserRepositoryImpl(ref.watch(authApiProviderWithToken)),
);
final filesRepositoryProviderWithToken = Provider<FilesRepository>(
  (ref) => FilesRepositoryImpl(ref.watch(filesApiProvider)),
);
final versionRepositoryProviderWithToken = Provider<ApplicationPropsRepository>(
  (ref) => ApplicationPropsRepositoryImpl(ref.watch(versionApiProvider)),
);
final profileImageRepositoryProviderWithToken =
    Provider<ProfileImageRepository>(
  (ref) => ProfileImageRepositoryImpl(ref.watch(profileImageApiProvider)),
);

// // // // // ***************** USE CASE SERVICES***************** //

final userServiceProvider = Provider<UserService>(
  (ref) => UserService(ref.watch(userRepositoryProvider)),
);
final userServiceProviderWithToken = Provider<UserService>(
  (ref) => UserService(ref.watch(userRepositoryProviderWithToken)),
);
final trainingServiceProviderWithToken = Provider<TrainingService>(
  (ref) => TrainingService(ref.watch(trainingRepositoryProviderWithToken)),
);
final filesServiceProviderWithToken = Provider<FilesService>(
  (ref) => FilesService(ref.watch(filesRepositoryProviderWithToken)),
);
final versionServiceProviderWithToken = Provider<ApplicationPropsService>(
  (ref) =>
      ApplicationPropsService(ref.watch(versionRepositoryProviderWithToken)),
);
final profileImageServiceProviderWithToken = Provider<ProfileImageService>(
  (ref) =>
      ProfileImageService(ref.watch(profileImageRepositoryProviderWithToken)),
);

// ***************** RIVERPOD ***************** //
final authNotifierProvider = NotifierProvider<AuthNotifier, AuthState>(
  () => AuthNotifier(),
);

final logoutNotifierProvider = NotifierProvider<LogoutNotifier, LogoutState>(
  () => LogoutNotifier(),
);
final trainingListProvider = NotifierProvider<TrainingNotifier, TrainingState>(
  () => TrainingNotifier(),
);
final fileTransferNotifierProvider =
    NotifierProvider<FilesNotifier, FilesState>(
  () => FilesNotifier(),
);
final versionNotifierProvider =
    NotifierProvider<ApplicationPropsNotifier, ApplicationPropsState>(
  () => ApplicationPropsNotifier(),
);
final profileImageNotifierProvider =
    NotifierProvider<ProfileImageNotifier, ProfileImageState>(
  () => ProfileImageNotifier(),
);
