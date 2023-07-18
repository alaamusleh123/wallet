import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_wallet_project/pref/shared_pref_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      String route= SharedPrefController().loggedIn ? '/wallet_screen' : '/home_screen';
     Navigator.pushReplacementNamed(context, route);
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.topEnd,
            end: AlignmentDirectional.bottomStart,
            // begin: Alignment.topLeft,
            // end: Alignment(0.8,1),
            colors: [
              Color(0xFF162a40),
              Color(0xFFa35c6e),
              Color(0xFFe9abb1)
            ],
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
                width: 200,
                child: Image.asset('images/logo.png',)),
            Text(
              AppLocalizations.of(context)!.my_wallet,
              style: GoogleFonts.crimsonText(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30
              ),
            ),
          ],
        ),
      ),
    );
  }
}
