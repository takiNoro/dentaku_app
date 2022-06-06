import 'package:dentaku_app/dentaku_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
      ProviderScope(
          child: ScreenUtilInit(
              designSize: Size(1080, 1920),
              builder: (BuildContext context, Widget? child) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'dentaku_app',
                  // You can use the library anywhere in the app even in theme
                  theme: ThemeData(
                    primarySwatch: Colors.blue,
                  ),
                  home: child,
                );
              },
              child: DentakuPage(),
          )
      )
  );
}
