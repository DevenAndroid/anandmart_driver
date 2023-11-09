import 'package:anandmart_driver/routers/routers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/app_assets.dart';
import '../widgets/app_theme.dart';
import '../widgets/custome_textfiled.dart';
import '../widgets/dimenestion.dart';

class ThankYouVendorScreen extends StatefulWidget {
  const ThankYouVendorScreen({Key? key}) : super(key: key);
  static var thankYouVendorScreen = "/thankYouVendorScreen";
  @override
  State<ThankYouVendorScreen> createState() => _ThankYouVendorScreenState();
}

class _ThankYouVendorScreenState extends State<ThankYouVendorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Container(
            width: AddSize.screenWidth,
            height: AddSize.screenHeight,
            decoration: BoxDecoration(

                image: DecorationImage(
fit: BoxFit.fill,
                    image: AssetImage(AppAssets.tqback,)
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: AddSize.size125,
                ),
                Image(
                  height: AddSize.size110,
                  width: double.maxFinite,
                  image: const AssetImage(AppAssets.tick),
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  height: AddSize.size40,
                ),
               Center(
                 child:  Text(
                    "Your Account Has Been\n Successfully Created",
                    textAlign: TextAlign.center,
                   style: GoogleFonts.quicksand(
                     fontWeight: FontWeight.w700,
                     fontSize: 28,
                     color:Colors.white,
                     // fontStyle: FontStyle.italic,
                   ),
                  ),
               ),
               const SizedBox(
                  height: 18,
                ),
               Center(
                 child:  Text(
                    "Admin Will Verify and Update You by\nCall or Email",
                    textAlign: TextAlign.center,
                   style: GoogleFonts.quicksand(
                     fontWeight: FontWeight.w500,
                     fontSize: 16,
                     color:Colors.white,
                     // fontStyle: FontStyle.italic,
                   ),
                  ),
               ),
                SizedBox(
                  height: AddSize.size10,
                ),
              ],
            ),
          )),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AddSize.padding16, vertical: AddSize.size40),
        child:
        CommonButton(
          title: 'Continue',
          onPressed: () {
            Get.toNamed(MyRouters.dashbordScreen);
          },
        )
      ),
    );
  }
}
