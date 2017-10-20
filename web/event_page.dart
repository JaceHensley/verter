import 'dart:convert';
import 'dart:html';

import 'package:chrome/chrome_ext.dart' as chrome;

void main() {
  var satAlarmInfo = new chrome.AlarmCreateInfo(
    delayInMinutes: 1,
    periodInMinutes: 1,
  );

  chrome.alarms.create(satAlarmInfo, 'Get Sat');
  chrome.alarms.onAlarm.listen((alarm) {
    if (alarm.name == 'Get Sat') {
      var httpRequest = new HttpRequest()
        ..open('GET', 'http://coincap.io/page/VTC', async: false);

      httpRequest.onReadyStateChange.listen((_) {
        if (httpRequest.readyState == 4) {
          Map<String, num> json = JSON.decode(httpRequest.responseText);
          var satPrice = ((json['price_btc'] * 100000000) / 1000).round();

          var badge = new chrome.BrowserActionSetBadgeTextParams(text: '${satPrice}k');
          chrome.browserAction.setBadgeText(badge);
        }
      });

      httpRequest.send();
    }
  });
}
