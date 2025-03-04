import 'dart:convert';

import 'package:http/http.dart' as https;
import 'package:ahetu/models/request/auth/login_model.dart';
import 'package:ahetu/models/request/auth/profile_update_model.dart';
import 'package:ahetu/models/request/auth/signup_model.dart';
import 'package:ahetu/models/response/auth/login_res_model.dart';
import 'package:ahetu/models/response/auth/profile_model.dart';
import 'package:ahetu/services/config.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AuthHelper {
  static var client = https.Client();

}
