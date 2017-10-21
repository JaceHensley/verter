import 'dart:convert';
import 'dart:html';

import 'package:verter/src/data.dart';

void sendRequest(callback(Data)) {
  var httpRequest = new HttpRequest();
  const baseUrl = 'https://api.coinmarketcap.com/v1/ticker/vertcoin/';
  var allJson = {};

  httpRequest.onReadyStateChange.listen((_) {
    if (httpRequest.readyState == 4) {
      allJson.addAll(JSON.decode(httpRequest.responseText).single);
    }
  });

  var currencies = ['USD', 'EUR', 'BTC', 'LTC', 'ETH', 'ZEC'];

  for (var currency in currencies) {
    httpRequest
    ..open('GET', '$baseUrl?convert=$currency', async: false)
    ..send();
  }

  var eurPrice = double.parse(allJson['price_eur']).toStringAsFixed(2);
  var usdPrice = double.parse(allJson['price_usd']).toStringAsFixed(2);
  var btcPrice = double.parse(allJson['price_btc']).toStringAsFixed(10);
  var ethPrice = double.parse(allJson['price_eth']).toStringAsFixed(10);
  var ltcPrice = double.parse(allJson['price_ltc']).toStringAsFixed(10);
  var zecPrice = double.parse(allJson['price_zec']).toStringAsFixed(10);
  var satPrice = (double.parse(btcPrice) * 100000000).toStringAsFixed(0);
  var hourChange = allJson['percent_change_1h'];
  var dayChange = allJson['percent_change_24h'];
  var weekChange = allJson['percent_change_7d'];

  var data = new Data(
    usdPrice: usdPrice,
    eurPrice: eurPrice,
    btcPrice: btcPrice,
    ethPrice: ethPrice,
    ltcPrice: ltcPrice,
    zecPrice: zecPrice,
    satPrice: satPrice,
    hourChange: hourChange,
    dayChange: dayChange,
    weekChange: weekChange,
  );

  callback(data);
}
