import 'dart:convert';
import 'package:anandmart_driver/Repository/common_repo.dart';
import 'package:anandmart_driver/Resources/api_urls.dart';
import 'package:anandmart_driver/authentication/login_screen.dart';
import 'package:anandmart_driver/routers/routers.dart';
import 'package:anandmart_driver/widgets/app_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Resources/common_text.dart';
import '../models/driver_dashboard_model.dart';
import '../widgets/dimenestion.dart';
import 'order_history.dart';

class DashbordScreen extends StatefulWidget {
  const DashbordScreen({Key? key}) : super(key: key);

  @override
  State<DashbordScreen> createState() => _DashbordScreenState();
}

class _DashbordScreenState extends State<DashbordScreen> {
  Repositories repositories = Repositories();
  DriverDashboardModel? dashboardModel;

  getDashboardData(){
    repositories.getApi(url: ApiUrl.dashBoardUrl).then((value){
      dashboardModel = DriverDashboardModel.fromJson(jsonDecode(value));
      setState(() {});
    });
  }

  bool state = true;
  double _value = 20;
  int currentDrawer = 0;

  @override
  void initState() {
    super.initState();
    getDashboardData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
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
                  )),
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
                              fontWeight: FontWeight.w600,
                            )),
                        Text('williamsjones@gmail.com',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: const Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w400,
                            )),
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
              title: Text('Dashboard',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: const Color(0xFF4F535E),
                    fontWeight: FontWeight.w400,
                  )),
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
                'assets/images/history.png',
                height: 15,
              ),
              title: Text('My Order',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: const Color(0xFF4F535E),
                    fontWeight: FontWeight.w400,
                  )),
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
                'assets/images/salary.png',
                color: Colors.black54,
                height: 15,
              ),
              title: Text('Salary',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: const Color(0xFF4F535E),
                    fontWeight: FontWeight.w400,
                  )),
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
              title: Text('Bank Details',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: const Color(0xFF4F535E),
                    fontWeight: FontWeight.w400,
                  )),
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
                'assets/images/profile.png',
                color: Colors.black54,
                height: 15,
              ),
              title: Text('My Profile',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: const Color(0xFF4F535E),
                    fontWeight: FontWeight.w400,
                  )),
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
                'assets/images/history.png',
                color: Colors.black54,
                height: 15,
              ),
              title: Text('Order History',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: const Color(0xFF4F535E),
                    fontWeight: FontWeight.w400,
                  )),
              onTap: () {
                setState(() {
                  currentDrawer = 5;
                  Get.toNamed(OrderHistory.orderHistory);
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
              title: Text('Logout',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: const Color(0xFF4F535E),
                    fontWeight: FontWeight.w400,
                  )),
              onTap: () {
                setState(() async {
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  await preferences.clear();
                  Get.to(()=>const LoginScreenMart());
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
              const Text(
                ' Delivey Mode',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 10, color: Color(0xFF303C5E)),
              ),
              if(dashboardModel!.data != null)
              Transform.scale(
                scale: 0.8,
                child: CupertinoSwitch(
                    activeColor: const Color(0xFF7ED957),
                    value: dashboardModel!.data!.deliveryMode!,
                    onChanged: (value) {
                      dashboardModel!.data!.deliveryMode = value;
                      setState(
                        () {},
                      );
                    }),
              ),
            ],
          )
        ],
        leadingWidth: AddSize.size40 * 0.9,
        title: Text(
          'Dashbord',
          style: GoogleFonts.quicksand(fontWeight: FontWeight.w700, fontSize: 15, color: const Color(0xFF303C5E)),
        ),
      ),
      body:
          dashboardModel != null ?
      SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    'Hi, ${dashboardModel!.data!.username.toString()}',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20, color: Color(0xFF303C5E)),
                  ),
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFF4DBA4D),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 4,
                        ),
                        SvgPicture.asset(AppAssets.map),
                        Text(
                          '   See Route  ',
                          style: GoogleFonts.quicksand(fontWeight: FontWeight.w700, fontSize: 13, color: Colors.white),
                        ),
                      ],
                    ),
                  )
                ],
              ),
               Text(
                 dashboardModel!.data!.createdAt.toString(),
                style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13, color: Color(0xFF303C5E)),
              ),
              addHeight(26.0),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 165,
                      width: AddSize.screenWidth,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [
                        BoxShadow(
                          color: Color(0xFF5F5F5F).withOpacity(0.4),
                          offset: Offset(0.0, 0.5),
                          blurRadius: 5,
                        ),
                      ]),
                      child: Stack(
                        children: [
                          Positioned(
                              right: 0,
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/Group 362.png',
                                    height: 98,
                                  )
                                ],
                              )),
                          Positioned(
                              bottom: 10,
                              left: 10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                  Text(
                                    dashboardModel!.data!.deliveredOrders!.toString(),
                                    style: const TextStyle(color: Color(0xFF7ED957), fontWeight: FontWeight.w700, fontSize: 21),
                                  ),
                                  const Text(
                                    'Delivered',
                                    style: TextStyle(color: Color(0xFF393E50), fontWeight: FontWeight.w600, fontSize: 14),
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                  addWidth(19),
                  Expanded(
                    child: Container(
                      height: 165,
                      width: AddSize.screenWidth,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [
                        BoxShadow(
                          color: Color(0xFF5F5F5F).withOpacity(0.4),
                          offset: Offset(0.0, 0.5),
                          blurRadius: 5,
                        ),
                      ]),
                      child: Stack(
                        children: [
                          Positioned(
                              right: 0,
                              child: Image.asset(
                                'assets/images/Group 363.png',
                                height: 98,
                              )),
                          Positioned(
                              bottom: 10,
                              left: 10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                  Text(
                                    dashboardModel!.data!.pendingOrders!.toString(),
                                    style: TextStyle(color: Color(0xFFFF980E), fontWeight: FontWeight.w700, fontSize: 21),
                                  ),
                                  const Text(
                                    'Pending',
                                    style: TextStyle(color: Color(0xFF393E50), fontWeight: FontWeight.w600, fontSize: 14),
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Today Order',
                    style: GoogleFonts.quicksand(fontWeight: FontWeight.w700, fontSize: 18, color: const Color(0xFF303C5E)),
                  ),
                  Text(
                    "(${dashboardModel!.data!.todaysOrder.toString()})",
                    style: GoogleFonts.quicksand(fontWeight: FontWeight.w700, fontSize: 18, color: const Color(0xFF4DBA4D)),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Get.toNamed(MyRouters.assignedOrderScreen);
                    },
                    child: Text(
                      'See All',
                      style: GoogleFonts.quicksand(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: const Color(0xFF4DBA4D)),
                    ),
                  ),
                ],
              ),
              addHeight(12.0),
              ListView.builder(
                shrinkWrap: true,
                itemCount: dashboardModel!.data!.driverList!.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, i) {
                  final driverOrderList= dashboardModel!.data!.driverList![i];
                  return
                  dashboardModel!.data != null ?
                    Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
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
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                                    Text(
                                      'Delivered',
                                      style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.w700, fontSize: 14, color: const Color(0xFF4DBA4D)),
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
                                      "Date",
                                      style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.w700, fontSize: 14, color: const Color(0xFF303C5E)),
                                    ),
                                    Spacer(),
                                    Text(
                                      driverOrderList.date.toString(),
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
                                      '# ${driverOrderList.orderId.toString()}',
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
                                    const Spacer(),
                                    if(driverOrderList.address != null)
                                    Text(
                                      "${driverOrderList.address!.address1.toString()} ${driverOrderList.address!.address2.toString()} ${driverOrderList.address!.city.toString()} ${driverOrderList.address!.zipCode.toString()}",
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
                      addHeight(20),
                    ],
                  ):const CircularProgressIndicator(color: Colors.green,);
                },
              ),
            ],
          ),
        ),
      ):const CircularProgressIndicator(color: Colors.green,),
    );
  }
}
