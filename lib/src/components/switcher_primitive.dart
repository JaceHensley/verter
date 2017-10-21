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
    return (Dom.div()
      ..className = 'columns'
      ..addProps(copyUnconsumedDomProps())
    )(
      _renderPrevButton(),
      _renderView(),
      _renderNextButton(),
    );
  }

  ReactElement _renderPrevButton() {
    return (Dom.div()
      ..className = 'column col-2'
    )(
      (Dom.button()
        ..className = 'btn btn--vert btn-sm btn-block'
        ..onClick = props.onPrevButtonClick
      )(
        (Dom.i()..className = 'icon icon-arrow-left')(),
      )
    );
  }

  ReactElement _renderView() {
    return (Dom.span()..className = 'column col-8')(
      props.price
    );
  }

  ReactElement _renderNextButton() {
    return (Dom.div()
      ..className = 'column col-2'
    )(
      (Dom.button()
        ..className = 'btn btn--vert btn-sm btn-block'
        ..onClick = props.onNextButtonClick
      )(
        (Dom.i()..className = 'icon icon-arrow-right')(),
      )
    );
  }
}
