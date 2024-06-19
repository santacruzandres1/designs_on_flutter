import 'package:flutter/material.dart';

class SizeConfig {
  late Size _mediaQuerySize;
  late double screenWidth;
  late double screenHeight;
  late double blockSizeHorizontal;
  late double blockSizeVertical;

  static final SizeConfig _singleton = SizeConfig._internal();

  factory SizeConfig() {
    return _singleton;
  }

  SizeConfig._internal();

  void init(BuildContext context) {
    _mediaQuerySize = sizeOf(context); 
    screenWidth = _mediaQuerySize.width;
    screenHeight = _mediaQuerySize.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }

  static Size sizeOf(BuildContext context) =>
      _of(context, _MediaQueryAspect.size).size;

  static T _of<T extends Object>(BuildContext context, _MediaQueryAspect<T> aspect) {
    return aspect._getter(context);
  }
}

class _MediaQueryAspect<T> {
  _MediaQueryAspect(this._getter);

  final T Function(BuildContext context) _getter;

  static final _MediaQueryAspect<MediaQueryData> size =
      _MediaQueryAspect<MediaQueryData>((BuildContext context) => MediaQuery.of(context));
}
