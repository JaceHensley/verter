import 'package:chrome/chrome_ext.dart' as chrome;

import 'package:verter/src/request.dart';

void initBadge() {
  sendRequest((data) {
    var roundedSatPrice = (double.parse(data.satPrice) / 1000).round();

    var badgeText = new chrome.BrowserActionSetBadgeTextParams(text: '${roundedSatPrice}k');
    var badgeColor = new chrome.BrowserActionSetBadgeBackgroundColorParams(color: 'green');

    chrome.browserAction
      ..setBadgeText(badgeText)
      ..setBadgeBackgroundColor(badgeColor);
  });
}
