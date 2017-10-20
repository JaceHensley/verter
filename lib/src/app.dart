import 'package:over_react/over_react.dart';

import 'package:verter/src/data.dart';
import 'package:verter/src/components/switcher.dart';

@Factory()
UiFactory<AppProps> App;

@Props()
class AppProps extends UiProps {
  Data data;
}

@Component()
class AppComponent extends UiComponent<AppProps> {
  @override
  render() {
    if (props.data == null) return false;

    return Dom.div()(
      _renderDayChange(),
      _renderFiatPrices(),
      _renderCryptoPrices(),
      _renderIcons(),
    );
  }

  ReactElement _renderDayChange() {
    return (Dom.div()
      ..className = 'row'
    )('24hr change: ${props.data.dayChange}%');
  }

  ReactElement _renderFiatPrices() {
    return (Switcher()
      ..className = 'row'
      ..prices = [
        '\$ ${props.data.usdPrice}',
        '€ ${props.data.eurPrice}',
      ]
    )();
  }

  ReactElement _renderCryptoPrices() {
    return (Switcher()
      ..className = 'row'
      ..prices = [
        '\u20BF ${props.data.btcPrice}',
        '\u039E ${props.data.ethPrice}',
        '\u0141 ${props.data.ltcPrice}',
        '\u01B5 ${props.data.zecPrice}',
        '${props.data.satPrice} Satoshi',
      ]
    )();
  }

  ReactElement _renderIcons() {
    return (Dom.div()
      ..className = 'row row--icons'
    )(
      (Dom.a()
        ..target = '_blank'
        ..rel = 'noopener noreferrer'
        ..href = 'https://vertcoin.org/'
      )(
        (Dom.img()
          ..className = 'fa fa-vertcoin fa-2'
          ..src = '/img/icon.png'
        )(),
      ),
      (Dom.a()
        ..target = '_blank'
        ..rel = 'noopener noreferrer'
        ..href = 'https://www.reddit.com/r/vertcoin'
      )(
        (Dom.i()..className = 'fa fa-reddit-square fa-2')()
      ),
      (Dom.a()
        ..target = '_blank'
        ..rel = 'noopener noreferrer'
        ..href = 'https://twitter.com/vertcoin'
      )(
        (Dom.i()..className = 'fa fa-twitter-square fa-2')()
      ),
    );
  }
}
