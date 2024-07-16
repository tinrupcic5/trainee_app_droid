// import 'package:dio/dio.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:trainee_app/features/auth/presentation/controller/auth_notifier.dart';
// import 'package:trainee_app/features/auth/presentation/controller/state/auth_state.dart';

// // // ***************** EXTERNAL LIBRARIES ***************** //
// // final firebaseAuthProvider =
// //     Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

// // final dioProvider = Provider<Dio>((ref) => Dio());

// // // ***************** CONVERTERS ***************** //
// // final sightDtoToEntityConverterProvider = Provider<SightDtoToEntityConverter>(
// //   (ref) => SightDtoToEntityConverter(),
// // );

// // final sightEntityToDtoConverterProvider = Provider<SightEntityToDtoConverter>(
// //   (ref) => SightEntityToDtoConverter(),
// // );

// // // ***************** DATASOURCE ***************** //
// // final userApiProvider = Provider<UserApi>(
// //   (ref) => UserApi(ref.read(firebaseAuthProvider)),
// // );

// // final sightApiProvider = Provider<SightAPI>(
// //   (ref) => SightAPI(ref.watch(dioProvider)),
// // );

// // final hiveDatabaseManagerProvider = Provider<HiveDatabaseManager>(
// //   (ref) => HiveDatabaseManager(),
// // );

// // ***************** REPOSITORY ***************** //
// // final userRepositoryProvider = Provider<UserRepository>(
// //   (ref) => UserRepositoryImpl(ref.watch(userApiProvider)),
// // );

// // final sightRepositoryProvider = Provider<SightRepository>(
// //   (ref) => SightRepositoryImpl(
// //     ref.watch(sightApiProvider),
// //     ref.watch(hiveDatabaseManagerProvider),
// //     ref.watch(sightDtoToEntityConverterProvider),
// //   ),
// // );

// // // // ***************** USE CASE ***************** //
// // final authUseCasesProvider = Provider<AuthUseCases>(
// //   (ref) => AuthUseCases(ref.watch(userRepositoryProvider)),
// // );

// // final sightUseCasesProvider = Provider<SightUseCases>(
// //   (ref) => SightUseCases(ref.watch(sightRepositoryProvider)),
// // );

// // ***************** RIVERPOD ***************** //
// // final authNotifier = NotifierProvider<AuthNotifier, AuthState>(
// //   () => AuthNotifier(),
// // );

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
