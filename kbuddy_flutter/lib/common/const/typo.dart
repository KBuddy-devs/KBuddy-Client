
import 'package:flutter/material.dart';

// 공통 스타일
const TextStyle commonStyle = TextStyle(
  color: Color(0xFF1F2122),
  fontFeatures: [FontFeature.disable('clig'), FontFeature.disable('liga')],
);

// Montserrat 폰트 스타일
final TextStyle headLine100Light = commonStyle.copyWith(
  fontFamily: 'Montserrat',
  fontSize: 28,
  fontWeight: FontWeight.w400,
  height: 36 / 28,
);

final TextStyle headLine100Heavy = commonStyle.copyWith(
  fontFamily: 'Montserrat',
  fontSize: 28,
  fontWeight: FontWeight.w800,
  height: 36 / 28,
);

final TextStyle headLine200Light = commonStyle.copyWith(
  fontFamily: 'Montserrat',
  fontSize: 24,
  fontWeight: FontWeight.w400,
  height: 32 / 24,
);

final TextStyle headLine200Heavy = commonStyle.copyWith(
  fontFamily: 'Montserrat',
  fontSize: 24,
  fontWeight: FontWeight.w800,
  height: 32 / 24,
);

// Roboto 폰트 스타일
// title
final TextStyle title100Light = commonStyle.copyWith(
  fontFamily: 'Roboto',
  fontSize: 22,
  fontWeight: FontWeight.w400,
  height: 28 / 22,
);

final TextStyle title100Medium = commonStyle.copyWith(
  fontFamily: 'Roboto',
  fontSize: 22,
  fontWeight: FontWeight.w500,
  height: 28 / 22,
);

final TextStyle title100Heavy = commonStyle.copyWith(
  fontFamily: 'Roboto',
  fontSize: 22,
  fontWeight: FontWeight.w700,
  height: 28 / 22,
);

final TextStyle title200Light = commonStyle.copyWith(
  fontFamily: 'Roboto',
  fontSize: 18,
  fontWeight: FontWeight.w400,
  height: 24 / 18,
);

final TextStyle title200Medium = commonStyle.copyWith(
  fontFamily: 'Roboto',
  fontSize: 18,
  fontWeight: FontWeight.w500,
  height: 24 / 18,
);

final TextStyle title200Heavy = commonStyle.copyWith(
  fontFamily: 'Roboto',
  fontSize: 18,
  fontWeight: FontWeight.w700,
  height: 24 / 18,
);

final TextStyle title300Light = commonStyle.copyWith(
  fontFamily: 'Roboto',
  fontSize: 16,
  fontWeight: FontWeight.w400,
  height: 24 / 16,
);

final TextStyle title300Medium = commonStyle.copyWith(
  fontFamily: 'Roboto',
  fontSize: 16,
  fontWeight: FontWeight.w500,
  height: 24 / 16,
);

final TextStyle title300Heavy = commonStyle.copyWith(
  fontFamily: 'Roboto',
  fontSize: 16,
  fontWeight: FontWeight.w700,
  height: 24 / 16,
);

final TextStyle title400Light = commonStyle.copyWith(
  fontFamily: 'Roboto',
  fontSize: 14,
  fontWeight: FontWeight.w400,
  height: 20 / 14,
);

final TextStyle title400Medium = commonStyle.copyWith(
  fontFamily: 'Roboto',
  fontSize: 14,
  fontWeight: FontWeight.w500,
  height: 20 / 14,
);

final TextStyle title400Heavy = commonStyle.copyWith(
  fontFamily: 'Roboto',
  fontSize: 14,
  fontWeight: FontWeight.w700,
  height: 20 / 14,
);

//body

final TextStyle body100Light = commonStyle.copyWith(
  fontFamily: 'Roboto',
  fontSize: 16,
  fontWeight: FontWeight.w400,
  height: 24 / 16,
  letterSpacing: 0.5,

);

final TextStyle body100Medium = commonStyle.copyWith(
  fontFamily: 'Roboto',
  fontSize: 16,
  fontWeight: FontWeight.w500,
  height: 24 / 16,
  letterSpacing: 0.5,
);

