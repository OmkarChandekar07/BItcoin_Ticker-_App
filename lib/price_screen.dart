
import 'dart:core';
import 'dart:core' hide String;
import 'package:bitcoin_ticker_app/coin_data.dart';
import 'package:flutter/material.dart';

// 97353bca-c7d4-4c06-ac8d-a112cfe82494;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
 String bitcoinValueInUSD = '?';
 String ethcoinValueUSD='?';

  void getData() async {
    try {
      double data = await CoinData().getCOinData(selectedCOin);
      setState(() {
        bitcoinValueInUSD = data.toStringAsFixed(0);
        
      });
    } catch (e) {
      print(e);
    }
  }
  void getEtcData() async {
    try {
      double data = await CoinData().getCOinData(selectedCOin);
      setState(() {
        
        ethcoinValueUSD=data.toStringAsFixed(0);
      });
    } catch (e) {
      print(e);
    }
  }
  @override
  void initState() {
    super.initState();
    getData();
    getEtcData();
    
  }

  
     String selectedCOin ='AUD';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text( '1 BTC = $bitcoinValueInUSD $selectedCOin',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
           SizedBox(
            height: 100,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Image.asset('assets/image/bitcoin.png'),
          ),
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              child:
              DropdownButton(
                value: selectedCOin,
              items:[
                for(int i=0;i<currenciesList.length;i++)
                DropdownMenuItem(
                child: Text(currenciesList[i]),
                value:currenciesList[i])
              ],
              onChanged: (valaue){
               setState(() {
                  selectedCOin = valaue.toString();
                  getData();
               });
              })
            ),
          ),
        ],
      ),
    );
  }
}
