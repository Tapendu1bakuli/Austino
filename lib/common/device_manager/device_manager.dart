
import 'dart:core';

import 'package:flutter/material.dart';

class DeviceManager {
  static DeviceManager instance =  DeviceManager();

  num width;
  num height;
  bool allowFontScaling;

  static MediaQueryData? _mediaQueryData;
  static num? _screenWidth;
  static num? _screenHeight;
  static num? _pixelRatio;
  static num? _statusBarHeight;

  static num? _bottomBarHeight;

  static num? _textScaleFactor;

  DeviceManager({
    this.width = 1080,
    this.height = 1920,
    this.allowFontScaling = false,
  });

  static DeviceManager getInstance() {
    return instance;
  }

  void init(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    _mediaQueryData = mediaQuery;
    _pixelRatio = mediaQuery.devicePixelRatio;
    _screenWidth = mediaQuery.size.width;
    _screenHeight = mediaQuery.size.height;
    _statusBarHeight = mediaQuery.padding.top;
    _bottomBarHeight = _mediaQueryData?.padding.bottom;
    _textScaleFactor = mediaQuery.textScaleFactor;
  }

  static MediaQueryData? get mediaQueryData => _mediaQueryData;

  static num? get textScaleFactory => _textScaleFactor;

  static num? get pixelRatio => _pixelRatio;

  static num? get screenWidthDp => _screenWidth;

  static num? get screenHeightDp => _screenHeight;

  static num get screenWidth => _screenWidth! * _pixelRatio!;

  static num get screenHeight => _screenHeight! * _pixelRatio!;

  static num get statusBarHeight => _statusBarHeight! * _pixelRatio!;

  static num get bottomBarHeight => _bottomBarHeight! * _pixelRatio!;

  get scaleWidth => _screenWidth! / instance.width;

  get scaleHeight => _screenHeight! / instance.height;

  setWidth(double width) => width * scaleWidth;

  setHeight(double height) => height * scaleHeight;

  setSp(double fontSize) => allowFontScaling
      ? setWidth(fontSize)
      : setWidth(fontSize) / _textScaleFactor;
}
