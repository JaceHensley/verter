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

    return (Dom.div()..className = 'container')(
      _renderDayChange(),
      _renderFiatPrices(),
      _renderCryptoPrices(),
      _renderDivider(),
      _renderIcons(),
    );
  }

  ReactElement _renderDayChange() {
    return (Dom.div()..className = 'columns')(
      (Dom.div()..className = 'column col-8 col-mx-auto text-center')('24hr Δ: ${props.data.dayChange}%')
    );
  }

  ReactElement _renderFiatPrices() {
    return (Switcher()
      ..prices = [
        '\$ ${props.data.usdPrice}',
        '€ ${props.data.eurPrice}',
      ]
    )();
  }

  ReactElement _renderCryptoPrices() {
    return (Switcher()
      ..prices = [
        '\u20BF ${props.data.btcPrice}',
        '\u039E ${props.data.ethPrice}',
        '\u0141 ${props.data.ltcPrice}',
        '\u01B5 ${props.data.zecPrice}',
        '${props.data.satPrice} Satoshi',
      ]
    )();
  }

  ReactElement _renderDivider() {
    return (Dom.div()
      ..className = 'divider divider--vert'
    )();
  }

  ReactElement _renderIcons() {
    return (Dom.div()
      ..className = 'columns'
    )(
      (Dom.a()
        ..className = 'column col-4'
        ..target = '_blank'
        ..rel = 'noopener noreferrer'
        ..href = 'https://vertcoin.org/'
      )(
        (Dom.img()
          ..className = 'fa fa-vertcoin fa-2'
          ..src = '/img/icon.png'
          ..height = '42px'
        )(),
      ),
      (Dom.a()
        ..className = 'column col-4'
        ..target = '_blank'
        ..rel = 'noopener noreferrer'
        ..href = 'https://www.reddit.com/r/vertcoin'
      )(
        (Dom.i()..className = 'fa fa-reddit-square fa-2 text-center')()
      ),
      (Dom.a()
        ..className = 'column col-4'
        ..target = '_blank'
        ..rel = 'noopener noreferrer'
        ..href = 'https://twitter.com/vertcoin'
      )(
        (Dom.i()..className = 'fa fa-twitter-square fa-2 text-center')()
      ),
    );
  }
}
