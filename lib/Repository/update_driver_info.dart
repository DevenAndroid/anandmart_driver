import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Resources/api_urls.dart';
import '../models/driver_profile_model.dart';
import '../models/login_model.dart';
import '../resources/helper.dart';

Future<DriverProfileModel> editUserProfileRepo({
  mapData,
  required fieldName1,
  // required fieldName2,
  required File file1,
  // required File file2,
  required context,
}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  try {
    var request =
    http.MultipartRequest('POST', Uri.parse(ApiUrl.updateProfileUrl));
    SharedPreferences pref = await SharedPreferences.getInstance();
    LoginModel? user =
    LoginModel.fromJson(jsonDecode(pref.getString('user_info')!));
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer ${user.authToken}'
    };
    request.headers.addAll(headers);

    request.fields.addAll(mapData);

    if (file1.path != "") {
      request.files.add(await multipartFile(fieldName1, file1));
      // request.files.add(await multipartFile(fieldName2, file2));
    }

    log(request.fields.toString());
    log(request.files.map((e) => e.filename).toList().toString());
    final response = await request.send();
    String res = await response.stream.bytesToString();
    log(res);
    if (response.statusCode == 200 || response.statusCode == 400) {
      Helpers.hideLoader(loader);
      return DriverProfileModel.fromJson(
          jsonDecode(res));
    } else {
      Helpers.hideLoader(loader);
      return DriverProfileModel.fromJson(
          jsonDecode(res));
    }
  } on SocketException {
    return DriverProfileModel(message: "No Internet Access", status: false);
  } catch (e) {
    return DriverProfileModel(message: e.toString(), status: false);
  }
}

Future<http.MultipartFile> multipartFile(String? fieldName, File file1) async {
  return http.MultipartFile(
    fieldName ?? 'file',
    http.ByteStream(Stream.castFrom(file1.openRead())),
    await file1.length(),
    filename: file1.path.split('/').last,
  );
}