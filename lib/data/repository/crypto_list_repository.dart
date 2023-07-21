import 'package:coin_watch/data/datasource/crypto_list_datasource.dart';
import 'package:coin_watch/data/model/crypto.dart';
import 'package:coin_watch/di/di.dart';
import 'package:coin_watch/util/api_exception.dart';
import 'package:dartz/dartz.dart';

abstract class ICryptoListRepository {
  Future<Either<String, List<Crypto>>> getCryptoList();
}

class CryptoListRepository extends ICryptoListRepository {
  final ICryptoListDatasource _datasource = locator.get();
  @override
  Future<Either<String, List<Crypto>>> getCryptoList() async {
    try {
      var response = await _datasource.getCryptoList();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }
}
