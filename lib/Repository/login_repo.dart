import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Resources/api_urls.dart';
import '../models/login_model.dart';
import '../resources/helper.dart';

Future<LoginModel> createLogin(
    {required String userEmail,
      required String userPassword,
      required String role,
      // required String deviceToken,
      //required String fcmToken,
      required BuildContext context}) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  var map = <String, dynamic>{};
  map['email'] = userEmail;
  map['password'] = userPassword;
  map['role'] = role;
  // map['device_token'] = deviceToken;
  map['device_id'] =pref.getString('deviceId');
  log(map.toString());


  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);

  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
  };
  print('REQUEST ::${jsonEncode(map)}');
  // log(pref.getString('deviceId')!);
  http.Response response = await http.post(Uri.parse(ApiUrl.loginApi),
      body: jsonEncode(map), headers: headers);
  log("response.body....      "+response.body);
  if (response.statusCode == 200 || response.statusCode == 400) {
    Helpers.hideLoader(loader);
    return LoginModel.fromJson(json.decode(response.body));
  } else {
    Helpers.createSnackBar(context, response.body.toString());
    Helpers.hideLoader(loader);
    throw Exception(response.body);
  }
}
