
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MdSnsText extends Text {
  MdSnsText(
    super.data, {
    super.key,
    super.textAlign,
    super.maxLines,
    Color color = Colors.black,
    double? height,
    double? letterSpacing,
    double size = 14,
    // double weight = 400,
    FontWeight fontWeight = FontWeight.w400,
    FontStyle? fontStyle,
    TextDecoration? decoration,
    TextOverflow? textOverflow,
  }) : super(
         textDirection: TextDirection.ltr,
         overflow:textOverflow ,
         style: GoogleFonts.dmSans(
           // fontFamily: 'Montserrat',
           color: color,
           fontSize: size,
           height: height,
           fontStyle: fontStyle,
           fontWeight: fontWeight,
           // overflow: textOverflow,
           decoration: decoration,
           decorationColor: color,
           letterSpacing: letterSpacing,
           // fontVariations: [FontVariation.weight(weight)],
         ),
       );
}
