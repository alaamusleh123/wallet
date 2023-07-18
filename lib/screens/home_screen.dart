import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_wallet_project/provider/language_provider.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF162a40),
        onPressed:(){
          Provider.of<LanguageProvider>(context,listen: false)
              .changeLanguage();
        },
        child: Icon(Icons.language),
      ),
      body:Container(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.centerLeft,
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset('images/logo.png',)
            ),
            SizedBox(height: 15,),
            Text(
              AppLocalizations.of(context)!.welcome,
              style: GoogleFonts.crimsonText(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25
              ),
            ),
            SizedBox(height: 10,),
            Text(
              AppLocalizations.of(context)!.easiest_way_to_transfer_balance,
              style: GoogleFonts.crimsonText(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),
            ),
            SizedBox(height: 25,),
            ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/login_screen');
                },
                child: Text(
                  AppLocalizations.of(context)!.login,
                  style: GoogleFonts.crimsonText(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
                style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF162a40),
                minimumSize: Size(50, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(10),
                    topStart: Radius.circular(10),
                  )
              )
          ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/register_screen');
              },
              child: Text(
                AppLocalizations.of(context)!.register,
                style: GoogleFonts.crimsonText(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF162a40),
                  minimumSize: Size(50, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.only(
                        bottomEnd: Radius.circular(10),
                        topStart: Radius.circular(10),
                      )
                  )
              ),
            ),

          ],
        ),
      ),
    );
  }
}
