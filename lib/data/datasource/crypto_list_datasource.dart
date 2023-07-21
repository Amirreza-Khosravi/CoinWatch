import 'package:coin_watch/data/model/crypto.dart';
import 'package:coin_watch/di/di.dart';
import 'package:coin_watch/util/api_exception.dart';
import 'package:dio/dio.dart';

abstract class ICryptoListDatasource {
  Future<List<Crypto>> getCryptoList();
}

class CryptoListRemoteDatasource extends ICryptoListDatasource {
  final Dio _dio = locator.get();
  @override
  Future<List<Crypto>> getCryptoList() async {
    try {
      var response = await _dio.get('');
      return response.data['data']
          .map<Crypto>((jsonMapObject) => Crypto.framMapJson(jsonMapObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.statusMessage);
    }
  }
}