final TextStyle body100Heavy = commonStyle.copyWith(
  fontFamily: 'Roboto',
  fontSize: 16,
  fontWeight: FontWeight.w700,
  height: 24 / 16,
  letterSpacing: 0.5,
);

final TextStyle body200Light = commonStyle.copyWith(
  fontFamily: 'Roboto',
  fontSize: 14,
  fontWeight: FontWeight.w400,
  height: 20 / 14,
  letterSpacing: 0.25,
);

final TextStyle body200Medium = commonStyle.copyWith(
  fontFamily: 'Roboto',
  fontSize: 14,
  fontWeight: FontWeight.w500,
  height: 20 / 14,
  letterSpacing: 0.25,
);

final TextStyle body200Heavy = commonStyle.copyWith(
  fontFamily: 'Roboto',
  fontSize: 14,
  fontWeight: FontWeight.w700,
  height: 20 / 14,
  letterSpacing: 0.25,
);

final TextStyle body300Light = commonStyle.copyWith(
  fontFamily: 'Roboto',
  fontSize: 14,
  fontWeight: FontWeight.w400,
  height: 16 / 12,
);

final TextStyle body300Medium = commonStyle.copyWith(
  fontFamily: 'Roboto',
  fontSize: 14,
  fontWeight: FontWeight.w500,
  height: 16 / 12,
);

final TextStyle body300Heavy = commonStyle.copyWith(
  fontFamily: 'Roboto',
  fontSize: 12,
  fontWeight: FontWeight.w700,
  height: 16 / 12,
);

final TextStyle body400Light = commonStyle.copyWith(
  fontFamily: 'Roboto',
  fontSize: 11,
  fontWeight: FontWeight.w400,
  height: 16 / 11,
);

final TextStyle body400Medium = commonStyle.copyWith(
  fontFamily: 'Roboto',
  fontSize: 11,
  fontWeight: FontWeight.w500,
  height: 16 / 11,
);

final TextStyle body400Heavy = commonStyle.copyWith(
  fontFamily: 'Roboto',
  fontSize: 11,
  fontWeight: FontWeight.w700,
  height: 16 / 11,
);

//button

final TextStyle btn100 = commonStyle.copyWith(
  fontFamily: 'Roboto',
  fontSize: 16,
  fontWeight: FontWeight.w600,
);

final TextStyle btn100Lined = commonStyle.copyWith(
  fontFamily: 'Roboto',
  fontSize: 16,
  fontWeight: FontWeight.w600,
  decoration: TextDecoration.underline,
);

final TextStyle btn200 = commonStyle.copyWith(
  fontFamily: 'Roboto',
  fontSize: 16,
  fontWeight: FontWeight.w600,
  letterSpacing: 0.28,
);

final TextStyle btn200Lined = commonStyle.copyWith(
  fontFamily: 'Roboto',
  fontSize: 14,
  fontWeight: FontWeight.w600,
  decoration: TextDecoration.underline,
  letterSpacing: 0.28,
);
final TextStyle btn300 = commonStyle.copyWith(
  fontFamily: 'Roboto',
  fontSize: 16,
  fontWeight: FontWeight.w600,
  letterSpacing: 0.24,
);

final TextStyle btn300Lined = commonStyle.copyWith(
  fontFamily: 'Roboto',
  fontSize: 16,
  fontWeight: FontWeight.w600,
  decoration: TextDecoration.underline,
  letterSpacing: 0.24,
);

//Label
final TextStyle label00 = commonStyle.copyWith(
  fontFamily: 'Roboto',
  fontSize: 14,
  fontWeight: FontWeight.w500,
  letterSpacing: 0.32,
);

final TextStyle label200 = commonStyle.copyWith(
  fontFamily: 'Roboto',
  fontSize: 14,
  fontWeight: FontWeight.w500,
  letterSpacing: 0.28,
);

final TextStyle label300Light = commonStyle.copyWith(
  fontFamily: 'RobotoLabel',
  fontSize: 12,
  fontWeight: FontWeight.w500,
  letterSpacing: 0.24,
);

final TextStyle label300Heavy = commonStyle.copyWith(
  fontFamily: 'RobotoLabel',
  fontSize: 12,
  fontWeight: FontWeight.w600,
  letterSpacing: 0.24,
);