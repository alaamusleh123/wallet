import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_wallet_project/screens/auth/code_number_screen.dart';
import 'package:my_wallet_project/screens/auth/reset_password_screen.dart';

import '../../widgets/gradient_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  late TextEditingController _phoneTextController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _phoneTextController=TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _phoneTextController.dispose();
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
              AppLocalizations.of(context)!.forget_password,
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
            AppLocalizations.of(context)!.phone_number,
            style: GoogleFonts.crimsonText(
                color: Color(0xFF162a40),
                // fontWeight: FontWeight.w200,
                fontSize: 17
            ),
          ),
          SizedBox(height: 50,),
          TextField(
            controller: _phoneTextController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.enter_phone,
                prefixIcon: Icon(Icons.numbers),
                prefixIconColor: Color(0xFFa35c6e)
            ),
          ),
          SizedBox(height: 20,),
          //SizedBox(height: 5,),

          SizedBox(height: 30,),
          ElevatedButton(
            onPressed: _performForgetPassword,
            child:Text(
              AppLocalizations.of(context)!.submit,
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
  void _performForgetPassword(){
    if(_checkData()){
      _forgetPassword();
    }
  }

  bool _checkData(){
    if(_phoneTextController.text.isNotEmpty){
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

  void _forgetPassword() async{
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context)=>CodeNumberScreen(phone: _phoneTextController.text)),
    );
  }
}
