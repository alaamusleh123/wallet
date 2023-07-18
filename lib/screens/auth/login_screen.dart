import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_wallet_project/widgets/gradient_text.dart';

import '../../pref/shared_pref_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;
  bool _obsecureText= true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailTextController=TextEditingController();
    _passwordTextController=TextEditingController();
  }
  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
       elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF162a40)),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        children: [
          GradientText(
              AppLocalizations.of(context)!.hello,
              style:  GoogleFonts.crimsonText(
                  fontWeight: FontWeight.bold,
                  fontSize: 40
              ),
              gradient: LinearGradient(
                colors: [
                  Color(0xFF162a40),
                  Color(0xFFa35c6e),
                  Color(0xFFa35c6e),
                  Color(0xFFa35c6e),
                  Color(0xFFe9abb1)
                ]
              )),
          SizedBox(height: 10,),
          Text(
            AppLocalizations.of(context)!.enter_email_and_password,
            style: GoogleFonts.crimsonText(
              color: Color(0xFF162a40),
               // fontWeight: FontWeight.w200,
                fontSize: 20
            ),
          ),
          SizedBox(height: 20,),
          TextField(
            controller: _emailTextController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.email,
              prefixIcon: Icon(Icons.email),
              prefixIconColor: Color(0xFFa35c6e)
            ),
          ),
          SizedBox(height: 20,),
           TextField(
            controller: _passwordTextController,
            keyboardType: TextInputType.text,
            obscureText: _obsecureText,
            decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.password,
                prefixIcon: Icon(Icons.lock),
               // suffixIcon: Icon(Icons.remove_red_eye),
                suffixIcon:IconButton(
                    onPressed: (){
                      setState(() {
                        _obsecureText=!_obsecureText;
                      });
                    }, icon: Icon(_obsecureText ? Icons.visibility_off :Icons.visibility)),
                prefixIconColor: Color(0xFFa35c6e),
                suffixIconColor: Color(0xFFa35c6e)
            ),
          ),
          //SizedBox(height: 5,),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: TextButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/forget_password_screen');
                },
                child: Text(
                  AppLocalizations.of(context)!.forget_password,
                  style: GoogleFonts.crimsonText(
                      color: Color(0xFF162a40),
                      // fontWeight: FontWeight.w200,
                      fontSize: 13
                  ),
                )
            ),
          ),
          SizedBox(height: 30,),
          ElevatedButton(
              onPressed: _performLogin,
              child:Text(
                AppLocalizations.of(context)!.login,
                style: GoogleFonts.crimsonText(
                    color: Colors.white,
                    fontWeight: FontWeight.w200,
                    fontSize: 20
                ),
              ) ,
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
    );
  }
  void _performLogin(){
    if(_checkData()){
      _login();
    }
  }

  bool _checkData(){
    if(_emailTextController.text.isNotEmpty&& _passwordTextController.text.isNotEmpty){
      return true;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
            'Enter email & password'
        ),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
    return false;
  }

  void _login() async{
   await SharedPrefController().save(email: _emailTextController.text);
   // Navigator.pushReplacementNamed(context, '/wallet_screen');

   ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(content: Text('logged in successfully'),
         behavior: SnackBarBehavior.floating,
         backgroundColor: Colors.green,
       )).closed.then((value) => Navigator.pushReplacementNamed(context, '/wallet_screen'));
  }
 }
