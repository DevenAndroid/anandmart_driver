import 'package:anandmart_driver/widgets/app_assets.dart';
import 'package:anandmart_driver/widgets/app_text.dart';
import 'package:anandmart_driver/widgets/app_theme.dart';
import 'package:anandmart_driver/widgets/custome_size.dart';
import 'package:anandmart_driver/widgets/custome_textfiled.dart';
import 'package:anandmart_driver/widgets/dimenestion.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final key = GlobalKey<ScaffoldState>();
  var currentDrawer = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              leading: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13.0),
                  child: SvgPicture.asset(
                    AppAssets.arrowBack,
                    height: AddSize.size25,
                  ),
                ),
              ),
              elevation: 0,
              title: Text(
                "Profile",
                style: GoogleFonts.quicksand(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF303C5E)),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF5F5F5F).withOpacity(0.2),
                          offset: const Offset(0.0, 0.2),
                          blurRadius: 2,
                        ),
                      ]),
                  child: Column(
                    children: [
                      Center(
                          child: SizedBox(
                            height: 200,
                            child: Stack(children: [
                        Image.asset(
                            AppAssets.man1,
                            fit: BoxFit.fill,
                        ),
                              Positioned(
                                top: 80,
                                left: 90,
                                right: 12,
                                child: Container(
padding: EdgeInsets.all(5),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff04666E),
                                 shape: BoxShape.circle
                                  ),
                                  child: const Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ),
                              ),

                              Positioned(
                                top: 140,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Alex Zander",
                                        // profileData.userName.toString(),
                                        style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Text(
                                        "Edit Profile",
                                        // profileData.email.toString(),
                                        style: GoogleFonts.poppins(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                      ]),
                          )),


                      TabBar(
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorColor: AppTheme.primaryColor,
                        indicatorPadding: EdgeInsets.symmetric(horizontal: 15),
                        // automaticIndicatorColorAdjustment: true,
                        onTap: (value) {
                          currentDrawer = 0;
                          setState(() {});
                        },
                        tabs: [
                          Tab(
                            child: Text(
                              "Information",
                              style: currentDrawer == 0
                                  ? GoogleFonts.poppins(color: const Color(0xff1A2E33), fontSize: 14, fontWeight: FontWeight.w500)
                                  : GoogleFonts.poppins(color: AppTheme.primaryColor, fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Address",
                              style: currentDrawer == 1
                                  ? GoogleFonts.poppins(color: Colors.cyan, fontSize: 14, fontWeight: FontWeight.w500)
                                  : GoogleFonts.poppins(color: Color(0xff1A2E33), fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Document",
                              style: currentDrawer == 1
                                  ? GoogleFonts.poppins(color: Colors.cyan, fontSize: 14, fontWeight: FontWeight.w500)
                                  : GoogleFonts.poppins(color: Color(0xff1A2E33), fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                       SizedBox(
                         height: size.height,
                         child:  TabBarView(children: [
                           Padding(
                             padding: const EdgeInsets.all(12.0),
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 SizedBox(height: 15,),
                                 Row(
                                   children: [
                                     Expanded(
                                       child: Column(
                                         mainAxisAlignment: MainAxisAlignment.start,
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           Text("First Name",
                                             style: GoogleFonts.quicksand(
                                               fontWeight: FontWeight.w600,
                                               fontSize: 15,
                                               color:const Color(0xFF000000),
                                               // fontStyle: FontStyle.italic,
                                             ),),
                                           const SizedBox(height: 10,),
                                           RegisterTextFieldWidget(
                                             onTap: () {},
                                             hint: 'First Name',
                                           ),
                                         ],
                                       ),
                                     ),
                                     SizedBox(width: 25,),
                                     Expanded(
                                       child: Column(
                                         mainAxisAlignment: MainAxisAlignment.start,
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           Text("Middle Name",
                                             style: GoogleFonts.quicksand(
                                               fontWeight: FontWeight.w600,
                                               fontSize: 15,
                                               color:const Color(0xFF000000),
                                               // fontStyle: FontStyle.italic,
                                             ),),
                                           const SizedBox(height: 10,),
                                           RegisterTextFieldWidget(
                                             onTap: () {},
                                             hint: 'Middle Name',
                                           ),
                                         ],
                                       ),
                                     ), 
                                   ],
                                 ),
                                
                           
                                 addHeight(15),
                                 Text("Last Name",
                                   style: GoogleFonts.quicksand(
                                     fontWeight: FontWeight.w600,
                                     fontSize: 15,
                                     color:const Color(0xFF000000),
                                     // fontStyle: FontStyle.italic,
                                   ),),
                                 const SizedBox(height: 10,),
                                 RegisterTextFieldWidget(
                                   onTap: () {},
                                   hint: 'Last Name',
                                 ),
                                 addHeight(15),
                                 Text("Email",
                                   style: GoogleFonts.quicksand(
                                     fontWeight: FontWeight.w600,
                                     fontSize: 15,
                                     color:const Color(0xFF000000),
                                     // fontStyle: FontStyle.italic,
                                   ),),
                                 const SizedBox(height: 10,),
                                 RegisterTextFieldWidget(
                                   onTap: () {},
                                   hint: 'Email',
                                 ),
                                 addHeight(15),
                                 Text("Phone Number",
                                   style: GoogleFonts.quicksand(
                                     fontWeight: FontWeight.w600,
                                     fontSize: 15,
                                     color:const Color(0xFF000000),
                                     // fontStyle: FontStyle.italic,
                                   ),),
                                 const SizedBox(height: 10,),
                                 RegisterTextFieldWidget(
                                   onTap: () {},
                                   hint: '987 654 3210',
                                 ),
                                 addHeight(15),
                                 Row(
                                   children: [
                                     Expanded(
                                       child: Column(
                                         mainAxisAlignment: MainAxisAlignment.start,
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           Text("ID Card Number",
                                             style: GoogleFonts.quicksand(
                                               fontWeight: FontWeight.w600,
                                               fontSize: 15,
                                               color:const Color(0xFF000000),
                                               // fontStyle: FontStyle.italic,
                                             ),),
                                           const SizedBox(height: 10,),
                                           RegisterTextFieldWidget(
                                             onTap: () {},
                                             hint: 'ID Card Number',
                                           ),
                                         ],
                                       ),
                                     ),
                                     SizedBox(width: 25,),
                                     Expanded(
                                       child: Column(
                                         mainAxisAlignment: MainAxisAlignment.start,
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           Text("Pan Card Number",
                                             style: GoogleFonts.quicksand(
                                               fontWeight: FontWeight.w600,
                                               fontSize: 15,
                                               color:const Color(0xFF000000),
                                               // fontStyle: FontStyle.italic,
                                             ),),
                                           const SizedBox(height: 10,),
                                           RegisterTextFieldWidget(
                                             onTap: () {},
                                             hint: 'Pan Card Number',
                                           ),
                                         ],
                                       ),
                                     ),
                                   ],
                                 ),

                                 addHeight(15),
                                 Row(
                                   children: [
                                     Expanded(
                                       child: Column(
                                         mainAxisAlignment: MainAxisAlignment.start,
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           Text("Vichele Number",
                                             style: GoogleFonts.quicksand(
                                               fontWeight: FontWeight.w600,
                                               fontSize: 15,
                                               color:const Color(0xFF000000),
                                               // fontStyle: FontStyle.italic,
                                             ),),
                                           const SizedBox(height: 10,),
                                           RegisterTextFieldWidget(
                                             onTap: () {},
                                             hint: 'Vichele Number',
                                           ),
                                         ],
                                       ),
                                     ),
                                     SizedBox(width: 25,),
                                     Expanded(
                                       child: Column(
                                         mainAxisAlignment: MainAxisAlignment.start,
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           Text("Licence Number",
                                             style: GoogleFonts.quicksand(
                                               fontWeight: FontWeight.w600,
                                               fontSize: 15,
                                               color:const Color(0xFF000000),
                                               // fontStyle: FontStyle.italic,
                                             ),),
                                           const SizedBox(height: 10,),
                                           RegisterTextFieldWidget(
                                             onTap: () {},
                                             hint: 'Licence Number',
                                           ),
                                         ],
                                       ),
                                     ),
                                   ],
                                 ),




                                 addHeight(15),
                                 Text("Insurance",
                                   style: GoogleFonts.quicksand(
                                     fontWeight: FontWeight.w600,
                                     fontSize: 15,
                                     color:const Color(0xFF000000),
                                     // fontStyle: FontStyle.italic,
                                   ),),
                                 const SizedBox(height: 10,),
                                 RegisterTextFieldWidget(
                                   onTap: () {},
                                   hint: 'Insurance',
                                 ),
SizedBox(height: 40,),
CommonButton1(title: "Continue")
                               ],
                             ),
                           ),

                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
SizedBox(height: 20,),
                            Text("Address 1",
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color:const Color(0xFF000000),
                                // fontStyle: FontStyle.italic,
                              ),),
                            const SizedBox(height: 10,),
                            RegisterTextFieldWidget(
                              onTap: () {},
                              hint: 'Address 1',
                            ),
                            addHeight(15),
                            Text("Address 2",
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color:const Color(0xFF000000),
                                // fontStyle: FontStyle.italic,
                              ),),
                            const SizedBox(height: 10,),
                            RegisterTextFieldWidget(
                              onTap: () {},
                              hint: 'Address 2',
                            ),
                            addHeight(15),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("City",
                                        style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                          color:const Color(0xFF000000),
                                          // fontStyle: FontStyle.italic,
                                        ),),
                                      const SizedBox(height: 10,),
                                      RegisterTextFieldWidget(
                                        onTap: () {},
                                        hint: 'City',
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 25,),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("State",
                                        style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                          color:const Color(0xFF000000),
                                          // fontStyle: FontStyle.italic,
                                        ),),
                                      const SizedBox(height: 10,),
                                      RegisterTextFieldWidget(
                                        onTap: () {},
                                        hint: 'State',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            addHeight(15),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Zipcode",
                                        style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                          color:const Color(0xFF000000),
                                          // fontStyle: FontStyle.italic,
                                        ),),
                                      const SizedBox(height: 10,),
                                      RegisterTextFieldWidget(
                                        onTap: () {},
                                        hint: 'Zipcode',
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 25,),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Landmark (optional)",
                                        style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                          color:const Color(0xFF000000),
                                          // fontStyle: FontStyle.italic,
                                        ),),
                                      const SizedBox(height: 10,),
                                      RegisterTextFieldWidget(
                                        onTap: () {},
                                        hint: 'Landmark (optional)',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 40,),
                            CommonButton1(title: "Continue")
                          ],
                        ),
                      ),
                     Padding(
                       padding: const EdgeInsets.all(12.0),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           SizedBox(height: 15,),
                           Text("Bank account statement and cancel cheque",
                             style: GoogleFonts.quicksand(
                               fontWeight: FontWeight.w600,
                               fontSize: 15,
                               color:const Color(0xFF000000),
                               // fontStyle: FontStyle.italic,
                             ),),
                           SizedBox(height: 15,),
                       DottedBorder(

                         borderType: BorderType.RRect,
                         radius: Radius.circular(12),
                         padding: EdgeInsets.all(6),
                         child: ClipRRect(
                           borderRadius: BorderRadius.all(Radius.circular(12)),
                           child: Container(
                               width: size.width,
height: size.height*.15,
                               child: Image.asset("assets/images/statement.png"))
                         ),
                       ),
                           SizedBox(height: 15,),
                           Text("Bank account statement and cancel cheque",
                             style: GoogleFonts.quicksand(
                               fontWeight: FontWeight.w600,
                               fontSize: 15,
                               color:const Color(0xFF000000),
                               // fontStyle: FontStyle.italic,
                             ),),
                           SizedBox(height: 15,),
                           Row(
                             children: [
                               Expanded(
                                 child: DottedBorder(

                                   borderType: BorderType.RRect,
                                   radius: Radius.circular(12),
                                   padding: EdgeInsets.all(6),
                                   child: ClipRRect(
                                       borderRadius: BorderRadius.all(Radius.circular(12)),
                                       child: Container(
                                           width: size.width,
                                           height: size.height*.15,
                                           child: Image.asset("assets/images/adhar.png"))
                                   ),
                                 ),
                               ),
                               SizedBox(width: 25,),
                               Expanded(
                                 child: DottedBorder(

                                   borderType: BorderType.RRect,
                                   radius: Radius.circular(12),
                                   padding: EdgeInsets.all(6),
                                   child: ClipRRect(
                                       borderRadius: BorderRadius.all(Radius.circular(12)),
                                       child: Container(
                                           width: size.width,
                                           height: size.height*.15,
                                           child: Image.asset("assets/images/adhar1.png"))
                                   ),
                                 ),
                               ),
                             ],
                           ),

                           SizedBox(height: 20,),
                           Text("Bank account statement and cancel cheque",
                             style: GoogleFonts.quicksand(
                               fontWeight: FontWeight.w600,
                               fontSize: 15,
                               color:const Color(0xFF000000),
                               // fontStyle: FontStyle.italic,
                             ),),
                           SizedBox(height: 15,),
                           DottedBorder(

                             borderType: BorderType.RRect,
                             radius: Radius.circular(12),
                             padding: EdgeInsets.all(6),
                             child: ClipRRect(
                                 borderRadius: BorderRadius.all(Radius.circular(12)),
                                 child: Container(
                                     width: size.width,
                                     height: size.height*.15,
                                     child: Image.asset("assets/images/driving1.png"))
                             ),
                           ),


                           SizedBox(height: 20,),
                           Text("Bank account statement and cancel cheque",
                             style: GoogleFonts.quicksand(
                               fontWeight: FontWeight.w600,
                               fontSize: 15,
                               color:const Color(0xFF000000),
                               // fontStyle: FontStyle.italic,
                             ),),
                           SizedBox(height: 15,),
                           Row(
                             children: [
                               Expanded(
                                 child: DottedBorder(

                                   borderType: BorderType.RRect,
                                   radius: Radius.circular(12),
                                   padding: EdgeInsets.all(6),
                                   child: ClipRRect(
                                       borderRadius: BorderRadius.all(Radius.circular(12)),
                                       child: Container(
                                           width: size.width,
                                           height: size.height*.15,
                                           child: Image.asset("assets/images/adhar.png"))
                                   ),
                                 ),
                               ),
                               SizedBox(width: 25,),
                               Expanded(
                                 child: DottedBorder(

                                   borderType: BorderType.RRect,
                                   radius: Radius.circular(12),
                                   padding: EdgeInsets.all(6),
                                   child: ClipRRect(
                                       borderRadius: BorderRadius.all(Radius.circular(12)),
                                       child: Container(
                                           width: size.width,
                                           height: size.height*.15,
                                           child: Image.asset("assets/images/adhar1.png"))
                                   ),
                                 ),
                               ),
                             ],
                           )
                       
                         ],
                       ),
                     )
                         ]),
                       ),
                    ],
                  ),
                ),
              ),
            )));
  }
}
