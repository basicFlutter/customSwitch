import 'dart:async';

import 'package:flutter/material.dart';

class ThemeSwitch extends StatefulWidget  {
  ThemeSwitch({Key? key ,
    required this.onTap ,
    this.isDark = false ,
    required this.height ,
    required this.width
    ,required this.borderRadius,
    this.iconSize,
    this.shadowDarkColorInDarkTheme,
    this.shadowDarkColorInLightTheme,
    this.shadowLightColorInDarkTheme,
    this.shadowLightColorInLightTheme

  }) : super(key: key);
  GestureTapCallback  onTap ;
  bool isDark ;
  double width  , height , borderRadius  ;
  double? iconSize;

  Color ? shadowLightColorInLightTheme , shadowDarkColorInLightTheme  , shadowLightColorInDarkTheme , shadowDarkColorInDarkTheme;
  Color ?  thumbShadowLightColorInLightTheme ,  thumbShadowDarkColorInLightTheme  ,  thumbShadowLightColorInDarkTheme ,  thumbShadowDarkColorInDarkTheme;

  @override
  State<ThemeSwitch> createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> with TickerProviderStateMixin {


  late Animation<double> scaleAnimation;
  late AnimationController scaleController;


  @override
  void initState() {
    super.initState();
    scaleController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Timer(const Duration(milliseconds: 300), () {
            scaleController.reset();
            // scaleAnimation = Tween<double>(begin: 10.0, end: 0.0).animate(scaleController);
          },
          );
        }
      },
      );
    scaleAnimation = Tween<double>(begin: 1, end: 1.5).animate(scaleController);
  }
  double turns = 0.0;

  void _changeRotation() {
    setState(() => turns += 1.0 );
  }


  double widthContainer = 50;
  double heightContainer = 50;

  double cScale = 1;
  ThemeMode themeMode = ThemeMode.dark;



  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.transparent,
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: [

          Align(
            alignment: Alignment.center,
            child:  AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              width: widget.width*0.9,
              height: widget.height*0.85,

              decoration: BoxDecoration(
                  color:widget.isDark ? ThemeData.dark().scaffoldBackgroundColor : ThemeData.light().scaffoldBackgroundColor,

                  borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
                  boxShadow: [
                    BoxShadow(
                      // color:widget.isDark? Colors.black87 : Colors.grey[400]!,
                      color:widget.isDark? widget.shadowDarkColorInDarkTheme ?? Colors.black87 : widget.shadowDarkColorInLightTheme??Colors.grey[400]!,
                      spreadRadius: 0,
                      blurRadius: 3,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                    BoxShadow(
                      color: widget.isDark ? widget.shadowLightColorInDarkTheme ?? Colors.grey[700]!  : widget.shadowLightColorInLightTheme ?? Colors.grey[300]!,
                      spreadRadius: 0,
                      blurRadius: 1,
                      offset: Offset(0, -2), // changes position of shadow
                    ),
                  ]

              ),
            ),
          ),

          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap:(){
              widget.onTap();
              _changeRotation();
              scaleController.forward();
              setState((){
              });
            },

            child : AnimatedAlign(
              alignment: widget.isDark ? Alignment.centerRight : Alignment.centerLeft,
              curve: Curves.fastOutSlowIn,
              duration: const Duration(milliseconds: 500),
              child: AnimatedBuilder(
                  animation: scaleAnimation,

                  builder: (context, child) => Transform.scale(
                    scale: scaleAnimation.value,
                    child:  AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: widget.height,
                      height: widget.height,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:widget.isDark ? ThemeData.dark().scaffoldBackgroundColor : ThemeData.light().scaffoldBackgroundColor,
                          boxShadow: [
                            BoxShadow(
                              color: widget.isDark ? widget.thumbShadowLightColorInDarkTheme ?? Colors.grey[800]! : widget.thumbShadowDarkColorInLightTheme?? Colors.grey[300]!  ,
                              spreadRadius: 0,
                              blurRadius: 3,
                              offset: const Offset(0, -3), // changes position of shadow
                            ),
                            BoxShadow(
                              color:widget.isDark ? widget.thumbShadowDarkColorInDarkTheme ?? Colors.black87 : widget.thumbShadowLightColorInLightTheme ?? Colors.grey[400]!,
                              spreadRadius: 0,
                              blurRadius: 1,
                              offset:Offset(0, 3), // changes position of shadow
                            ),
                          ]
                      ),
                      child:  AnimatedRotation(
                        turns: turns,
                        duration: const Duration(milliseconds: 500),
                        child: widget.isDark ? FittedBox(
                          child: SizedBox(
                              width: widget.height,
                              height: widget.height,
                              child: Icon(Icons.dark_mode_sharp,size:widget.iconSize!=null ? widget.iconSize! > widget.height ? widget.height : widget.iconSize :15,)),
                        ) : Icon(Icons.sunny ,size:widget.iconSize!=null ? widget.iconSize! > widget.height ? widget.height : widget.iconSize :15),
                      ),

                    ),
                  )

              ),
            ),
          )





        ],
      ),
    );
  }
}

