import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primary91 = Color(0xff65C0D4);
const Color primary20 = Color(0xff3D737F);
const Color primary40 = Color(0xff65C0D4);
const Color primary60 = Color(0xffA3D9E5);
const Color primary90 = Color(0xffE0F2F6);

const Color secondary20 = Color(0xff997047);
const Color secondary40 = Color(0xffFFBA76);
const Color secondary60 = Color(0xffFFD6AD);
const Color secondary90 = Color(0xffFFF1E4);

const paddingLabel = EdgeInsets.only(left: 13.0, right: 13.0, top: 20, bottom: 14);
const myPaddingField = EdgeInsets.symmetric(horizontal: 13.0);
const myPaddingButton = EdgeInsets.only(left: 13.0, right: 13.0, top: 20, bottom: 30);

class AppTheme {
  AppTheme();

  ThemeData theme() => ThemeData(
        colorSchemeSeed: primary91,
        secondaryHeaderColor: secondary40,
        textTheme: GoogleFonts.poppinsTextTheme(),
        primaryTextTheme: const TextTheme().copyWith(
          headlineLarge: const TextStyle(
            color: primary40,
            fontWeight: FontWeight.w600,
            fontSize: 25.0,
          ),
          headlineMedium: const TextStyle(
            color: primary40,
            fontSize: 14.0,
          ),
          bodyLarge: const TextStyle(
            color: primary40,
            fontSize: 12.0,
            fontWeight: FontWeight.w600,
          ),
          bodyMedium: const TextStyle(
            color: primary20,
            fontSize: 14.0,
          ),
          displayMedium: const TextStyle(
            color: primary60,
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
              backgroundColor: primary40,
              foregroundColor: Colors.white,
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              )),
        ),
      );
}
