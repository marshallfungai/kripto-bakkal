import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'AppInit.dart';
import 'constants/color_constant.dart';
import 'screens/home_screen.dart';

void main()=>runApp(
    EasyLocalization(
      child: MyApp(),
      path: 'assets/translations',
      supportedLocales: MyApp.list,
      useOnlyLangCode: true,
      fallbackLocale: Locale('en', 'UK'),
      startLocale: Locale('tr', 'TR'),
    )
);

class MyApp extends StatefulWidget {

  static const list = [
    Locale('en', 'UK'),
    Locale('tr', 'TR'),
  ];

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var _checkIsFirstSeen;
  var _checkStoredLocale;
  var _locale;
  var windowLocale;
  //windowLocale  = ui.window.locale;

  void setLocale(context, lang){
    print("its here $lang");
    context.locale = Locale(lang);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        EasyLocalization.of(context).delegate
      ],
      onGenerateTitle: (context)=>tr('app_name'),
      theme: ThemeData(
        accentColor: kAccentColor,
        backgroundColor: kBackgroundColor
      ),
      home: AppInit(),
    );
  }
}



