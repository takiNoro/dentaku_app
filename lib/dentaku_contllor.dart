import 'dart:ffi';

import 'package:dentaku_app/dentaku_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dentakuModelProvider = ChangeNotifierProvider((ref) => DentakuContllor());

class DentakuContllor extends ChangeNotifier {
  static final _model = DentakuModel();
  String display() {return _model.display;}

  void buttonPushed(ButtonType type) {
    switch (type) {
      case ButtonType.zero:
      case ButtonType.one:
      case ButtonType.two:
      case ButtonType.three:
      case ButtonType.four:
      case ButtonType.five:
      case ButtonType.six:
      case ButtonType.seven:
      case ButtonType.eight:
      case ButtonType.nine:
        _model.pushedNum(type);
      break;
      case ButtonType.cce:
        _model.pushedCce();
        break;
      case ButtonType.off:
        _model.reset();
        break;
      case ButtonType.root:
        _model.pushedRoot();
        break;
      case ButtonType.percent:
        _model.pushedPercent();
        break;
      case ButtonType.mrc:
        _model.pushedMrc();
        break;
      case ButtonType.mPlus:
        _model.pushedMPlus();
        break;
      case ButtonType.mMinus:
        _model.pushedMMinus();
        break;
      case ButtonType.plus:
        _model.pushedCalculation(MethodType.plus);
        break;
      case ButtonType.minus:
        _model.pushedCalculation(MethodType.minus);
        break;
      case ButtonType.multiplication:
        _model.pushedCalculation(MethodType.multiplication);
        break;
      case ButtonType.division:
        _model.pushedCalculation(MethodType.division);
        break;
      case ButtonType.point:
        _model.pushedPoint();
        break;
      case ButtonType.equal:
        _model.pushedEqual();
        break;
    }
    _model.setButton(type);
    notifyListeners();
  }
}
