import 'dart:html';

import 'package:over_react/over_react.dart';
import 'package:react/react_dom.dart' as react_dom;

import 'package:verter/verter.dart';

void main() {
  setClientConfiguration();

  sendRequest((data) {
    react_dom.render((App()..data = data)(), querySelector('#entry-point'));
  });
}
