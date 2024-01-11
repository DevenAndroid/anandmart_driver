import 'package:anandmart_driver/routers/routers.dart';
import 'package:anandmart_driver/widgets/custome_size.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Resources/common_text.dart';
import '../widgets/app_assets.dart';
import '../widgets/app_theme.dart';
import '../widgets/custome_textfiled.dart';
import '../widgets/dimenestion.dart';

class DriverDeliveryOrderDetails extends StatefulWidget {
  const DriverDeliveryOrderDetails({Key? key}) : super(key: key);
  static var driverDeliveryOrderDetails = "/driverDeliveryOrderDetails";
  @override
  _DriverDeliveryOrderDetailsState createState() => _DriverDeliveryOrderDetailsState();
}

class _DriverDeliveryOrderDetailsState extends State<DriverDeliveryOrderDetails> with SingleTickerProviderStateMixin {
  bool value = false;
  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  Future<void> openMap(double latitude, double longitude) async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

  _makingPhoneCall(call) async {
    var url = Uri.parse(call);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: backAppBar(title: "Delivery Details", context: context),
      body: Column(
        children: [
          addHeight(20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AddSize.padding16),
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      offset: const Offset(
                        .1,
                        .1,
                      ),
                      blurRadius: 20.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AddSize.padding15, vertical: AddSize.padding15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        Row(
                          children: [
                            const ImageIcon(
                              AssetImage(AppAssets.orderList),
                              color: AppTheme.primaryColor,
                              size: 20,
                            ),
                            SizedBox(
                              width: AddSize.size15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Order ID: #258147',
                                  style: TextStyle(
                                      color: AppTheme.primaryColor, fontSize: AddSize.font16, fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Monday, 2 June, 2021',
                                  style: TextStyle(
                                      color: AppTheme.blackcolor, fontSize: AddSize.font12, fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ]),
                    ],
                  ),
                )),
          ),
          SizedBox(
            height: AddSize.size14,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AddSize.padding16),
            child: Container(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          offset: const Offset(
                            .1,
                            .1,
                          ),
                          blurRadius: 20.0,
                          spreadRadius: 1.0,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Card(
                          elevation: 0,
                          color: AppTheme.backgroundcolor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: AddSize.padding15, vertical: AddSize.padding15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Customer Details",
                                  style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w700, fontSize: 18, color: const Color(0xFF303C5E)),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Customer Name",
                                            style: GoogleFonts.quicksand(
                                                fontWeight: FontWeight.w500, fontSize: 14, color: const Color(0xFF3E525A)),
                                          ),
                                          Text(
                                            'Piyush Prajapati',
                                            style: GoogleFonts.quicksand(
                                                fontWeight: FontWeight.w700, fontSize: 16, color: const Color(0xFF303C5E)),
                                          ),
                                        ],
                                      ),
                                    ]),
                                    Container(
                                      height: AddSize.size45,
                                      width: AddSize.size45,
                                      decoration: const ShapeDecoration(color: Color(0xFFFF980E), shape: CircleBorder()),
                                      child: Center(
                                          child: Image(
                                        image: const AssetImage(AppAssets.personLogo),
                                        height: AddSize.size25,
                                        width: AddSize.size25,
                                      )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(
                          color: Color(0xFFEFEFEF),
                          height: 1,
                          thickness: 1,
                        ),
                        Card(
                          elevation: 0,
                          color: AppTheme.backgroundcolor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: AddSize.padding15, vertical: AddSize.padding15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Customer Number",
                                        style: GoogleFonts.quicksand(
                                            fontWeight: FontWeight.w500, fontSize: 14, color: const Color(0xFF3E525A)),
                                      ),
                                      Text(
                                        '+91 9876454321',
                                        style: GoogleFonts.quicksand(
                                            fontWeight: FontWeight.w700, fontSize: 16, color: const Color(0xFF303C5E)),
                                      ),
                                    ],
                                  ),
                                ]),
                                GestureDetector(
                                  onTap: () {
                                    _makingPhoneCall("tel:+91");
                                  },
                                  child: Container(
                                      height: AddSize.size45,
                                      width: AddSize.size45,
                                      decoration: const ShapeDecoration(color: Color(0xff4DBA4D), shape: CircleBorder()),
                                      child: const Center(
                                          child: Icon(
                                        Icons.phone,
                                        color: Colors.white,
                                        // color: AppTheme.callPhoneColor,
                                      ))),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(
                          color: Color(0xFFEFEFEF),
                          height: 1,
                          thickness: 1,
                        ),
                        Card(
                          elevation: 0,
                          color: AppTheme.backgroundcolor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: AddSize.padding15, vertical: AddSize.padding15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Customer Address",
                                        style: GoogleFonts.quicksand(
                                            fontWeight: FontWeight.w500, fontSize: 14, color: const Color(0xFF3E525A)),
                                      ),
                                      Text(
                                        'Douglas, Cork, T16 XN73, uk',
                                        style: GoogleFonts.quicksand(
                                            fontWeight: FontWeight.w700, fontSize: 16, color: const Color(0xFF303C5E)),
                                      ),
                                    ],
                                  ),
                                ]),
                                GestureDetector(
                                  onTap: () {
                                    // openMap();
                                  },
                                  child: Container(
                                    height: AddSize.size45,
                                    width: AddSize.size45,
                                    decoration: const ShapeDecoration(color: AppTheme.lightYellow, shape: CircleBorder()),
                                    child: const Center(
                                        child: Icon(
                                      Icons.location_on,
                                      color: AppTheme.backgroundcolor,
                                    )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  addHeight(15),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          offset: const Offset(
                            .1,
                            .1,
                          ),
                          blurRadius: 20.0,
                          spreadRadius: 1.0,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Click Picture",
                          style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w500, fontSize: 18, color: const Color(0xFF3E525A)),
                        ),
                        SvgPicture.asset(AppAssets.camera)
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: AddSize.padding16, vertical: AddSize.size40),
          child: CommonButton(
            title: 'Mark Delivered',
            onPressed: () {
              // Get.toNamed(MyRouters.bankDetailsScreen);
            },
          )),
    );
  }

  // orderList(name, price, qty) {
  //   var height = MediaQuery.of(context).size.height;
  //   var width = MediaQuery.of(context).size.width;
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Center(
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Expanded(
  //               child: Text(
  //                 name,
  //                 style: TextStyle(
  //                     fontSize: AddSize.font16,
  //                     color: AppTheme.blackcolor,
  //                     fontWeight: FontWeight.w500),
  //               ),
  //             ),
  //             Text(
  //               "₹$price",
  //               style: TextStyle(
  //                   fontSize: AddSize.font16,
  //                   color: AppTheme.primaryColor,
  //                   fontWeight: FontWeight.w500),
  //             ),
  //           ],
  //         ),
  //       ),
  //       SizedBox(
  //         height: height * .01,
  //       ),
  //       Row(
  //         children: [
  //           Text(
  //             qty,
  //             style: TextStyle(
  //                 fontSize: AddSize.font14,
  //                 color: AppTheme.lightblack,
  //                 fontWeight: FontWeight.w500),
  //           ),
  //           SizedBox(
  //             width: width * .01,
  //           ),
  //           const Text("*"),
  //           SizedBox(
  //             width: width * .01,
  //           ),
  //
  //         ],
  //       ),
  //     ],
  //   );
  // }

  // paymentDetails({
  //   required subTotal,
  //
  //   required delivery,
  //
  //   required total,
  //   required orderType,
  // }) {
  //   return Card(
  //       elevation: 0,
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  //       child: Padding(
  //           padding: EdgeInsets.symmetric(
  //               horizontal: AddSize.padding15, vertical: AddSize.padding15),
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               details("Subtotal:", "₹$subTotal"),
  //               SizedBox(
  //                 height: AddSize.size5,
  //               ),
  //               details("Delivery charges:", "₹$delivery"),
  //               SizedBox(
  //                 height: AddSize.size5,
  //               ),
  //               // details("Packing charges:", "₹$packing"),
  //               SizedBox(
  //                 height: AddSize.size5,
  //               ),
  //               // myOrderDetailsController
  //               //     .model.value.data!.tax !=0 ?
  //               // Column(children: [
  //               //   details("Tax & fee:",
  //               //       "₹${myOrderDetailsController
  //               //           .model.value.data!.tax ?? ""}"),
  //               //   SizedBox(
  //               //     height: AddSize.size5,
  //               //   ),
  //               // ],):const SizedBox(),
  //               // myOrderDetailsController
  //               //     .model.value.data!.tax1 !=null ?
  //               // Column(children: [
  //               //   details("${myOrderDetailsController
  //               //       .model.value.data!.tax1!.type ?? ""}:",
  //               //       "₹${myOrderDetailsController
  //               //           .model.value.data!.tax1!.amount ?? ""}"),
  //               //   SizedBox(
  //               //     height: AddSize.size5,
  //               //   ),
  //               // ],):const SizedBox(),
  //               // myOrderDetailsController
  //               //     .model.value.data!.tax2 !=null ?
  //               // Column(children: [
  //               //   details("${myOrderDetailsController
  //               //       .model.value.data!.tax2!.type ?? ""}:",
  //               //       "₹${myOrderDetailsController
  //               //           .model.value.data!.tax2!.amount ?? ""}"),
  //               //   SizedBox(
  //               //     height: AddSize.size10,
  //               //   ),
  //               // ],):const SizedBox(),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Text("Total:",
  //                       style: TextStyle(
  //                           color: AppTheme.primaryColor,
  //                           fontSize: AddSize.font16,
  //                           fontWeight: FontWeight.w500)),
  //                   Text("₹$total",
  //                       style: TextStyle(
  //                           color: Colors.grey,
  //                           fontSize: AddSize.font14,
  //                           fontWeight: FontWeight.w500))
  //                 ],
  //               ),
  //               SizedBox(
  //                 height: AddSize.size5,
  //               ),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.end,
  //                 children: [
  //                   ElevatedButton(
  //                       onPressed: () {
  //                         // Get.toNamed(MyRouter.editProfileScreen);
  //                       },
  //                       style: ElevatedButton.styleFrom(
  //                         minimumSize: Size(AddSize.size50, AddSize.size30),
  //                         primary: AppTheme.primaryColor,
  //                         elevation: 0,
  //                         shape: RoundedRectangleBorder(
  //                             borderRadius: BorderRadius.circular(6)),
  //                       ),
  //                       child: Text(
  //                         orderType,
  //                         style: Theme.of(context)
  //                             .textTheme
  //                             .headline5!
  //                             .copyWith(
  //                             color: AppTheme.backgroundcolor,
  //                             fontWeight: FontWeight.w500,
  //                             fontSize: AddSize.font14),
  //                       )),
  //                 ],
  //               )
  //             ],
  //           )));
  // }
  //
  // details(title, price) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       Text(title,
  //           style: TextStyle(
  //               color: AppTheme.blackcolor,
  //               fontSize: AddSize.font16,
  //               fontWeight: FontWeight.w500)),
  //       Text(price,
  //           style: TextStyle(
  //               color: Colors.grey,
  //               fontSize: AddSize.font14,
  //               fontWeight: FontWeight.w500))
  //     ],
  //   );
  // }
}
