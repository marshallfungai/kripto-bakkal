import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart';

class WalletScreen extends StatefulWidget {
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Crypto Wallet'),
      ),
    );
  }
}
