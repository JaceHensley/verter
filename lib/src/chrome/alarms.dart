import 'package:chrome/chrome_ext.dart' as chrome;

import 'package:verter/src/request.dart';

void initAlarms() {
  var prevSatPrice = 0.0;

  var satAlarmInfo = new chrome.AlarmCreateInfo(
    delayInMinutes: 1,
    periodInMinutes: 1,
  );

  chrome.alarms.create(satAlarmInfo, 'Get Sat');
  chrome.alarms.onAlarm.listen((alarm) {
    if (alarm.name == 'Get Sat') {
      sendRequest((data) {
        var satPriceNum = double.parse(data.satPrice);
        var roundedSatPrice = (double.parse(data.satPrice) / 1000).round();

        var badgeText = new chrome.BrowserActionSetBadgeTextParams(text: '${roundedSatPrice}k');
        var badgeColor = new chrome.BrowserActionSetBadgeBackgroundColorParams(color: satPriceNum > prevSatPrice ? 'green' : 'red');

        chrome.browserAction
          ..setBadgeText(badgeText)
          ..setBadgeBackgroundColor(badgeColor);

        prevSatPrice = satPriceNum;
      });
    }
  });
}
