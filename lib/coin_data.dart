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
  'SAR',
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
const apiKey = '86842E02-D336-4E9D-A43C-59B6A8250774';
const coinURL = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData {
  Future getCoinData(String currency) async {
    Map<String,String>cryptoPrices={};
    for (String crypto in cryptoList) {
      String url = '$coinURL/$crypto/$currency?apikey=$apiKey';
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        var price = decodedData['rate'];
        cryptoPrices[crypto] = price.toStringAsFixed(0);
      } else {
        print(response.statusCode);
      }
    }
    return cryptoPrices;
  }
}
