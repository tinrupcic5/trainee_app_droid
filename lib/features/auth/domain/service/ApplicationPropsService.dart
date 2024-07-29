import 'package:trainee_app/features/auth/domain/repository/application_props_repository.dart';

class ApplicationPropsService {
  final ApplicationPropsRepository _versionRepository;

  const ApplicationPropsService(this._versionRepository);

  Future<String> getVersion() => _versionRepository.getVersion();
  Future<String> getName() => _versionRepository.getName();
}
