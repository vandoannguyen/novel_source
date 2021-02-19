import 'package:init_app/data/network/NovalModel.dart';

import 'network/network.dart';
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

  @override
  Future login({email, timestamep}) {
    // TODO: implement login
    return _api.login(email: email, timestamep: timestamep);
  }

  @override
  Future<String> getLanguage() {
    // TODO: implement getLanguage
    return _sharef.getLanguage();
  }

  @override
  Future<void> setLanguage(language) {
    // TODO: implement setLanguage
    return _sharef.setLanguage(language);
  }

  @override
  Future<List<NovalModel>> getMyBooks({String timestamp}) {
    // TODO: implement getMyBooks
    return _api.getMyBooks(timestamp: timestamp);
  }

  @override
  Future createMyBooks({String timestamp, data}) {
    // TODO: implement createMyBooks
    return _api.createMyBooks(timestamp: timestamp, data: data);
  }

  @override
  Future<String> getMail() {
    // TODO: implement getMail
    return _sharef.getMail();
  }

  @override
  Future<void> setMail(email) {
    // TODO: implement setMail
    return _sharef.setMail(email);
  }

  @override
  Future readNoval({id}) {
    // TODO: implement readNoval
    return _api.readNoval(id: id);
  }

  @override
  Future chapByNoval({id, limit, page}) {
    // TODO: implement chapByNoval
    return _api.chapByNoval(id: id, limit: limit, page: page);
  }
}
