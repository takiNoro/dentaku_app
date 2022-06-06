import 'dart:ffi';
import 'dart:math';

enum ButtonType {
  zero,
  one,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  cce,
  off,
  root,
  percent,
  mrc,
  mPlus,
  mMinus,
  plus,
  minus,
  multiplication,
  division,
  point,
  equal,
}

enum NumberType {
  zero,
  one,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
}

enum MethodType {
  plus,
  minus,
  multiplication,
  division,
}

class DentakuModel {
  String display = "";
  double? _current;
  double _result = 0.0;
  ButtonType? _last;
  MethodType? _method;
  double memory = 0.0;

  void setButton(ButtonType type) {
    _last = type;
  }

  // 数字を押した時
  void pushedNum(ButtonType addNum) {
    if (addNum.index < 9) {
      _result = double.tryParse(display.isEmpty ? "0" : display)!;
      display = "";
    }
    String pushNum = _convertTypeToString(_convertNumberType(addNum));
    display += pushNum;
    _removeFirstZero();
  }

  // 小数点を押した時
  void pushedPoint() {
    if (!display.contains(".")) {
      display += display.isEmpty ? "0." : ".";
    }
    _removeFirstZero();
  }

//
  //　四則演算を押した時
  void pushedCalculation(MethodType method) {
    if (_method == method && _current != null) {
      switch (method) {
        case MethodType.plus:
          _plus(_result, _current!);
          break;
        case MethodType.minus:
          _minus(_result, _current!);
          break;
        case MethodType.division:
          _division(_result, _current!);
          break;
        case MethodType.multiplication:
          _multiplication(_result, _current!);
          break;
      }
    } else {
      _current = null;
    }
    _method = method;
    // double current = double.parse(currentNum);
    // double display = double.parse(displayNum);
  }

//
  void reset() {
    display = "";
    _current = null;
    _result = 0.0;
    _last = null;
    _method = null;
    memory = 0.0;
  }

  void pushedEqual() {
    if (_current != null) {
      switch (_method) {
        case MethodType.plus:
          _plus(_result, _current!);
          break;
        case MethodType.minus:
          _minus(_result, _current!);
          break;
        case MethodType.division:
          _division(_result, _current!);
          break;
        case MethodType.multiplication:
          _multiplication(_result, _current!);
          break;
      }
    }
  }

  void pushedCce() {
    if (_last == ButtonType.cce) {
      reset();
    } else {
      _current = 0;
      display = "0";
    }
  }

  void pushedRoot() {
    if (_current != null) {
      double root = sqrt(_current!);
      _current = double.parse(root.toStringAsFixed(8));
      _convertAnswerDisplay(_current!);
    } else {
      double root = sqrt(_result);
      _result = double.parse(root.toStringAsFixed(8));
      _convertAnswerDisplay(_result);
    }
  }

  void pushedPercent() {
    if (_current != null) {
      _current = _current!/100;
      _convertAnswerDisplay(_current!);
    } else {
      _result = _result/100;
      _convertAnswerDisplay(_result);
    }
  }

  void pushedMPlus() {
    if (_current != null) {
      memory += _current!;
    } else {
      memory += _result;
    }
    }

  void pushedMMinus() {
    if (_current != null) {
      memory -= _current!;
    } else {
      memory -= _result;
    }


  }

  void pushedMrc() {
    if(_last == ButtonType.mrc) {
      _mc();
    } else {
     _mr();
    }
  }

  NumberType _convertNumberType(ButtonType type) {
    return NumberType.values[type.index];
  }

  String _convertTypeToString(NumberType type) {
    return type.index.toString();
  }

//
  void _removeFirstZero() {
    if (display.startsWith("0") &&
        !display.startsWith("0.") &&
        display != "0") {
      display = display.substring(1);
    }
    if (_method != null) {
      _current = double.tryParse(display);
    } else {
      _result = double.tryParse(display)!;
    }
  }

  void _plus(double num1, double num2) {
    double a = num1 + num2;
    _result = a;
    _convertAnswerDisplay(a);
  }

  void _minus(double num1, double num2) {
    double a = num1 - num2;
    _result = a;
    _convertAnswerDisplay(a);
  }

  void _multiplication(double num1, double num2) {
    double a = num1 * num2;
    _result = a;
    _convertAnswerDisplay(a);
  }

  void _division(double num1, double num2) {
    double a = num1 / num2;
    _result = a;
    _convertAnswerDisplay(a);
  }

  void _convertAnswerDisplay(double a) {
    int i = a.toInt();
    if (a == i) {
      display = i.toString();
    } else {
      display = a.toString();
    }
  }
  void _mr() {
    if (_current != null) {
      _current = memory;
      _convertAnswerDisplay(memory);
    } else {
      _result = memory;
      _convertAnswerDisplay(memory);
    }
  }
  void _mc() {
    memory = 0;
  }
}
