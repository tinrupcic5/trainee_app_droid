import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trainee_app/core/di.dart';
import 'package:trainee_app/features/auth/domain/service/ApplicationPropsService.dart';
import 'package:trainee_app/features/auth/presentation/controller/state/application_props_state.dart';

class ApplicationPropsNotifier extends Notifier<ApplicationPropsState> {
  late final ApplicationPropsService _userService;

  @override
  ApplicationPropsState build() {
    _userService = ref.watch(versionServiceProviderWithToken);
    return const ApplicationPropsState.loading();
  }

  Future<String> getVersion() async => await _userService.getVersion();
  Future<String> getName() async => await _userService.getName();
}
