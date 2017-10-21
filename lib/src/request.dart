import 'dart:convert';
import 'dart:html';

import 'package:verter/src/data.dart';

void sendRequest(callback(Data)) {
  var httpRequest = new HttpRequest();

  httpRequest.onReadyStateChange.listen((_) {
    if (httpRequest.readyState == 4) {
      Map<String, num> json = JSON.decode(httpRequest.responseText);
      var usdPrice = json['price_usd'].toStringAsFixed(2);
      var eurPrice = json['price_eur'].toStringAsFixed(2);
      var btcPrice = json['price_btc'].toStringAsFixed(10);
      var ethPrice = json['price_eth'].toStringAsFixed(10);
      var ltcPrice = json['price_ltc'].toStringAsFixed(10);
      var zecPrice = json['price_zec'].toStringAsFixed(10);
      var satPrice = (double.parse(btcPrice) * 100000000).toStringAsFixed(0);
      var dayChange = json['cap24hrChange'].toString();

      var data = new Data(
        usdPrice: usdPrice,
        eurPrice: eurPrice,
        btcPrice: btcPrice,
        ethPrice: ethPrice,
        ltcPrice: ltcPrice,
        zecPrice: zecPrice,
        satPrice: satPrice,
        dayChange: dayChange
      );

      callback(data);
    }
  });

  httpRequest
    ..open('GET', 'http://coincap.io/page/VTC', async: false)
    ..send();
}
