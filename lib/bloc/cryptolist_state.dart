import 'package:coin_watch/data/model/crypto.dart';
import 'package:dartz/dartz.dart';

abstract class CryptoListState {}

class CryptoListInitState extends CryptoListState {}

class CryptoListLoadingState extends CryptoListState {}

class CryptoListResponseState extends CryptoListState {
  Either<String, List<Crypto>> cryptolist;
  CryptoListResponseState(this.cryptolist);
}
