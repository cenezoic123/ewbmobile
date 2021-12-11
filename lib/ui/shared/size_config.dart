import 'package:flutter/material.dart';

class SizeConfig {
  static double _screenWidth = 0;
  static double _screenHeight = 0;
  static double _blockSizeHorizontal = 0;
  static double _blockSizeVertical = 0;
  static double _textScaleFactor = 0;

  void init(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    _screenWidth = _mediaQueryData.size.width;
    _screenHeight = _mediaQueryData.size.height;
    _blockSizeHorizontal = _screenWidth / 100;
    _blockSizeVertical = _screenHeight / 100;
    _textScaleFactor = _mediaQueryData.textScaleFactor;
  }

  get kBlockSizeHorizontal {
    return _blockSizeHorizontal;
  }

  get kBlockSizeVertical {
    return _blockSizeVertical;
  }

  get kScreenWidth {
    return _screenWidth;
  }

  get kScreenHeight {
    return _screenHeight;
  }

  get kTextScaleFactor {
    return _textScaleFactor;
  }

  bool kIsPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }
}