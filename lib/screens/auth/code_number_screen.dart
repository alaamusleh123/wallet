import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_wallet_project/screens/auth/reset_password_screen.dart';
import 'package:my_wallet_project/widgets/code_text_field.dart';
import '../../widgets/gradient_text.dart';
class CodeNumberScreen extends StatefulWidget {
  const CodeNumberScreen({Key? key,required this.phone }) : super(key: key);
  final String phone;
  @override
  State<CodeNumberScreen> createState() => _CodeNumberScreenState();
}

class _CodeNumberScreenState extends State<CodeNumberScreen> {
  late TextEditingController _phoneTextController;

  late TextEditingController _firstCodeTextController;
  late TextEditingController _secondCodeTextController;
  late TextEditingController _thirdCodeTextController;
  late TextEditingController _fourthCodeTextController;

  late FocusNode _firstFocusNode;
  late FocusNode _secondFocusNode;
  late FocusNode _thirdFocusNode;
  late FocusNode _fourthFocusNode;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _phoneTextController=TextEditingController();

    _firstCodeTextController=TextEditingController();
    _secondCodeTextController=TextEditingController();
    _thirdCodeTextController=TextEditingController();
    _fourthCodeTextController=TextEditingController();

    _firstFocusNode=FocusNode();
    _secondFocusNode=FocusNode();
    _thirdFocusNode=FocusNode();
    _fourthFocusNode=FocusNode();

  }
  @override
  void dispose() {
    // TODO: implement dispose
    _phoneTextController.dispose();

    _firstCodeTextController.dispose();
    _secondCodeTextController.dispose();
    _thirdCodeTextController.dispose();
    _fourthCodeTextController.dispose();

    _firstFocusNode.dispose();
    _secondFocusNode.dispose();
    _thirdFocusNode.dispose();
    _fourthFocusNode.dispose();
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
              AppLocalizations.of(context)!.enter_code,
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
            AppLocalizations.of(context)!.sent_code,
            style: GoogleFonts.crimsonText(
                color: Color(0xFF162a40),
                // fontWeight: FontWeight.w200,
                fontSize: 17
            ),
          ),
          SizedBox(height: 50,),
         Row(
           children: [
             Expanded(
               child: CodeTextField(
                   textEditingController: _firstCodeTextController,
                   focusNode: _firstFocusNode,
                   onChange: (String value){
                     if(value.isNotEmpty){
                       _secondFocusNode.requestFocus();
                     }
                   }),
             ),
             SizedBox(width: 9,),
             Expanded(
               child: CodeTextField(
                   textEditingController: _secondCodeTextController,
                   focusNode: _secondFocusNode,
                   onChange: (String value){
                     value.isNotEmpty ? _thirdFocusNode.requestFocus()
                         : _firstFocusNode.requestFocus();
                   }),
             ),
             SizedBox(width: 9,),
             Expanded(
               child: CodeTextField(
                   textEditingController: _thirdCodeTextController,
                   focusNode: _thirdFocusNode,
                   onChange: (String value){
                     value.isNotEmpty ? _fourthFocusNode.requestFocus()
                         : _secondFocusNode.requestFocus();
                   }),
             ),
             SizedBox(width: 9,),
             Expanded(
               child: CodeTextField(
                   textEditingController: _fourthCodeTextController,
                   focusNode: _fourthFocusNode,
                   onChange: (String value){
                     if(value.isNotEmpty){
                       _thirdFocusNode.requestFocus();
                     }
                   }),
             ),
           ],
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
      MaterialPageRoute(builder: (context)=>ResetPasswordScreen(phone: _phoneTextController.text)),
    );
  }
}


