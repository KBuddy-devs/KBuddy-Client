import 'package:flutter/material.dart';

// 주 색상(INDIGO) - 메인(800)
const PRIMARY_COLOR = Color(0xFF6952f9);
const INDIGO_900 = Color(0xFF5a44d7);
const INDIGO_1000 = Color(0xFF4937b3);

// LIME
const LIME_800 = Color(0xff30FF21);
const LIME_900 = Color(0xff2CEC1F);
const LIME_1000 = Color(0xff29D71C);

const WHITE = Color(0xffffffff);
const BLACK = Color(0x00000000);

// LIGHTGRAY
const LIGHTGRAY_300 = Color(0xffD5D5D5);
const LIGHTGRAY_400 = Color(0xffB1B1B1);
const LIGHTGRAY_600 = Color(0xff6D6D6D);
const LIGHTGRAY_800 = Color(0xff222222);
const LIGHTGRAY_900 = Color(0xff111111);

// DARKGRAY
const DARKGRAY_50 = Color(0xff1d1d1d);
const DARKGRAY_200 = Color(0xff3f3f3f);
const DARKGRAY_400 = Color(0xff707070);
const DARKGRAY_700 = Color(0xffd1d1d1);
const DARKGRAY_800 = Color(0xffebebeb);

// GREEN
const GREEN_900 = Color(0xff007a4d);
const GREEN_1000 = Color(0xff00653e);
const GREEN_1100 = Color(0xff005132);

// RED
const RED_900 = Color(0xffd31510);
const RED_1000 = Color(0xffb40000);
const RED_1100 = Color(0xff930000);

// GRADIENT
const PRIMARY_GRADIENT = LinearGradient(
  colors: [Color(0xFF8886FF), Color(0xFF6952F9)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
var GRAY_GRADIENT = LinearGradient(
  colors: [
    const Color(0xFFB1B1B1).withOpacity(0.5), // 50% opacity
    const Color(0xFF6952F9).withOpacity(1.0), // 100% opacity
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
