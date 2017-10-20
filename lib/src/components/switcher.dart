import 'package:over_react/over_react.dart';

import 'package:verter/src/components/switcher_primitive.dart';

@Factory()
UiFactory<SwitcherProps> Switcher;

@Props()
class SwitcherProps extends UiProps {
  List<String> prices;
}

@State()
class SwitcherState extends UiState {
  String price;
}

@Component()
class SwitcherComponent extends UiStatefulComponent<SwitcherProps, SwitcherState> {
  @override
  Map getDefaultProps() => (newProps()
    ..prices = const []
  );

  @override
  Map getInitialState() => (newState()
    ..price = props.prices.first
  );

  @override
  render() {
    return (SwitcherPrimitive()
      ..addProps(copyUnconsumedProps())
      ..price = state.price
      ..onNextButtonClick = _handleNextButtonClick
      ..onPrevButtonClick = _handlePrevButtonClick
    )();
  }

  void _handleNextButtonClick(_) {
    if (props.prices.length == 2) {
      if (state.price == props.prices.last) {
        setState(newState()
          ..price = props.prices.first
        );
      } else {
        setState(newState()
          ..price = props.prices.last
        );
      }
    } else if (state.price == props.prices.last) {
      setState(newState()
        ..price = props.prices.first
      );
    } else {
      setState(newState()
        ..price = props.prices[props.prices.indexOf(state.price) + 1]
      );
    }
  }

  void _handlePrevButtonClick(_) {
    if (props.prices.length == 2) {
      if (state.price == props.prices.last) {
        setState(newState()
          ..price = props.prices.first
        );
      } else {
        setState(newState()
          ..price = props.prices.last
        );
      }
    } else if (state.price == props.prices.first) {
      setState(newState()
        ..price = props.prices.last
      );
    } else {
      setState(newState()
        ..price = props.prices[props.prices.indexOf(state.price) - 1]
      );
    }
  }
}
