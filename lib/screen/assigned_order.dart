import 'package:anandmart_driver/widgets/app_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../routers/routers.dart';
import '../widgets/custome_size.dart';
import '../widgets/dimenestion.dart';


class AssignedOrderScreen extends StatefulWidget {
  const AssignedOrderScreen({Key? key}) : super(key: key);

  @override
  State<AssignedOrderScreen> createState() => _AssignedOrderScreenState();
}

class _AssignedOrderScreenState extends State<AssignedOrderScreen> {
  bool state = true;

  String dropdownvalue = 'All Orders';

  var items = [
    'All Orders',
    'Burger',
    'Pasta',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 0,
        titleSpacing: 30,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.black,
        leading: Padding(
          padding: EdgeInsets.only(left: AddSize.padding12),
          child: GestureDetector(
              onTap: () {
                Get.back();

              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                      SvgPicture.asset(AppAssets.arrowBack)
                ],
              )),
        ),
        actions: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(

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
          ),
        )
        ],
        leadingWidth: AddSize.size40 * 0.9,
        title:  Text('All Orders',
          style: GoogleFonts.quicksand(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: const Color(0xFF303C5E)
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
             Padding(
               padding: const EdgeInsets.all(11.0),
               child: Row(
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

                 ],
               ),
             ),
            addHeight(12.0),

            Padding(
              padding: const EdgeInsets.all(11.0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 14,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
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
                      addHeight(20),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
