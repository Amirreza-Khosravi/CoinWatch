import 'package:coin_watch/bloc/cryptolist_bloc.dart';
import 'package:coin_watch/bloc/cryptolist_event.dart';
import 'package:coin_watch/bloc/cryptolist_state.dart';
import 'package:coin_watch/constants/constants.dart';
import 'package:coin_watch/data/model/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinListScreen extends StatefulWidget {
  const CoinListScreen({super.key});

  @override
  State<CoinListScreen> createState() => _CoinListScreenState();
}

class _CoinListScreenState extends State<CoinListScreen> {
  @override
  void initState() {
    BlocProvider.of<CryptoListBloc>(context).add(GetCryptoListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        title: const Text('CoinWatch'),
        centerTitle: true,
        backgroundColor: blackColor,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: BlocBuilder<CryptoListBloc, CryptoListState>(
        builder: (context, state) {
          if (state is CryptoListLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CryptoListResponseState) {
            return state.cryptolist.fold((l) {
              return Text(l);
            }, (cryptoList) {
              return RefreshIndicator(
                  onRefresh: () async {
                    BlocProvider.of<CryptoListBloc>(context)
                        .add(GetCryptoListEvent());
                  },
                  child: GetBody(cryptoList));
            });
          }

          return const Text('error');
        },
      ),
    );
  }
}

class GetBody extends StatelessWidget {
  final List<Crypto> cryptoList;
  const GetBody(
    this.cryptoList, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cryptoList.length,
      itemBuilder: ((context, index) {
        return ListTile(
          title: Text(
            cryptoList[index].name,
            style: const TextStyle(color: greenColor),
          ),
          subtitle: Text(
            cryptoList[index].symbol,
            style: const TextStyle(color: greyColor),
          ),
          leading: SizedBox(
            width: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  cryptoList[index].rank.toString(),
                  style: const TextStyle(
                      color: greyColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 15),
                SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset('assets/images/coin.png'))
              ],
            ),
          ),
          trailing: SizedBox(
            width: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '\$ ${cryptoList[index].priceUsd.toStringAsFixed(2)}',
                      style: const TextStyle(color: greyColor, fontSize: 16),
                    ),
                    Text(
                      '${cryptoList[index].changePercent24hr.toStringAsFixed(2)} %',
                      style: TextStyle(
                          color: getColorChangPercent(
                              cryptoList[index].changePercent24hr),
                          fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                getIconChangePercent(cryptoList[index].changePercent24hr)
              ],
            ),
          ),
        );
      }),
    );
  }
}

Widget getIconChangePercent(double changePercent) {
  return changePercent <= 0
      ? const Icon(
          Icons.trending_down,
          color: redColor,
        )
      : const Icon(
          Icons.trending_up,
          color: greenColor,
        );
}

Color getColorChangPercent(double changePercent) {
  return changePercent <= 0 ? redColor : greenColor;
}
