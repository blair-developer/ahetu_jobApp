import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:ahetu/models/request/bookmarks/bookmarks_model.dart';
import 'package:ahetu/models/response/bookmarks/all_bookmarks.dart';
import 'package:ahetu/models/response/bookmarks/bookmark.dart';
import 'package:ahetu/services/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookMarkHelper {
  static var client = https.Client();


}
