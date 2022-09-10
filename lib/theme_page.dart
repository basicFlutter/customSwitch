import 'dart:async';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:theme_animation/sharepreferences/sharepref.dart';
import 'package:theme_animation/style.dart';
import 'package:theme_animation/theme_switch.dart';

class ThemePage extends StatefulWidget {
  const ThemePage({Key? key}) : super(key: key);

  @override
  State<ThemePage> createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage>   with TickerProviderStateMixin{
  late AnimationController scaleController;
  late Animation<double> scaleAnimation;
  bool isDark = false ;

  @override
  void initState() {
    super.initState();
    getThemeFlagFromSharePref();
  }

  void getThemeFlagFromSharePref()async{
    isDark = await SharePref.getBool('themeFlag');
  }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Style.lightTheme,
      darkTheme: Style.darkTheme,
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              SizedBox(
                width: screenWidth * 0.042,
                height: screenHeight * 0.042,
                child: SvgPicture.asset("assets/images/insta.svg",
                    color: isDark ? ThemeData.dark().iconTheme.color!.withOpacity(0.8) : ThemeData.light().iconTheme.color!.withOpacity(0.8)
                ),
              ),
              SizedBox(
                width: screenWidth * 0.02,
              ),
               const Text("basic_flutter",),
            ],
          ),
          centerTitle: true,
        ),
        body: Center(
          child: ThemeSwitch(
            /// You can change the color of the shadows
            width: screenWidth*0.3,
            height: screenHeight*0.07,
            borderRadius: 30 ,
            iconSize: screenHeight*0.03,
            isDark: isDark,
            onTap: () async {
              isDark = isDark ? false : true;
              SharePref.saveBool('themeFlag', isDark);
              setState((){
              });
            },
          )
        ),
      ),
    );

  }
}
