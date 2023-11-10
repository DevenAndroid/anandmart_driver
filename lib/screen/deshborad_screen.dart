import 'package:anandmart_driver/routers/routers.dart';
import 'package:anandmart_driver/widgets/app_assets.dart';
import 'package:anandmart_driver/widgets/custome_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/dimenestion.dart';


class DashbordScreen extends StatefulWidget {
  const DashbordScreen({Key? key}) : super(key: key);

  @override
  State<DashbordScreen> createState() => _DashbordScreenState();
}

class _DashbordScreenState extends State<DashbordScreen> {
  bool state = true;
  double _value=20;
  int currentDrawer = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:Drawer(

        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 230,
              child: DrawerHeader(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF7ED957),
                          Color(0xFF68C541),
                        ],
                      )
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/Ellipse 67.png',
                          height: 100,
                        ),
                        Text('Williams Jones',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: const Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w600,)),
                        Text('williamsjones@gmail.com',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: const Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w400,)),
                      ],
                    ),
                  )),
            ),
            ListTile(
              visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
              leading: Image.asset(
                'assets/images/dashboard_icon.png',
                height: 15,
              ),
              title:  Text('Dashboard',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: const Color(0xFF4F535E),
                    fontWeight: FontWeight.w400,)),
              onTap: () {
                setState(() {
                  currentDrawer = 0;
                  Get.back();
                });
              },
            ),
            const Divider(
              height: 5,
              color: Color(0xffEFEFEF),
              thickness: 1,
            ),

            ListTile(
              visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
              leading: Image.asset(
                'assets/images/time_track.png',
                height: 15,
              ),
              title:  Text('My Order',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: const Color(0xFF4F535E),
                    fontWeight: FontWeight.w400,)),
              onTap: () {
                setState(() {
                  currentDrawer = 1;
                 Get.toNamed(MyRouters.assignedOrderScreen);
                });
              },
            ),
            const Divider(
              height: 5,
              color: Color(0xffEFEFEF),
              thickness: 1,
            ),

            ListTile(
              visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
              leading: Image.asset(
                'assets/images/salary.png',color: Colors.black54,
                height: 15,
              ),
              title:  Text('Salary',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: const Color(0xFF4F535E),
                    fontWeight: FontWeight.w400,)),
              onTap: () {
                setState(() {
                  currentDrawer = 2;
                 Get.toNamed(MyRouters.salaryScreen);
                });
              },
            ),
            const Divider(
              height: 5,
              color: Color(0xffEFEFEF),
              thickness: 1,
            ),
            ListTile(
              visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
              leading: Image.asset(
                'assets/images/bx_wallet.png',
                height: 15,
              ),
              title:  Text('Bank Details',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: const Color(0xFF4F535E),
                    fontWeight: FontWeight.w400,)),
              onTap: () {
                setState(() {
                  currentDrawer = 3;
                  Get.toNamed(MyRouters.bankDetailsScreen);
                });
              },
            ),

 const Divider(
   height: 5,
   color: Color(0xffEFEFEF),
   thickness: 1,
 ),
 ListTile(
   visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
   leading: Image.asset(
     'assets/images/profile.png',color: Colors.black54,
     height: 15,
   ),
   title:  Text('My Profile',
       style: GoogleFonts.poppins(
         fontSize: 15,
         color: const Color(0xFF4F535E),
         fontWeight: FontWeight.w400,)),
   onTap: () {
     setState(() {
       currentDrawer = 4;
       Get.toNamed(MyRouters.profileScreen);
     });
   },
 ),
            const Divider(
              height: 5,
              color: Color(0xffEFEFEF),
              thickness: 1,
            ),
            ListTile(
              visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
              leading: Image.asset(
                'assets/images/logout.png',
                height: 15,
              ),
              title:  Text('Logout',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: const Color(0xFF4F535E),
                    fontWeight: FontWeight.w400,)),
              onTap: () {
                setState(() {
                  currentDrawer = 5;
                Get.offAllNamed(MyRouters.loginScreen);
                });
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 0,
        titleSpacing: 30,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          Row(
             children: [
               const Text(' Delivey Mode', style: TextStyle(
                   fontWeight: FontWeight.w500,
                   fontSize: 10,
                   color:  Color(0xFF303C5E)
               ),
               ),
               Transform.scale(
                 scale: 0.8,
                 child: CupertinoSwitch(
                   activeColor: const Color(0xFF7ED957),
                   value : state,
                   onChanged: (value) {
                     state = value;
                     setState(() {
                     },
                     );
                   }
                   ),
               ),

             ],
          )
        ],
        leadingWidth: AddSize.size40 * 0.9,
        title:  Text('Dashbord',
          style: GoogleFonts.quicksand(
              fontWeight: FontWeight.w700,
              fontSize: 15,
              color: const Color(0xFF303C5E)
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 const Text('Hi, Hoanganhover!',
                   style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color:  Color(0xFF303C5E)
                  ),),
                 Container(
height: 30,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(5),
                     color: Color(0xFF4DBA4D),
                   ),
                   child: Row(
                     children: [
                       SizedBox(width: 4,),
                       SvgPicture.asset(AppAssets.map),
                       Text('   See Route  ',
                         style: GoogleFonts.quicksand(
                             fontWeight: FontWeight.w700,
                             fontSize: 13,
                             color:  Colors.white
                         ),
                       ),
                     ],
                   ),
                 )
               ],
             ),

              const Text('Monday, 2 June, 2021',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color:  Color(0xFF303C5E)
                ),),
              addHeight(26.0),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 165,
                      width: AddSize.screenWidth,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF5F5F5F).withOpacity(0.4),
                              offset: Offset(0.0, 0.5),
                              blurRadius: 5,),
                          ]
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                              right: 0,
                              child: Column(
                                children: [
                                  Image.asset('assets/images/Group 362.png',height: 98,)
                                ],
                              )
                          ),
                          Positioned(
                              bottom: 10,
                              left: 10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const[
                                  Text('10',style: TextStyle(
                                      color: Color(0xFF7ED957),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 21
                                  ),),
                                  Text('Delivered',style: TextStyle(
                                      color: Color(0xFF393E50),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14
                                  ),)
                                ],
                              )
                          ),
                        ],
                      ),
                    ),
                  ),
                  addWidth(19),
                  Expanded(
                     child: Container(
                       height: 165,
                       width: AddSize.screenWidth,
                       decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(10),
                           boxShadow: [
                             BoxShadow(
                               color: Color(0xFF5F5F5F).withOpacity(0.4),
                               offset: Offset(0.0, 0.5),
                               blurRadius: 5,),
                           ]
                       ),
                      child: Stack(
                        children: [
                          Positioned(
                              right: 0,
                              child: Image.asset('assets/images/Group 363.png',height: 98,)
                          ),
                          Positioned(
                            bottom: 10,
                              left: 10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const[
                                   Text('\$240.00',style: TextStyle(
                                     color: Color(0xFFFF980E),
                                     fontWeight: FontWeight.w700,
                                     fontSize: 21
                                   ),),
                                  Text('Delivered',style: TextStyle(
                                     color: Color(0xFF393E50),
                                     fontWeight: FontWeight.w600,
                                     fontSize: 14
                                   ),)
                                ],
                              )
                          ),
                        ],
                      ),
                     ),
                   ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Today Order',
                    style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: const Color(0xFF303C5E)
                    ),),
                  Text('(14)',
                    style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: const Color(0xFF4DBA4D)
                    ),),
                  Spacer(),
                  InkWell(
                    onTap: (){
                      Get.toNamed(MyRouters.assignedOrderScreen);
                    },
                    child: Text('See All',
                      style: GoogleFonts.quicksand(
                        decoration: TextDecoration.underline,

                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: const Color(0xFF4DBA4D)
                      ),),
                  ),

                ],
              ),
              addHeight(12.0),

              ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: (){
                          Get.toNamed(MyRouters.driverDeliveryOrderDetails);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF5F5F5F).withOpacity(0.4),
                                offset: Offset(0.0, 0.5),
                                blurRadius: 5,),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                            child:
                            Column(
                              children: [

                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Status:',
                                      style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                          color: const Color(0xFF303C5E)
                                      ),),
                                    Spacer(),

                                    Text('Delivered',
                                      style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                          color: const Color(0xFF4DBA4D)
                                      ),),
                                  ],
                                ),
                                addHeight(15),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset('assets/images/calender_Img.png',height: 18,),
                                    addWidth(20),
                                    Text('Date:',

                                      style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                          color: const Color(0xFF303C5E)
                                      ),),

                                    Spacer(),
                                    Text('Mon 2 June, 2021 – 10:30am',
                                      style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                          color: const Color(0xFF3E525A)
                                      ),),
                                  ],
                                ),
                                addHeight(15),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset('assets/images/orderid.png',height: 18,),
                                    addWidth(20),
                                    Text('Order ID:',
                                      style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                          color: const Color(0xFF303C5E)
                                      ),),
                                    Spacer(),
                                    Text('#258147963.',
                                      style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                          color: const Color(0xFF3E525A)
                                      ),),
                                  ],
                                ),
                                addHeight(15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset('assets/images/locationiconn.png',height: 18,),
                                    addWidth(20),
                                    Text('Location:',
                                      style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                          color: const Color(0xFF303C5E)
                                      ),),
                                    Spacer(),

                                    Text('600 East Carpenter Freeway',
                                      style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                          color: const Color(0xFF3E525A)
                                      ),),
                                  ],
                                ),
                                addHeight(10),

                              ],
                            ),
                          ),
                        ),
                      ),
                      addHeight(20),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
