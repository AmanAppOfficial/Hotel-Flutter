import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/models/HomeModel.dart';
import 'package:untitled/resources/services/HomeService.dart';
import 'package:untitled/resources/services/ThemeService.dart';

class HomeScreenBloc{

  final _homeController = StreamController<HomeModel>();
  Stream<HomeModel> get homeStream => _homeController.stream;

  HomeScreenBloc(){
    getHomeScreenData();
  }

  getHomeScreenData() async{
    HomeModel homeModel = await HomeService.getHomeDetails();
    _homeController.sink.add(homeModel);
  }

  void dispose(){
    _homeController.close();
  }

}


class ThemeBloc{
  final _themeController = StreamController<Color>();
  Stream<Color> get themeStream => _themeController.stream;

  ThemeBloc(){
    getTheme();
  }

  getTheme() async{
    Color homeColor = await ThemeService.getTheme();
    _themeController.sink.add(homeColor);
  }

  void dispose(){
    _themeController.close();

  }

}