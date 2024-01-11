import 'dart:async';
import 'package:anandmart_driver/routers/routers.dart';
import 'package:anandmart_driver/widgets/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';




class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  userCheck() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getString('user_info') != null) {
    Get.offAllNamed(MyRouters.dashbordScreen);
    }
    else{
      Get.offAllNamed(MyRouters.onBoardingScreen);
    }
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () async {
      userCheck();
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:  Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: SvgPicture.asset(AppAssets.anand)),

          ],
        ),
      ),
    );
  }
}
