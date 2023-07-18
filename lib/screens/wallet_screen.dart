import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_wallet_project/models/bn_item.dart';
import 'package:my_wallet_project/pref/shared_pref_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_wallet_project/screens/main_screen.dart';
import 'package:my_wallet_project/screens/profile_screen.dart';
import 'package:my_wallet_project/screens/setting_screen.dart';

import '../models/category.dart';
class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  int _currentIndex=0;
  final List<BnItem> _bnItems=<BnItem>[
   const BnItem(widget: MainScreen()),
   const BnItem(widget: ProfileScreen()),
   const BnItem(widget: SettingScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        //iconTheme: IconThemeData(color: Colors.black),
        actionsIconTheme: IconThemeData(color: Colors.white),
        // actions: [
        //   Visibility(
        //     visible: true,
        //     child: IconButton(
        //     onPressed: () async {
        //       await _confirmLogout();
        //     },
        //     icon: Icon(Icons.logout, color: (Color(0xFF162a40)),),
        //   ),)
        // ],

      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xFF162a40),
              spreadRadius: 0,
              blurRadius: 20
            )
          ]
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0)
          ),
          child: BottomNavigationBar(
            onTap: (int index){
              setState(()=> _currentIndex= index);
            },
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            showUnselectedLabels: false,
            selectedItemColor: Color(0xFFe9abb1),
            unselectedItemColor: Color(0xFF162a40),
            backgroundColor: Colors.white,
            //fixedColor: Color(0xFFe9abb1),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                activeIcon: Icon(Icons.home),
                label: 'Home',
                  backgroundColor: Colors.white
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  activeIcon: Icon(Icons.person),
                  label: 'Profile',
                backgroundColor: Colors.white
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  activeIcon: Icon(Icons.settings),
                  label: 'Settings',
                  backgroundColor: Colors.white
              ),
            ],
          ),
        ),
      ),

      body: _bnItems[_currentIndex].widget

    );
  }
  // Future<void> _confirmLogout() async{
  //   bool? loggedOut = await showDialog(
  //       context: context,
  //       builder: (context){
  //         return AlertDialog(
  //           title: Text(
  //             AppLocalizations.of(context)!.logout,
  //             style: GoogleFonts.crimsonText(
  //                 color: Color(0xFF162a40),
  //                 // fontWeight: FontWeight.w200,
  //                 fontSize: 20,
  //               fontWeight: FontWeight.bold
  //             ),
  //           ),
  //           content: Text(
  //             AppLocalizations.of(context)!.are_you_sure,
  //             style: GoogleFonts.crimsonText(
  //                 color: Color(0xFFa35c6e),
  //                 // fontWeight: FontWeight.w200,
  //                 fontSize: 15
  //             ),
  //           ),
  //           actions: [
  //             TextButton(
  //                 onPressed: (){
  //                   Navigator.pop(context,true);
  //                 },
  //                 child:  Text(AppLocalizations.of(context)!.yes,
  //                   style: GoogleFonts.crimsonText(
  //                       color: Color(0xFF162a40),
  //                       // fontWeight: FontWeight.w200,
  //                       fontSize: 15
  //                   ),
  //                 ),
  //             ),
  //             TextButton(
  //               onPressed: (){
  //                 Navigator.pop(context,false);
  //               },
  //               child:  Text(AppLocalizations.of(context)!.no,
  //                 style: GoogleFonts.crimsonText(
  //                     color: Color(0xFF162a40),
  //                     // fontWeight: FontWeight.w200,
  //                     fontSize: 15
  //                 ),
  //               ),
  //             ),
  //           ],
  //         );
  //       }
  //   );
  //   if(loggedOut ?? false){
  //     await logout();
  //   }
  // }
  // Future<void> logout() async {
  //   bool cleared= await SharedPrefController().clear();
  //   if(cleared){
  //     Navigator.pushReplacementNamed(context, '/home_screen');
  //   }
  // }
}
