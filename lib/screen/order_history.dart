import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Resources/common_text.dart';
import '../routers/routers.dart';
import '../widgets/app_theme.dart';
import '../widgets/dimenestion.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);
  static var orderHistory = "/orderHistory";

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  final key = GlobalKey<ScaffoldState>();
  var currentDrawer = 0;
  String dropdownvalue = 'Today';
  var items = [
    'Today',
    'This Week',
    'This Month',
    'Last Year',
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = MediaQuery.of(context).size.width;
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
                  child:   Image.asset(
                    "assets/images/backArrow.png",
                    height: AddSize.size25,
                  ),
                ),
              ),
              elevation: 1,
              title: Text(
                "Order History",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                   // height: 15,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(color: Colors.white, border: Border.all(color: const Color(0xFFEEEEEE))),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                       isDense: true,
                        isExpanded: false,
                        style: const TextStyle(
                          color: Color(0xFF697164),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        value: dropdownvalue,
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Color(0xFF000000),
                        ),
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                            print(dropdownvalue);
                          });

                        },
                      ),
                    ),
                  ),
                )
              ],
              bottom: TabBar(
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
                      "Active",
                      style: currentDrawer == 0
                          ? GoogleFonts.poppins(color: const Color(0xff1A2E33), fontSize: 16, fontWeight: FontWeight.w500)
                          : GoogleFonts.poppins(color: AppTheme.primaryColor, fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Completed",
                      style: currentDrawer == 1
                          ? GoogleFonts.poppins(color: Colors.cyan, fontSize: 16, fontWeight: FontWeight.w500)
                          : GoogleFonts.poppins(color: Color(0xff1A2E33), fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Cancelled",
                      style: currentDrawer == 1
                          ? GoogleFonts.poppins(color: Colors.cyan, fontSize: 16, fontWeight: FontWeight.w500)
                          : GoogleFonts.poppins(color: Color(0xff1A2E33), fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            body: TabBarView(children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return
                    Padding(
                      padding: const EdgeInsets.only(left: 16,right: 16,top: 13),
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.toNamed(MyRouters.driverDeliveryOrderDetails);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF5F5F5F).withOpacity(0.4),
                                  offset: Offset(0.0, 0.5),
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                              child: Column(
                                children: [

                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/images/calender_Img.png',
                                        height: 18,
                                      ),
                                      addWidth(20),
                                      Text(
                                        'Date:',
                                        style: GoogleFonts.quicksand(
                                            fontWeight: FontWeight.w700, fontSize: 14, color: const Color(0xFF303C5E)),
                                      ),
                                      Spacer(),
                                      Text(
                                        'Mon 2 June, 2021 – 10:30am',
                                        style: GoogleFonts.quicksand(
                                            fontWeight: FontWeight.w400, fontSize: 15, color: const Color(0xFF3E525A)),
                                      ),
                                    ],
                                  ),
                                  addHeight(15),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/images/orderid.png',
                                        height: 18,
                                      ),
                                      addWidth(20),
                                      Text(
                                        'Order ID:',
                                        style: GoogleFonts.quicksand(
                                            fontWeight: FontWeight.w700, fontSize: 14, color: const Color(0xFF303C5E)),
                                      ),
                                      Spacer(),
                                      Text(
                                        '#258147963.',
                                        style: GoogleFonts.quicksand(
                                            fontWeight: FontWeight.w400, fontSize: 15, color: const Color(0xFF3E525A)),
                                      ),
                                    ],
                                  ),
                                  addHeight(15),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/images/locationiconn.png',
                                        height: 18,
                                      ),
                                      addWidth(20),
                                      Text(
                                        'Location:',
                                        style: GoogleFonts.quicksand(
                                            fontWeight: FontWeight.w700, fontSize: 14, color: const Color(0xFF303C5E)),
                                      ),
                                      Spacer(),
                                      Text(
                                        '600 East Carpenter Freeway',
                                        style: GoogleFonts.quicksand(
                                            fontWeight: FontWeight.w400, fontSize: 15, color: const Color(0xFF3E525A)),
                                      ),
                                    ],
                                  ),
                                  addHeight(10),
                                ],
                              ),
                            ),
                          ),
                        ),
                        addHeight(5),
                      ],
                  ),
                    );
                },
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return
                    Padding(
                      padding: const EdgeInsets.only(left: 16,right: 16,top: 13),
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.toNamed(MyRouters.driverDeliveryOrderDetails);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF5F5F5F).withOpacity(0.4),
                                  offset: Offset(0.0, 0.5),
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Status:',
                                        style: GoogleFonts.quicksand(
                                            fontWeight: FontWeight.w700, fontSize: 14, color: const Color(0xFF303C5E)),
                                      ),
                                      Spacer(),
                                      Container(
                                        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 8),
                                        decoration: BoxDecoration(
                                          color: Color(0xff4DBA4D),
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: Text(
                                          'Completed',
                                          style: GoogleFonts.quicksand(
                                              fontWeight: FontWeight.w700, fontSize: 14, color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                  addHeight(15),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/images/calender_Img.png',
                                        height: 18,
                                      ),
                                      addWidth(20),
                                      Text(
                                        'Date:',
                                        style: GoogleFonts.quicksand(
                                            fontWeight: FontWeight.w700, fontSize: 14, color: const Color(0xFF303C5E)),
                                      ),
                                      Spacer(),
                                      Text(
                                        'Mon 2 June, 2021 – 10:30am',
                                        style: GoogleFonts.quicksand(
                                            fontWeight: FontWeight.w400, fontSize: 15, color: const Color(0xFF3E525A)),
                                      ),
                                    ],
                                  ),
                                  addHeight(15),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/images/orderid.png',
                                        height: 18,
                                      ),
                                      addWidth(20),
                                      Text(
                                        'Order ID:',
                                        style: GoogleFonts.quicksand(
                                            fontWeight: FontWeight.w700, fontSize: 14, color: const Color(0xFF303C5E)),
                                      ),
                                      Spacer(),
                                      Text(
                                        '#258147963.',
                                        style: GoogleFonts.quicksand(
                                            fontWeight: FontWeight.w400, fontSize: 15, color: const Color(0xFF3E525A)),
                                      ),
                                    ],
                                  ),
                                  addHeight(15),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/images/locationiconn.png',
                                        height: 18,
                                      ),
                                      addWidth(20),
                                      Text(
                                        'Location:',
                                        style: GoogleFonts.quicksand(
                                            fontWeight: FontWeight.w700, fontSize: 14, color: const Color(0xFF303C5E)),
                                      ),
                                      Spacer(),
                                      Text(
                                        '600 East Carpenter Freeway',
                                        style: GoogleFonts.quicksand(
                                            fontWeight: FontWeight.w400, fontSize: 15, color: const Color(0xFF3E525A)),
                                      ),
                                    ],
                                  ),
                                  addHeight(10),
                                ],
                              ),
                            ),
                          ),
                        ),
                        addHeight(5),
                      ],
                  ),
                    );
                },
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return
                    Padding(
                      padding: const EdgeInsets.only(left: 16,right: 16,top: 13),
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.toNamed(MyRouters.driverDeliveryOrderDetails);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF5F5F5F).withOpacity(0.4),
                                  offset: Offset(0.0, 0.5),
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Status:',
                                        style: GoogleFonts.quicksand(
                                            fontWeight: FontWeight.w700, fontSize: 14, color: const Color(0xFF303C5E)),
                                      ),
                                      Spacer(),
                                      Container(
                                        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 8),
                                        decoration: BoxDecoration(
                                          color: Color(0xffFFA1A1),
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: Text(
                                          'Cancelled',
                                          style: GoogleFonts.quicksand(
                                              fontWeight: FontWeight.w700, fontSize: 14, color: Color(0xffFF4141)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  addHeight(15),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/images/calender_Img.png',
                                        height: 18,
                                      ),
                                      addWidth(20),
                                      Text(
                                        'Date:',
                                        style: GoogleFonts.quicksand(
                                            fontWeight: FontWeight.w700, fontSize: 14, color: const Color(0xFF303C5E)),
                                      ),
                                      Spacer(),
                                      Text(
                                        'Mon 2 June, 2021 – 10:30am',
                                        style: GoogleFonts.quicksand(
                                            fontWeight: FontWeight.w400, fontSize: 15, color: const Color(0xFF3E525A)),
                                      ),
                                    ],
                                  ),
                                  addHeight(15),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/images/orderid.png',
                                        height: 18,
                                      ),
                                      addWidth(20),
                                      Text(
                                        'Order ID:',
                                        style: GoogleFonts.quicksand(
                                            fontWeight: FontWeight.w700, fontSize: 14, color: const Color(0xFF303C5E)),
                                      ),
                                      Spacer(),
                                      Text(
                                        '#258147963.',
                                        style: GoogleFonts.quicksand(
                                            fontWeight: FontWeight.w400, fontSize: 15, color: const Color(0xFF3E525A)),
                                      ),
                                    ],
                                  ),
                                  addHeight(15),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/images/locationiconn.png',
                                        height: 18,
                                      ),
                                      addWidth(20),
                                      Text(
                                        'Location:',
                                        style: GoogleFonts.quicksand(
                                            fontWeight: FontWeight.w700, fontSize: 14, color: const Color(0xFF303C5E)),
                                      ),
                                      Spacer(),
                                      Text(
                                        '600 East Carpenter Freeway',
                                        style: GoogleFonts.quicksand(
                                            fontWeight: FontWeight.w400, fontSize: 15, color: const Color(0xFF3E525A)),
                                      ),
                                    ],
                                  ),
                                  addHeight(10),
                                ],
                              ),
                            ),
                          ),
                        ),
                        addHeight(5),
                      ],
                  ),
                    );
                },
              ),

            ])));
  }
}
