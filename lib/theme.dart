import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_player/constants.dart';

ThemeData theme() {
  return ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: kScaffold,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    useMaterial3: true,
    textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
  );
}
