import 'package:coin_watch/data/datasource/crypto_list_datasource.dart';
import 'package:coin_watch/data/repository/crypto_list_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

var locator = GetIt.instance;

Future<void> getItInit() async {
  locator.registerSingleton<Dio>(Dio(
    BaseOptions(baseUrl: 'https://api.coincap.io/v2/assets'),
  ));

  //Datasource
  locator
      .registerSingleton<ICryptoListDatasource>(CryptoListRemoteDatasource());

  //Repository
  locator.registerSingleton<ICryptoListRepository>(CryptoListRepository());
}
