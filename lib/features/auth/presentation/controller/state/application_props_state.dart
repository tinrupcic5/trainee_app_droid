import 'package:freezed_annotation/freezed_annotation.dart';

part 'application_props_state.freezed.dart';

@freezed
class ApplicationPropsState with _$ApplicationPropsState {
  const factory ApplicationPropsState.loading() = _Loading;

  const factory ApplicationPropsState.loaded({
    required String version,
  }) = _Loaded;

  const factory ApplicationPropsState.error(String message) = _Error;
}
