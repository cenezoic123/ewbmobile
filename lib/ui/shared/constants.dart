import 'package:flutter/material.dart';


const kAppLogo = 'assets/images/app_logo.png';
const kBackgroundImage = 'assets/images/background.jpg';
const kBridalLorenImage = 'assets/images/avatar.jpg';
const kBridalLorenImage2 = 'assets/images/bridal_lori5.jpg';


const kScreenPadding = 30.0;
const kMoreVertIconSize = 23.0;

// Color kAppPrimaryColor = const Color(0xFFE36A01);
Color kAppPrimaryColor = const Color(0xFFFD621E);
Color kAppGradientColor = const Color(0xFFFC9368);
Color kAppBackgroundColor = const Color(0xFFF3EDED);
Color kAppBoxShadowColor = Colors.black12;
// Color kLoadingIndicatorColor = const Color(0xFFE36A01);
Color kLoadingIndicatorColor = Colors.grey;
Color kDefaultColor = Colors.white;

Color kAppSecondaryIconColor = const Color(0xFFC4C4C4);
Color kAppIconBackground = const Color(0xFFE8E7E7);




BorderRadius kTextFieldBorderRadius = const BorderRadius.all(Radius.circular(15.0));


var kBgImageColorFilter = ColorFilter.mode(
  Colors.black.withOpacity(
    0.5,
  ),
  BlendMode.darken,
);




/** TEXTFIELD STYLES **/
const kMainTextFieldStyle = InputDecoration(
  filled: false,
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  contentPadding: EdgeInsets.symmetric(
    vertical: 10.0,
    horizontal: 20.0,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(32.0),
    ),
  ),
);