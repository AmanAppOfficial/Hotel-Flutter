import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/resources/utils/ColorConstants.dart';
import 'dart:async';

class ThemeService{

  static Color homeColor = ColorConstants.DEFAULT_COLOR;


  static Future<Color> getTheme() async{
      homeColor =  ColorConstants.DEFAULT_COLOR;
      return homeColor;
  }

}