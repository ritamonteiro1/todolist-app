import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../constants/constant_colors.dart';
import '../constants/constant_fonts.dart';
import '../generated/l10n.dart';
import '../presentation/task/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: ConstantFonts.poppinsRegular,
          primarySwatch: Colors.blue,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: ConstantColor.primaryColor,
            secondary: ConstantColor.secondaryColor,
          ),
          toggleableActiveColor: ConstantColor.primaryColor,
          iconTheme: const IconThemeData(
            color: ConstantColor.primaryColor,
          ),
          listTileTheme: const ListTileThemeData(
            iconColor: ConstantColor.primaryColor,
          ),
        ),
        home: const HomeScreen(),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
      );
}
