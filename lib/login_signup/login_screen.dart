
import 'package:anandmart_driver/routers/routers.dart';
import 'package:anandmart_driver/widgets/app_assets.dart';
import 'package:anandmart_driver/widgets/app_text.dart';
import 'package:anandmart_driver/widgets/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class LoginScreenMart extends StatefulWidget {
  const LoginScreenMart({super.key});

  @override
  State<LoginScreenMart> createState() => _LoginScreenMartState();
}

class _LoginScreenMartState extends State<LoginScreenMart> {

  final formLogin = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var obscureText1 = true;
  var obscureText2 = true;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formLogin,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height*.06,),
                Center(child: SvgPicture.asset(AppAssets.anand,height:130,width: size.width,)),
                SizedBox(height: size.height*.04,),
            Center(
              child: Text("Welcome Back",
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w700,
                  fontSize: 32,
                  color: AppTheme.secondaryColor,
                  // fontStyle: FontStyle.italic,
                ),),
            ),
            SizedBox(height: 10,),
            Center(
              child: Text("Sign To Continue",
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color:Color(0xFF33354B),
                  // fontStyle: FontStyle.italic,
                ),),
            ),
                SizedBox(height: size.height*.03,),
                Text("Email",
                  style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color:Color(0xFF000000),
                    // fontStyle: FontStyle.italic,
                  ),),
                SizedBox(height: 7,),
                RegisterTextFieldWidget(
                  validator: MultiValidator([
                    RequiredValidator(
                        errorText:
                        'Please enter your email '),
                    EmailValidator(errorText: "please enter valid mail")
                  
                  ]),
  hint: "Enter Email",
),
                SizedBox(height: 12,),
                Text("Password",
                  style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color:Color(0xFF000000),
                    // fontStyle: FontStyle.italic,
                  ),),
                SizedBox(height: 7,),
                RegisterTextFieldWidget(
                  validator: MultiValidator([
                    RequiredValidator(
                        errorText: 'Please enter your password'),
                    MinLengthValidator(8,
                        errorText: 'Password must be at least 8 characters, with 1 special character & 1 numerical'),
                    PatternValidator(
                        r"(?=.*\W)(?=.*?[#?!@$%^&*-])(?=.*[0-9])",
                        errorText: "Password must be at least with 1 special character & 1 numerical"),
                  ]),

                  obscureText: obscureText2,
                  hint: "Enter Password",
                  suffix: GestureDetector(
                      onTap: () {
                        setState(() {
                          obscureText2 =
                          !obscureText2;
                        });
                      },
                      child: obscureText2
                          ? const Icon(
                        Icons.visibility_off,
                        color: Color(0xFF6A5454),
                      )
                          : const Icon(
                          Icons.visibility,
                          color: Color(
                              0xFF6A5454))),

                ),
                SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Forget Password",
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: AppTheme.primaryColor,
                        // fontStyle: FontStyle.italic,
                      ),),
                  ],
                ),
                SizedBox(height: size.height*.06,),
                CommonButtonGreen(title: "LOG IN",onPressed: (){

            if (formLogin.currentState!.validate()) {
            Get.toNamed(MyRouters.dashbordScreen);
               }
                },),

                SizedBox(height: size.height*.04,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/images/apple.svg"),
                    SizedBox(width: 20,),
                    SvgPicture.asset("assets/images/facebook.svg"),
                    SizedBox(width: 20,),
                    SvgPicture.asset("assets/images/google.svg"),


                  ],
                ),
                SizedBox(height: size.height*.04,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don’t you have an account? ",
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: Color(0xFF1C2550),
                        // fontStyle: FontStyle.italic,
                      ),),
                    InkWell(
                      onTap: (){
                      Get.toNamed(MyRouters.deliveryPartnerApplyScreen);
                      },
                      child: Text("Signup Now!",
                        style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: AppTheme.primaryColor,
                          // fontStyle: FontStyle.italic,
                        ),),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
