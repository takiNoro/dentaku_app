import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../dentaku_model.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    this.onTap,
    required this.type,
  }) : super(key: key);

  final VoidCallback? onTap;
  final ButtonType type;
  double width = 214;
  double height = 190;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: _createChild(),
    );
  }

  Widget _createChild() {
    return Container(
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/button_${type.name}.png"),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class CustomFlatButton extends CustomButton {
  CustomFlatButton({required super.type, super.onTap});

  @override
  double height = 142;
}

class CustomPlusButton extends CustomButton {
  CustomPlusButton({required super.type, super.onTap});

  @override
  double height = 417;
}
