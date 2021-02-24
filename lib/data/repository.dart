import 'package:init_app/data/network/BannerNovelModel.dart';
import 'package:init_app/data/network/NovalModel.dart';

import 'network/NovalChapterModel.dart';
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
  Future<List<NovelModel>> getMyBooks({String timestamp}) {
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
  Future<List<NovalChapterModel>> chapByNoval({id, limit, page}) {
    // TODO: implement chapByNoval
    return _api.chapByNoval(id: id, limit: limit, page: page);
  }

  @override
  Future addBookIntoMyBooks({idBook}) {
    // TODO: implement addBookIntoMyBooks
    return _api.addBookIntoMyBooks(idBook: idBook);
  }

  @override
  Future getComments({idBook, page, limit, bool increase = true}) {
    // TODO: implement getComments
    return _api.getComments(
        idBook: idBook, page: page, limit: limit, increase: increase);
  }

  @override
  Future<NovelModel> getNovelDetail({idBook}) {
    // TODO: implement getNovelDetail
    return _api.getNovelDetail(idBook: idBook);
  }

  @override
  Future<List<NovelModel>> getNovelNewest(
      {language, page, limitPerPage, bool increase = true}) {
    // TODO: implement getNovelNewest
    return _api.getNovelNewest(
        language: language,
        page: page,
        limitPerPage: limitPerPage,
        increase: increase);
  }

  @override
  Future getUserProfile() {
    // TODO: implement getUserProfile
    return _api.getUserProfile();
  }

  @override
  Future historyBuy({page, limit, bool increase = true}) {
    // TODO: implement historyBuy
    return _api.historyBuy(page: page, limit: limit, increase: increase);
  }

  @override
  Future<String> loginWithFaceBook({access_token}) {
    // TODO: implement loginWithFaceBook
    return _api.loginWithFaceBook(access_token: access_token);
  }

  @override
  Future loginWithGoogle({access_token}) {
    // TODO: implement loginWithGoogle
    return _api.loginWithGoogle(access_token: access_token);
  }

  @override
  Future postComment({idBook, contentComment}) {
    // TODO: implement postComment
    return _api.postComment(idBook: idBook, contentComment: contentComment);
  }

  @override
  Future removeBookFromMyBook({idBook}) {
    // TODO: implement removeBookFromMyBook
    return _api.removeBookFromMyBook(idBook: idBook);
  }

  @override
  Future<List<BannerNovelModel>> getBanner({language}) {
    // TODO: implement getBanner
    return _api.getBanner(language: language);
  }

  @override
  Future<List<NovelModel>> getNovelHotest(
      {language, page, limitPerPage, bool increase = true}) {
    // TODO: implement getNovelHotest
    return _api.getNovelHotest(
        language: language,
        page: page,
        limitPerPage: limitPerPage,
        increase: increase);
  }

  @override
  Future<String> getLogedData() {
    // TODO: implement getLogedData
    return _sharef.getLogedData();
  }

  @override
  Future<void> setLogedData({type}) {
    // TODO: implement setLogedData
    return _sharef.setLogedData(type: type);
  }

  @override
  Future<String> getCheckin() {
    return _sharef.getCheckin();
  }

  @override
  Future<void> setCheckin(day) {
    return _sharef.setCheckin(day);
  }

  @override
  Future<String> getDatetime() {
    return _sharef.getDatetime();
  }

  @override
  Future<void> setDatetime(date) {
    return _sharef.setDatetime(date);
  }
}
