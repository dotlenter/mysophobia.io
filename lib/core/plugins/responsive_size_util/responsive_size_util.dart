library responsive_size_util;

import 'package:flutter/material.dart';

class ResponsiveSizeUtil {
  static ResponsiveSizeUtil instance = ResponsiveSizeUtil();

  int width;
  int height;
  bool allowFontScaling;

  static MediaQueryData _mediaQueryData;
  static double _screenWidth;
  static double _screenHeight;
  static double _pixelRatio;
  static double _statusBarHeight;
  static double _bottomBarHeight;
  static double _textScaleFactor;

  ResponsiveSizeUtil({
    this.width = 1080,
    this.height = 1920,
    this.allowFontScaling = false,
  });

  static ResponsiveSizeUtil getInstance() {
    return instance;
  }

  void init(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    _mediaQueryData = mediaQuery;
    _pixelRatio = mediaQuery.devicePixelRatio;
    _screenWidth = mediaQuery.size.width;
    _screenHeight = mediaQuery.size.height;
    _statusBarHeight = mediaQuery.padding.top;
    _bottomBarHeight = _mediaQueryData.padding.bottom;
    _textScaleFactor = mediaQuery.textScaleFactor;
  }

  static MediaQueryData get mediaQueryData => _mediaQueryData;
  static double get textScaleFactory => _textScaleFactor;
  static double get pixelRatio => _pixelRatio;
  static double get screenWidthDp => _screenWidth;
  static double get screenHeightDp => _screenHeight;
  static double get screenWidth => _screenWidth * _pixelRatio;
  static double get screenHeight => _screenHeight * _pixelRatio;
  static double get statusBarHeight => _statusBarHeight * _pixelRatio;
  static double get bottomBarHeight => _bottomBarHeight * _pixelRatio;

  double get scaleWidth => _screenWidth / instance.width;
  double get scaleHeight => _screenHeight / instance.height;
  double setWidth(int width) => width * scaleWidth;
  double setHeight(int height) => height * scaleHeight;

  double setSp(int fontSize) => allowFontScaling
      ? setWidth(fontSize)
      : setWidth(fontSize) / _textScaleFactor;
}
