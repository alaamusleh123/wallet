import 'package:flutter/cupertino.dart';
import 'package:my_wallet_project/pref/shared_pref_controller.dart';

class LanguageProvider extends ChangeNotifier{
  String language = SharedPrefController().language;
  void changeLanguage(){
    language= language=='en' ? 'ar' : 'en';
    SharedPrefController().changeLanguage(language);
    notifyListeners();
  }
}