import 'package:dentaku_app/dentaku_contllor.dart';
import 'package:dentaku_app/src/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dentaku_model.dart';

class DentakuPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(dentakuModelProvider);
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: SafeArea(
          child: Container(
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: Container(
                      width: 960.w,
                      height: 200.h,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/bg.png"),
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(30.sp),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            alignment: Alignment.centerRight,
                            child: Text(
                              controller.display(),
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 125.sp,
                                color: Color(0xFF707070),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(bottom: 35.h, left: 60.w, right: 60.w),
                  child: Row(
                    children: [
                      CustomFlatButton(
                        type: ButtonType.cce,
                        onTap: () {
                          controller.buttonPushed(ButtonType.cce);
                        },
                      ),
                      CustomFlatButton(
                        type: ButtonType.off,
                        onTap: () {
                          controller.buttonPushed(ButtonType.off);
                        },
                      ),
                      CustomFlatButton(
                        type: ButtonType.root,
                        onTap: () {
                          controller.buttonPushed(ButtonType.root);
                        },
                      ),
                      CustomFlatButton(
                        type: ButtonType.percent,
                        onTap: () {
                          controller.buttonPushed(ButtonType.percent);
                        },
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(bottom: 35.h, left: 60.w, right: 60.w),
                  child: Row(
                    children: [
                      CustomFlatButton(
                        type: ButtonType.mrc,
                        onTap: () {
                          controller.buttonPushed(ButtonType.mrc);
                        },
                      ),
                      CustomFlatButton(
                        type: ButtonType.mPlus,
                        onTap: () {
                          controller.buttonPushed(ButtonType.mPlus);
                        },
                      ),
                      CustomFlatButton(
                        type: ButtonType.mMinus,
                        onTap: () {
                          controller.buttonPushed(ButtonType.mMinus);
                        },
                      ),
                      CustomFlatButton(
                        type: ButtonType.multiplication,
                        onTap: () {
                          controller.buttonPushed(ButtonType.division);
                        },
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(bottom: 35.h, left: 60.w, right: 60.w),
                  child: Row(
                    children: [
                      CustomButton(
                        type: ButtonType.seven,
                        onTap: () {
                          controller.buttonPushed(ButtonType.seven);
                        },
                      ),
                      CustomButton(
                        type: ButtonType.eight,
                        onTap: () {
                          controller.buttonPushed(ButtonType.eight);
                        },
                      ),
                      CustomButton(
                        type: ButtonType.nine,
                        onTap: () {
                          controller.buttonPushed(ButtonType.nine);
                        },
                      ),
                      CustomButton(
                        type: ButtonType.division,
                        onTap: () {
                          controller.buttonPushed(ButtonType.multiplication);
                        },
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(bottom: 35.h, left: 60.w, right: 60.w),
                  child: Row(
                    children: [
                      CustomButton(
                        type: ButtonType.four,
                        onTap: () {
                          controller.buttonPushed(ButtonType.four);
                        },
                      ),
                      CustomButton(
                        type: ButtonType.five,
                        onTap: () {
                          controller.buttonPushed(ButtonType.five);
                        },
                      ),
                      CustomButton(
                        type: ButtonType.six,
                        onTap: () {
                          controller.buttonPushed(ButtonType.six);
                        },
                      ),
                      CustomButton(
                        type: ButtonType.minus,
                        onTap: () {
                          controller.buttonPushed(ButtonType.minus);
                        },
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 60.w, right: 60.w, bottom: 50.h),
                  child: Row(
                    children: [
                      Column(children: [
                        CustomButton(
                          type: ButtonType.one,
                          onTap: () {
                            controller.buttonPushed(ButtonType.one);
                          },
                        ),
                        SizedBox(
                          height: 35.h,
                        ),
                        CustomButton(
                          type: ButtonType.zero,
                          onTap: () {
                            controller.buttonPushed(ButtonType.zero);
                          },
                        ),
                      ]),
                      Column(children: [
                        CustomButton(
                          type: ButtonType.two,
                          onTap: () {
                            controller.buttonPushed(ButtonType.two);
                          },
                        ),
                        SizedBox(
                          height: 35.h,
                        ),
                        CustomButton(
                          type: ButtonType.point,
                          onTap: () {
                            controller.buttonPushed(ButtonType.point);
                          },
                        ),
                      ]),
                      Column(children: [
                        CustomButton(
                          type: ButtonType.three,
                          onTap: () {
                            controller.buttonPushed(ButtonType.three);
                          },
                        ),
                        SizedBox(
                          height: 35.h,
                        ),
                        CustomButton(
                          type: ButtonType.equal,
                          onTap: () {
                            controller.buttonPushed(ButtonType.equal);
                          },
                        ),
                      ]),
                      CustomPlusButton(
                        type: ButtonType.plus,
                        onTap: () {
                          controller.buttonPushed(ButtonType.plus);
                        },
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
