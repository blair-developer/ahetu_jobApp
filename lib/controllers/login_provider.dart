import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ahetu/constants/app_constants.dart';
import 'package:ahetu/controllers/zoom_provider.dart';
import 'package:ahetu/models/request/auth/login_model.dart';
import 'package:ahetu/models/request/auth/profile_update_model.dart';
import 'package:ahetu/services/helpers/auth_helper.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginNotifier extends ChangeNotifier {
   bool _obscureText = true;
   bool get obsecureText => _obscureText;
   set obsecureText(bool newState){
     _obscureText = newState;
     notifyListeners();
   }
}
