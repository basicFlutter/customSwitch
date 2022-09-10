import 'package:flutter/material.dart';

class Style {

  static  ThemeData lightTheme = ThemeData(

    brightness: Brightness.light,

    appBarTheme:  AppBarTheme(
        color: Colors.white54,
      titleTextStyle:  TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey[700]),
      iconTheme: IconThemeData(
        color: Colors.grey[900]
      )
    ),

    iconTheme: IconThemeData(color: Colors.grey[700] ,),
    textTheme:  TextTheme(
      headline1: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey[900]),
      headline2: TextStyle(fontSize: 15, fontWeight: FontWeight.bold , color: Colors.grey[800] ),
      headline3:const TextStyle(fontSize: 15, fontWeight: FontWeight.bold , color: Colors.indigoAccent ),
      headline4:const TextStyle(fontSize: 15, fontWeight: FontWeight.bold , color: Colors.deepPurple ),
      headline5:const TextStyle(fontSize: 15 , color: Colors.deepPurple ), ///
      bodyText1: TextStyle(fontSize: 15,  color: Colors.grey[800]),
      bodyText2:const TextStyle(fontSize: 15, color: Colors.grey),
      headlineLarge: const TextStyle(fontSize: 13, color: Colors.deepPurple),
    )  ,
  );



  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme:  AppBarTheme(
      titleTextStyle:  TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey[400]),
        iconTheme: IconThemeData(
            color: Colors.grey[500]
        )
    ),

    iconTheme: IconThemeData(color: Colors.grey[500] ,),
    textTheme:  TextTheme(
      headline1: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey[700]),
      headline2:const TextStyle(fontSize: 15, fontWeight: FontWeight.bold , color: Colors.grey ),
      headline3:const TextStyle(fontSize: 15, fontWeight: FontWeight.bold , color: Colors.indigoAccent ),
      headline4:const TextStyle(fontSize: 15, fontWeight: FontWeight.bold , color: Colors.grey ),
      headline5: TextStyle(fontSize: 15 , color: Colors.grey[500] ),
      bodyText1:const TextStyle(fontSize: 15,  color: Colors.grey),
      bodyText2: TextStyle(fontSize: 15, color: Colors.grey[700]),
      headlineLarge:const  TextStyle(fontSize: 13, color:  Colors.grey),
    ),
  );



}