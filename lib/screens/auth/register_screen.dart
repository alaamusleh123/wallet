import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../pref/shared_pref_controller.dart';
import '../../widgets/gradient_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;
  late TextEditingController _phoneTextController;
  late TextEditingController _idTextController;
  bool _obsecureText= true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailTextController=TextEditingController();
    _passwordTextController=TextEditingController();
    _phoneTextController=TextEditingController();
    _idTextController=TextEditingController();
  }
  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _phoneTextController.dispose();
    _idTextController.dispose();
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
              AppLocalizations.of(context)!.create_account,
              style:  GoogleFonts.crimsonText(
                  fontWeight: FontWeight.bold,
                  fontSize: 30
              ),
              gradient: LinearGradient(
                  colors: [
                    Color(0xFF162a40),
                    Color(0xFFa35c6e),
                    Color(0xFF162a40),
                    Color(0xFF162a40),
                    Color(0xFFa35c6e),
                    Color(0xFFe9abb1)
                  ]
              )),
          SizedBox(height: 10,),
          // Text(
          //   AppLocalizations.of(context)!.enter_email_and_password,
          //   style: GoogleFonts.crimsonText(
          //       color: Color(0xFF162a40),
          //       // fontWeight: FontWeight.w200,
          //       fontSize: 20
          //   ),
          // ),
          SizedBox(height: 20,),
          TextField(
            controller: _emailTextController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.enter_email,
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
                //suffixIcon: Icon(Icons.remove_red_eye),
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
          SizedBox(height: 20,),
          TextField(
            controller: _phoneTextController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.enter_phone,
                prefixIcon: Icon(Icons.phone),
                prefixIconColor: Color(0xFFa35c6e),
            ),
          ),
          SizedBox(height: 20,),
          TextField(
            controller: _idTextController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.enter_number,
              prefixIcon: Icon(Icons.numbers),
              prefixIconColor: Color(0xFFa35c6e),
            ),
          ),
          //SizedBox(height: 5,),
          SizedBox(height: 30,),
          ElevatedButton(
            onPressed: _performRegister,
            child:Text(
              AppLocalizations.of(context)!.register,
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
  void _performRegister(){
    if(_checkData()){
      _register();
    }
  }

  bool _checkData(){
    if(_emailTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty &&
        _phoneTextController.text.isNotEmpty &&
        _idTextController.text.isNotEmpty
    ){
      return true;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
            'Enter required data!'
        ),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
    return false;
  }

  void _register() async{
    await SharedPrefController().save(email: _emailTextController.text);
    Navigator.pushReplacementNamed(context, '/login_screen');
  }
}
