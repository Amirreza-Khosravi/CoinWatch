import 'dart:async';

import 'package:coin_watch/bloc/cryptolist_bloc.dart';
import 'package:coin_watch/constants/constants.dart';
import 'package:coin_watch/pages/coin_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BlocProvider(
                    create: (context) => CryptoListBloc(),
                    child: const CoinListScreen(),
                  )));
    });
    return Scaffold(
      backgroundColor: blackColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(width: double.infinity),
            const SpinKitDancingSquare(
              color: Color.fromARGB(255, 4, 226, 123),
              size: 170.0,
            ),
            const Text(
              'Coin Watch',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
