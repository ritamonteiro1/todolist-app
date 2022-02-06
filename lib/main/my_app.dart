import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import '../constants/constant_colors.dart';
import '../constants/constant_fonts.dart';
import '../di/setup_provider.dart';
import '../generated/l10n.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: providers,
        child: MaterialApp(
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
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          onGenerateRoute: (settings) => FluroRouter.appRouter
              .matchRoute(context, settings.name, routeSettings: settings)
              .route,
          supportedLocales: S.delegate.supportedLocales,
        ),
      );
}
