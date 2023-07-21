import 'package:coin_watch/bloc/cryptolist_event.dart';
import 'package:coin_watch/bloc/cryptolist_state.dart';
import 'package:coin_watch/data/repository/crypto_list_repository.dart';
import 'package:coin_watch/di/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  final ICryptoListRepository _repository = locator.get();
  CryptoListBloc() : super(CryptoListInitState()) {
    on<GetCryptoListEvent>((event, emit) async {
      emit(CryptoListLoadingState());
      var response = await _repository.getCryptoList();
      emit(CryptoListResponseState(response));
    });
  }
}
