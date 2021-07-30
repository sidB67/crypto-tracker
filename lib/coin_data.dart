
import 'dart:convert';
import 'package:http/http.dart';
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



class CoinData {

  Future  getPrice(String coin, String cont)async{
    String requestUrl = 'https://free.currconv.com/api/v7/convert?q=${coin}_$cont&compact=ultra&apiKey=e33280663cf7232795e4';
    Response response = await get(requestUrl);
    if(response.statusCode==200) {
      var decodedData = jsonDecode(response.body);
      double price = decodedData['${coin}_$cont'];
      if(price!=null) {
        return price.toStringAsFixed(0);
      }
      else
        return '0';
    }
    else{
      print(response.statusCode);
      throw 'Problem With Getting Request';
    }

  }


}

