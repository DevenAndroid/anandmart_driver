
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/app_assets.dart';
import '../widgets/app_theme.dart';
import '../widgets/dimenestion.dart';


SizedBox addHeight(double size) => SizedBox(height: size);
SizedBox addWidth(double size) => SizedBox(width: size);


  showToast(message) {
      Fluttertoast.cancel();
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xff4DBA4D),
          textColor: Colors.white,
          fontSize: 16.0);
    }



AppBar backAppBar(
    {required title,
      required BuildContext context,
      String dispose = "",
      Color? backgroundColor = AppTheme.backgroundcolor,
      Color? textColor = Colors.black,
      Widget? icon,
      disposeController}) {
  return AppBar(
    toolbarHeight: 60,
    elevation: 0,
    leadingWidth: AddSize.size20 * 1.6,
    backgroundColor: backgroundColor,
    title: Text(
      title,
      style: Theme.of(context).textTheme.headline6!.copyWith(
          fontWeight: FontWeight.w500, fontSize: 20, color: textColor),
    ),
    leading: Padding(
      padding: EdgeInsets.only(left: AddSize.padding12),
      child: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SvgPicture.asset(AppAssets.arrowBack)],
          )),
    ),
  );
}

AppBar backAppBar2(
    {required title,
      required BuildContext context,
      String dispose = "",
      Color? backgroundColor = Colors.transparent,
      Color? textColor = Colors.black,
      Widget? icon,
      disposeController}) {
  return
    AppBar(
      toolbarHeight: 60,
      elevation: 0,
      leadingWidth: AddSize.size20 * 2.2,
      backgroundColor: backgroundColor,
      surfaceTintColor: Colors.transparent,
      title: Text(
        title,
        style: GoogleFonts.quicksand(
          fontWeight: FontWeight.w700, fontSize: 20, color: Color(0xff303D48),),
      ),
      leading: Padding(
        padding: EdgeInsets.only(left: AddSize.padding20),
        child: GestureDetector(
            onTap: () {
              Get.back();
              if (dispose == "dispose") {}
            },
            child: icon ??
                SvgPicture.asset(AppAssets.arrowBack)),
      ),
    );
}

