import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_wallet_project/pref/shared_pref_controller.dart';
import 'package:my_wallet_project/provider/language_provider.dart';
import 'package:my_wallet_project/screens/about_us.dart';
import 'package:my_wallet_project/screens/auth/forget_password_screen.dart';
import 'package:my_wallet_project/screens/auth/login_screen.dart';
import 'package:my_wallet_project/screens/auth/register_screen.dart';
import 'package:my_wallet_project/screens/auth/reset_password_screen.dart';
import 'package:my_wallet_project/screens/home_screen.dart';
import 'package:my_wallet_project/screens/launch_screen.dart';
import 'package:my_wallet_project/screens/wallet_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initpref();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LanguageProvider>(create: (context)=> LanguageProvider()),
      ],
      child:MyMaterialApp(),
    );
  }
}
class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [
        Locale('en'),
        Locale('ar')
      ],
      locale: Locale(Provider.of<LanguageProvider>(context).language),
      initialRoute: '/launch_screen',//'/launch_screen'
      routes: {
        '/launch_screen' :(context)=>LaunchScreen(),
        '/login_screen' :(context)=>LoginScreen(),
        '/home_screen':(context)=>HomeScreen(),
        '/register_screen':(context)=>RegisterScreen(),
        '/wallet_screen':(context)=>WalletScreen(),
        '/forget_password_screen' : (context)=> ForgetPasswordScreen(),
        '/about_us' : (context)=> AboutUs(),

      },
    );
  }
}
