import 'package:trainee_app/features/auth/data/api/application_props_api.dart';
import 'package:trainee_app/features/auth/domain/repository/application_props_repository.dart';

class ApplicationPropsRepositoryImpl implements ApplicationPropsRepository {
  final ApplicationPropsAPI _applicationPropsAPI;

  const ApplicationPropsRepositoryImpl(
    this._applicationPropsAPI,
  );

  @override
  Future<String> getVersion() async {
    final response = await _applicationPropsAPI.getVersion();
    return response;
  }

  @override
  Future<String> getName() async {
    final response = await _applicationPropsAPI.getName();
    return response;
  }
}
