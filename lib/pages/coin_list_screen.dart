import 'package:coin_watch/constants/constants.dart';
import 'package:flutter/material.dart';

class CoinListScreen extends StatelessWidget {
  const CoinListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: blackColor,
      appBar: AppBar(
        title: const Text('CoinWatch'),
        centerTitle: true,
        backgroundColor: blackColor,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: ((context, index) {
          return const ListTile(
            title: Text('bitcoin'),
            subtitle: Text('btc'),
            leading: SizedBox(
              width: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('1'),
                  SizedBox(width: 10),
                  Icon(Icons.currency_bitcoin),
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
                      Text('\$12500'),
                      Text('-1.5'),
                    ],
                  ),
                  SizedBox(width: 20),
                  Icon(Icons.trending_up),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
