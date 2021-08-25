import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/resources/services/ThemeService.dart';
import 'package:untitled/resources/utils/ColorConstants.dart';
import 'dart:async';

import 'package:untitled/ui/HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer timer;


    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: ColorConstants.DEFAULT_COLOR
    ));

    timer = new Timer(new Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Container(
          color: Colors.red,
          child: Center(
            child: Image.asset("images/logo.png" , scale: 1.0,),
          ),
        )
    );
  }
}
