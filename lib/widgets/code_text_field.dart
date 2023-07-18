import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CodeTextField extends StatelessWidget {
  const CodeTextField({
    super.key,
    required TextEditingController textEditingController,
    required FocusNode focusNode,
    required Function(String value) onChange,

  }) : _textEditingController = textEditingController,
        _focusNode = focusNode,
          _onChange = onChange
  ;

  final TextEditingController _textEditingController;
  final FocusNode _focusNode;
  final void Function(String value) _onChange;


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      focusNode: _focusNode,
      keyboardType: TextInputType.numberWithOptions(signed: false,decimal: false),
      textAlign: TextAlign.center,
      style: GoogleFonts.crimsonText(
          color: Color(0xFF162a40),
          fontWeight: FontWeight.bold,
          fontSize: 20
      ),
      onChanged: _onChange,
      maxLength: 1,
      decoration: InputDecoration(
        counterText: '',

      ),
    );
  }
}