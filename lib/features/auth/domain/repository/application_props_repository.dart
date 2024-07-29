abstract interface class ApplicationPropsRepository {
  Future<String> getVersion();
  Future<String> getName();
}
