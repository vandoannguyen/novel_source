import 'network.dart';
import 'share_pref.dart';

abstract class IRepository implements IApi, ISharePref {}

class RepositoryImpl implements IRepository {
  static RepositoryImpl _repositoryImpl;
  ISharePref _sharef;
  IApi _api;

  static RepositoryImpl getInstance() {
    if (_repositoryImpl == null) _repositoryImpl = new RepositoryImpl();
    return _repositoryImpl;
  }

  RepositoryImpl() {
    _sharef = SharePrefImpl();
    _api = ApiImpl();
  }

  @override
  Future getData() {
    return _api.getData();
  }

  @override
  Future<String> getDb() {
    // TODO: implement getDb
    throw UnimplementedError();
  }

  @override
  Future getSharePref() {
    return _sharef.getSharePref();
  }

  @override
  Future demoa() {
    // TODO: implement demoa
    throw UnimplementedError();
  }
}
