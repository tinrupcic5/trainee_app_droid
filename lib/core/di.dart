import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trainee_app/features/auth/data/api/TokenInterceptor.dart';
import 'package:trainee_app/features/auth/data/api/auth_api.dart';
import 'package:trainee_app/features/auth/domain/repository/user_repository.dart';
import 'package:trainee_app/features/auth/domain/service/UserService.dart';
import 'package:trainee_app/features/auth/domain/repository/UserRepositoryImpl.dart';
import 'package:trainee_app/features/auth/presentation/controller/auth_notifier.dart';
import 'package:trainee_app/features/auth/presentation/controller/logout_notifier.dart';
import 'package:trainee_app/features/auth/presentation/controller/state/auth_state.dart';
import 'package:trainee_app/features/auth/presentation/controller/state/logout_state.dart';
import 'package:trainee_app/features/auth/presentation/controller/state/training_state.dart';
import 'package:trainee_app/features/auth/presentation/controller/training_notifier.dart';
import 'package:trainee_app/features/training/data/api/training_api.dart';
import 'package:trainee_app/features/training/data/domain/repository/training_repository.dart';
import 'package:trainee_app/features/training/data/domain/repository/training_repository_impl.dart';
import 'package:trainee_app/features/training/data/domain/service/training_service.dart';

// // // ***************** EXTERNAL LIBRARIES ***************** //
// // final firebaseAuthProvider =
// //     Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final dioProviderWithToken =
    Provider<Dio>((ref) => createDioWithTokenInterceptor());
final dioProviderWithoutToken =
    Provider<Dio>((ref) => createDioWithoutTokenInterceptor());
// final dioProvider = Provider<Dio>((ref) => dioProviderWithToken);

// // // ***************** CONVERTERS ***************** //
// // final sightDtoToEntityConverterProvider = Provider<SightDtoToEntityConverter>(
// //   (ref) => SightDtoToEntityConverter(),
// // );

// // final sightEntityToDtoConverterProvider = Provider<SightEntityToDtoConverter>(
// //   (ref) => SightEntityToDtoConverter(),
// // );

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

// // final hiveDatabaseManagerProvider = Provider<HiveDatabaseManager>(
// //   (ref) => HiveDatabaseManager(),
// // );

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

// // final sightRepositoryProvider = Provider<SightRepository>(
// //   (ref) => SightRepositoryImpl(
// //     ref.watch(sightApiProvider),
// //     ref.watch(hiveDatabaseManagerProvider),
// //     ref.watch(sightDtoToEntityConverterProvider),
// //   ),
// // );

// // // // // ***************** USE CASE SERVICES***************** //
// final authUseCasesProvider = Provider<UserService>(
//   (ref) => UserService(ref.watch(userRepositoryProvider)),
// );

final userServiceProvider = Provider<UserService>(
  (ref) => UserService(ref.watch(userRepositoryProvider)),
);
final userServiceProviderWithToken = Provider<UserService>(
  (ref) => UserService(ref.watch(userRepositoryProviderWithToken)),
);
final trainingServiceProviderWithToken = Provider<TrainingService>(
  (ref) => TrainingService(ref.watch(trainingRepositoryProviderWithToken)),
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


// // final resetPasswordNotifier =
// //     NotifierProvider<ResetPasswordNotifier, AsyncValue<bool>>(
// //   () => ResetPasswordNotifier(),
// // );

// // final sightListProvider = NotifierProvider<SightListNotifier, ListState>(
// //   () => SightListNotifier(),
// // );

// // final favoriteListProvider =
// //     NotifierProvider<FavoriteListNotifier, FavoriteListState>(
// //   () => FavoriteListNotifier(),
// // );
