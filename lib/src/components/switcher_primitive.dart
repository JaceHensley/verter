import 'package:over_react/over_react.dart';

@Factory()
UiFactory<SwitcherPrimitiveProps> SwitcherPrimitive;

@Props()
class SwitcherPrimitiveProps extends UiProps {
  String price;
  DomEventCallback onPrevButtonClick;
  DomEventCallback onNextButtonClick;
}

@Component()
class SwitcherPrimitiveComponent extends UiComponent<SwitcherPrimitiveProps> {
  @override
  render() {
    return (Dom.div()..addProps(copyUnconsumedDomProps()))(
      _renderPrevButton(),
      _renderView(),
      _renderNextButton(),
    );
  }

  ReactElement _renderPrevButton() {
    return (Dom.button()
        ..className = 'float-left btn'
        ..onClick = props.onPrevButtonClick
      )(
        (Dom.i()..className = 'fa fa-chevron-left fa-1')(),
      );
  }

  ReactElement _renderView() {
    return (Dom.span()..className = 'price')(
      props.price
    );
  }

  ReactElement _renderNextButton() {
    return (Dom.button()
      ..className = 'float-right btn'
      ..onClick = props.onNextButtonClick
    )(
      (Dom.i()..className = 'fa fa-chevron-right fa-1')(),
    );
  }
}
