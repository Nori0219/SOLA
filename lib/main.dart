import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sola/Constants/constants.dart';
import 'package:sola/UI/calendar.dart';
import 'package:sola/UI/home_page.dart';
import 'package:sola/UI/introduction_page.dart';
import 'package:sola/UI/moon_page.dart';
import 'package:sola/UI/unimplemented_page.dart';
import 'package:sola/UI/widgets/introduction_widget.dart';
import 'package:sola/UI/widgets/splash_screen.dart';
import 'package:sola/component/bottm/bottom_navy_bar.dart';
import 'package:provider/provider.dart';
import 'package:sola/config/MyTheme.dart';
import 'package:sola/config/config_init.dart';
import 'package:sola/UI/config.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting().then((_) => 
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<MyTheme>( //プロバイダー名
          create: (context) => MyTheme(),//プロバイダー名
        ),
        ChangeNotifierProvider<ConfigInit>( 
          create: (context) => ConfigInit(),
        ),
      ],
      child: MaterialApp(
        home: MyApp(),
      ),
    ),
    )
  );
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MyTheme(),
      child: Consumer<MyTheme>(
        builder: (context, theme, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme.current,
            title: 'Flutter Demo',
            routes: <String, WidgetBuilder>{
              '/home': (context) => HomePage(),
              '/splash_screen': (context) => AnimatedSplashScreen(),
              '/moon': (context) => MoonPage(),
              '/calendar': (context) => CalendarScreen(),
              '/unimplement': (context) => UnimplementedPage(),
              '/introducton': (context) => IntoductionWidget(),
              '/whatSOLA': (context) => IntroductionPage(),
              '/config': (context) => ConfigPage(),
            },
            initialRoute: '/splash_screen',
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
