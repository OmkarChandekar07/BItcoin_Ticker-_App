import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future getCOinData(String selectedCOin)async{
      final res=await http.get(Uri.parse('https://rest.coinapi.io/v1/exchangerate/BTC/$selectedCOin?apikey=97353bca-c7d4-4c06-ac8d-a112cfe82494'));
      
      if (res.statusCode == 200) {
   var decodedData = jsonDecode(res.body);
    var lastPrice = decodedData['rate'];
      return lastPrice;
    } else {
      print(res.statusCode);
      throw 'Problem with the get request';
    
  
      }
  } 
  Future getetc(String selectedCOin)async{
    final resp= await http.get(Uri.parse('https://rest.coinapi.io/v1/exchangerate/ETH/$selectedCOin?apikey=97353bca-c7d4-4c06-ac8d-a112cfe82494'));
     
   var decodedData = jsonDecode(resp.body);
    var lastPrice = decodedData['rate'];
      print(lastPrice);
  }
}

// 97353bca-c7d4-4c06-ac8d-a112cfe82494;