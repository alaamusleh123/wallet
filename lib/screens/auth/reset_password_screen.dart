import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/gradient_text.dart';
class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key, required this.phone }) : super(key: key);
  final String phone;

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late TextEditingController _newPasswordTextController;
  late TextEditingController _newPasswordConfirmationTextController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _newPasswordTextController=TextEditingController();
    _newPasswordConfirmationTextController=TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _newPasswordTextController.dispose();
    _newPasswordConfirmationTextController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF162a40)),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        children: [
          GradientText(
              AppLocalizations.of(context)!.reset_password,
              style:  GoogleFonts.crimsonText(
                  fontWeight: FontWeight.bold,
                  fontSize: 40
              ),
              gradient: LinearGradient(
                  colors: [
                    Color(0xFF162a40),
                    Color(0xFFa35c6e),
                    Color(0xFF162a40),
                    Color(0xFFa35c6e),
                    Color(0xFFe9abb1)
                  ]
              )),
          SizedBox(height: 10,),
          Text(
            AppLocalizations.of(context)!.new_password,
            style: GoogleFonts.crimsonText(
                color: Color(0xFF162a40),
                // fontWeight: FontWeight.w200,
                fontSize: 17
            ),
          ),
          SizedBox(height: 30,),
          TextField(
            controller: _newPasswordTextController,
            keyboardType: TextInputType.text,
            obscureText: true,
            decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.news_password,
                prefixIcon: Icon(Icons.lock),
                prefixIconColor: Color(0xFFa35c6e)
            ),
          ),
          SizedBox(height: 30,),
          TextField(
            controller: _newPasswordConfirmationTextController,
            keyboardType: TextInputType.text,
            obscureText: true,
            decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.confirmation_pass,
                prefixIcon: Icon(Icons.lock),
                prefixIconColor: Color(0xFFa35c6e)
            ),
          ),
          SizedBox(height: 20,),
          //SizedBox(height: 5,),

          SizedBox(height: 30,),
          ElevatedButton(
            onPressed: (){},
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
    if(_newPasswordTextController.text.isNotEmpty&&
        _newPasswordConfirmationTextController.text.isNotEmpty){
      return true;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
            'Enter Phone Number'
        ),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
    return false;
  }

  void _login() async{

  }
}
