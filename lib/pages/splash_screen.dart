import 'dart:async';

import 'package:coin_watch/bloc/cryptolist_bloc.dart';
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
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(width: double.infinity),
            SizedBox(
              width: 150,
              height: 150,
              child: Image.asset('assets/images/logo.png'),
            ),
            const SpinKitSpinningLines(
              color: Colors.black,
              size: 80.0,
            )
          ],
        ),
      ),
    );
  }
}
