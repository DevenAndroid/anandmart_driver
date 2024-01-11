import 'dart:convert';
import 'dart:io';

import 'package:anandmart_driver/Repository/common_repo.dart';
import 'package:anandmart_driver/Resources/api_urls.dart';
import 'package:anandmart_driver/widgets/app_assets.dart';
import 'package:anandmart_driver/widgets/app_text.dart';
import 'package:anandmart_driver/widgets/app_theme.dart';
import 'package:anandmart_driver/widgets/custome_textfiled.dart';
import 'package:anandmart_driver/widgets/dimenestion.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../Repository/update_driver_info.dart';
import '../Resources/common_text.dart';
import '../models/driver_profile_model.dart';
import '../widgets/new_helper.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final nameController = TextEditingController();
  final midleController = TextEditingController();
  final lastController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final idController = TextEditingController();
  final vichileController = TextEditingController();
  final licenceController = TextEditingController();
  final insuranceController = TextEditingController();
  final addressController = TextEditingController();
  Repositories repositories = Repositories();
  DriverProfileModel? driverProfileModel;
  final key = GlobalKey<ScaffoldState>();
  final formKey1 = GlobalKey<FormState>();
  var currentDrawer = 0;
  Rx<File> image = File("").obs;

  getDriverInfo() {
    repositories.getApi(url: ApiUrl.driverInfoUrl).then((value) {
      driverProfileModel = DriverProfileModel.fromJson(jsonDecode(value));
      nameController.text = driverProfileModel!.data!.firstName.toString();
      midleController.text = driverProfileModel!.data!.middleName.toString();
      lastController.text = driverProfileModel!.data!.lastName.toString();
      emailController.text = driverProfileModel!.data!.email.toString();
      phoneController.text = driverProfileModel!.data!.phone.toString();
      idController.text = driverProfileModel!.data!.identityCard.toString();
      vichileController.text = driverProfileModel!.data!.vehicleNo.toString();
      licenceController.text = driverProfileModel!.data!.licenceNo.toString();
      insuranceController.text = driverProfileModel!.data!.licenceNo.toString();
      addressController.text = driverProfileModel!.data!.location.toString();
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getDriverInfo();
    });

  }

  showUploadWindow() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AddSize.padding16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AddSize.size10),
                    Text("Choose From Which", style: TextStyle(fontWeight: FontWeight.w500, fontSize: AddSize.font16)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          child: Text("Gallery",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, color: AppTheme.primaryColor, fontSize: AddSize.font14)),
                          onPressed: () {
                            NewHelper().addFilePicker().then((value) {
                              image.value = value!;
                              setState(() {});
                            });
                            Get.back();
                          },
                        ),
                        TextButton(
                          child: Text("Camera",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, color: AppTheme.primaryColor, fontSize: AddSize.font14)),
                          onPressed: () {
                            NewHelper().addImagePicker(imageSource: ImageSource.camera).then((value) {
                              image.value = value!;
                              setState(() {});
                            });
                            Get.back();
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AddSize.size20,
                    ),
                  ],
                )),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: const Color(0xffF5F5F5),
          appBar: AppBar(
            backgroundColor: const Color(0xffF5F5F5),
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
              style: GoogleFonts.quicksand(fontSize: 18, fontWeight: FontWeight.w700, color: const Color(0xFF303C5E)),
            ),
          ),
          body: driverProfileModel != null
              ?
          Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Container(
                    padding: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF5F5F5F).withOpacity(0.2),
                        offset: const Offset(0.0, 0.2),
                        blurRadius: 2,
                      ),
                    ]),
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey1,
                        child: Column(
                          children: [
                            Center(
                                child: SizedBox(
                              height: 200,
                              width: size.width,
                              child: Stack(children: [
                                //       image.value.path == "" ?
                                // Image.asset(
                                //     AppAssets.man1,
                                //     fit: BoxFit.fill,
                                // ):
                                //       ClipRRect(
                                //         borderRadius: BorderRadius.circular(100),
                                //         child: Image.file(
                                //         image.value,
                                //         fit: BoxFit.fill,
                                //         height: 80,
                                //         width: 92,
                                //         ),
                                //       ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10000),
                                      child: Container(
                                       height: 120,
                                        width: 120,
                                        // clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: const Color(0xffFAAF40),
                                          border: Border.all(color: const Color(0xffFE7E73), width: 6),
                                          // borderRadius: BorderRadius.circular(5000),
                                          // color: Colors.brown
                                        ),
                                        child:
                                        ClipRRect(
                                          borderRadius:  BorderRadius.circular(1000),
                                          child: image.value.path == "" ?
                                          driverProfileModel!.data!.profileImage == "" ?
                                          const SizedBox(
                                            height: 100,
                                            width: 100,
                                          ) :
                                          Image.network(
                                            driverProfileModel!.data!.profileImage.toString(),
                                            fit: BoxFit.cover,
                                          ):
                                          Image.file(
                                            image.value,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        // Image.asset('assets/images/man.png',height: 70,width:40,fit: BoxFit.fill,)
                                      ),
                                    ),
                                  ],
                                ),
                                Positioned(
                                  top: 80,
                                  left: 90,
                                  right: 12,
                                  child: GestureDetector(
                                    onTap: () {
                                      showUploadWindow();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(color: Color(0xff04666E), shape: BoxShape.circle),
                                      child: const Icon(
                                        Icons.camera_alt,
                                        color: Colors.white,
                                        size: 15,
                                      ),
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
                                          "${driverProfileModel!.data!.firstName.toString().capitalizeFirst} ${driverProfileModel!.data!.middleName.toString().capitalizeFirst} ${driverProfileModel!.data!.lastName.toString().capitalizeFirst}",
                                          // profileData.userName.toString(),
                                          style: GoogleFonts.poppins(
                                              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                                        ),
                                        Text(
                                          "Edit Profile",
                                          // profileData.email.toString(),
                                          style: GoogleFonts.poppins(
                                              color: Colors.grey, fontWeight: FontWeight.normal, fontSize: 12),
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
                                        ? GoogleFonts.poppins(
                                            color: const Color(0xff1A2E33), fontSize: 14, fontWeight: FontWeight.w500)
                                        : GoogleFonts.poppins(
                                            color: AppTheme.primaryColor, fontSize: 14, fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    "Address",
                                    style: currentDrawer == 1
                                        ? GoogleFonts.poppins(color: Colors.cyan, fontSize: 14, fontWeight: FontWeight.w500)
                                        : GoogleFonts.poppins(
                                            color: Color(0xff1A2E33), fontSize: 14, fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    "Document",
                                    style: currentDrawer == 1
                                        ? GoogleFonts.poppins(color: Colors.cyan, fontSize: 14, fontWeight: FontWeight.w500)
                                        : GoogleFonts.poppins(
                                            color: Color(0xff1A2E33), fontSize: 14, fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height,
                              child: TabBarView(children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Form(
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "First Name",
                                                      style: GoogleFonts.quicksand(
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 15,
                                                        color: const Color(0xFF000000),
                                                        // fontStyle: FontStyle.italic,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    RegisterTextFieldWidget(
                                                      controller: nameController,
                                                      onTap: () {},
                                                      hint: 'First Name',
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 25,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Middle Name",
                                                      style: GoogleFonts.quicksand(
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 15,
                                                        color: const Color(0xFF000000),
                                                        // fontStyle: FontStyle.italic,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    RegisterTextFieldWidget(
                                                      controller: midleController,
                                                      onTap: () {},
                                                      hint: 'Middle Name',
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          addHeight(15),
                                          Text(
                                            "Last Name",
                                            style: GoogleFonts.quicksand(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,
                                              color: const Color(0xFF000000),
                                              // fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          RegisterTextFieldWidget(
                                            controller: lastController,
                                            onTap: () {},
                                            hint: 'Last Name',
                                          ),
                                          addHeight(15),
                                          Text(
                                            "Email",
                                            style: GoogleFonts.quicksand(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,
                                              color: const Color(0xFF000000),
                                              // fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          RegisterTextFieldWidget(
                                            controller: emailController,
                                            onTap: () {},
                                            hint: 'Email',
                                          ),
                                          addHeight(15),
                                          Text(
                                            "Phone Number",
                                            style: GoogleFonts.quicksand(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,
                                              color: const Color(0xFF000000),
                                              // fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          RegisterTextFieldWidget(
                                            controller: phoneController,
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
                                                    Text(
                                                      "ID Card Number",
                                                      style: GoogleFonts.quicksand(
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 15,
                                                        color: const Color(0xFF000000),
                                                        // fontStyle: FontStyle.italic,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    RegisterTextFieldWidget(
                                                      controller: idController,
                                                      onTap: () {},
                                                      hint: 'ID Card Number',
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 25,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Pan Card Number",
                                                      style: GoogleFonts.quicksand(
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 15,
                                                        color: const Color(0xFF000000),
                                                        // fontStyle: FontStyle.italic,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
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
                                                    Text(
                                                      "Vichele Number",
                                                      style: GoogleFonts.quicksand(
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 15,
                                                        color: const Color(0xFF000000),
                                                        // fontStyle: FontStyle.italic,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    RegisterTextFieldWidget(
                                                      controller: vichileController,
                                                      onTap: () {},
                                                      hint: 'Vichele Number',
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 25,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Licence Number",
                                                      style: GoogleFonts.quicksand(
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 15,
                                                        color: const Color(0xFF000000),
                                                        // fontStyle: FontStyle.italic,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    RegisterTextFieldWidget(
                                                      controller: licenceController,
                                                      onTap: () {},
                                                      hint: 'Licence Number',
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          addHeight(15),
                                          Text(
                                            "Insurance",
                                            style: GoogleFonts.quicksand(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,
                                              color: const Color(0xFF000000),
                                              // fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          RegisterTextFieldWidget(
                                            controller: insuranceController,
                                            onTap: () {},
                                            hint: 'Insurance',
                                          ),
                                        ]),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Form(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "Address 1",
                                          style: GoogleFonts.quicksand(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                            color: const Color(0xFF000000),
                                            // fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        RegisterTextFieldWidget(
                                          controller: addressController,
                                          onTap: () {},
                                          hint: 'Address 1',
                                          minLines: 5,
                                          maxLines: null,
                                        ),
                                        // addHeight(15),
                                        // Text("Address 2",
                                        //   style: GoogleFonts.quicksand(
                                        //     fontWeight: FontWeight.w600,
                                        //     fontSize: 15,
                                        //     color:const Color(0xFF000000),
                                        //     // fontStyle: FontStyle.italic,
                                        //   ),),
                                        // const SizedBox(height: 10,),
                                        // RegisterTextFieldWidget(
                                        //   onTap: () {},
                                        //   hint: 'Address 2',
                                        // ),
                                        // addHeight(15),
                                        // Row(
                                        //   children: [
                                        //     Expanded(
                                        //       child: Column(
                                        //         mainAxisAlignment: MainAxisAlignment.start,
                                        //         crossAxisAlignment: CrossAxisAlignment.start,
                                        //         children: [
                                        //           Text("City",
                                        //             style: GoogleFonts.quicksand(
                                        //               fontWeight: FontWeight.w600,
                                        //               fontSize: 15,
                                        //               color:const Color(0xFF000000),
                                        //               // fontStyle: FontStyle.italic,
                                        //             ),),
                                        //           const SizedBox(height: 10,),
                                        //           RegisterTextFieldWidget(
                                        //             onTap: () {},
                                        //             hint: 'City',
                                        //           ),
                                        //         ],
                                        //       ),
                                        //     ),
                                        //     SizedBox(width: 25,),
                                        //     Expanded(
                                        //       child: Column(
                                        //         mainAxisAlignment: MainAxisAlignment.start,
                                        //         crossAxisAlignment: CrossAxisAlignment.start,
                                        //         children: [
                                        //           Text("State",
                                        //             style: GoogleFonts.quicksand(
                                        //               fontWeight: FontWeight.w600,
                                        //               fontSize: 15,
                                        //               color:const Color(0xFF000000),
                                        //               // fontStyle: FontStyle.italic,
                                        //             ),),
                                        //           const SizedBox(height: 10,),
                                        //           RegisterTextFieldWidget(
                                        //             onTap: () {},
                                        //             hint: 'State',
                                        //           ),
                                        //         ],
                                        //       ),
                                        //     ),
                                        //   ],
                                        // ),
                                        //
                                        // addHeight(15),
                                        // Row(
                                        //   children: [
                                        //     Expanded(
                                        //       child: Column(
                                        //         mainAxisAlignment: MainAxisAlignment.start,
                                        //         crossAxisAlignment: CrossAxisAlignment.start,
                                        //         children: [
                                        //           Text("Zipcode",
                                        //             style: GoogleFonts.quicksand(
                                        //               fontWeight: FontWeight.w600,
                                        //               fontSize: 15,
                                        //               color:const Color(0xFF000000),
                                        //               // fontStyle: FontStyle.italic,
                                        //             ),),
                                        //           const SizedBox(height: 10,),
                                        //           RegisterTextFieldWidget(
                                        //             onTap: () {},
                                        //             hint: 'Zipcode',
                                        //           ),
                                        //         ],
                                        //       ),
                                        //     ),
                                        //     SizedBox(width: 25,),
                                        //     Expanded(
                                        //       child: Column(
                                        //         mainAxisAlignment: MainAxisAlignment.start,
                                        //         crossAxisAlignment: CrossAxisAlignment.start,
                                        //         children: [
                                        //           Text("Landmark (optional)",
                                        //             style: GoogleFonts.quicksand(
                                        //               fontWeight: FontWeight.w600,
                                        //               fontSize: 15,
                                        //               color:const Color(0xFF000000),
                                        //               // fontStyle: FontStyle.italic,
                                        //             ),),
                                        //           const SizedBox(height: 10,),
                                        //           RegisterTextFieldWidget(
                                        //             onTap: () {},
                                        //             hint: 'Landmark (optional)',
                                        //           ),
                                        //         ],
                                        //       ),
                                        //     ),
                                        //   ],
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Form(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          "Upload Insurance image",
                                          style: GoogleFonts.quicksand(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                            color: const Color(0xFF000000),
                                            // fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        DottedBorder(
                                          borderType: BorderType.RRect,
                                          radius: Radius.circular(12),
                                          padding: EdgeInsets.all(6),
                                          child: ClipRRect(
                                              borderRadius: BorderRadius.all(Radius.circular(12)),
                                              child: Container(
                                                  width: size.width,
                                                  height: size.height * .15,
                                                  child: CachedNetworkImage(
                                                    imageUrl: driverProfileModel!.data!.insurance != null
                                                        ? (driverProfileModel!.data!.insurance ?? "").toString()
                                                        : "",
                                                    errorWidget: (_, __, ___) => Image.asset("assets/images/statement.png"),
                                                    placeholder: (_, __) => const SizedBox(),
                                                    fit: BoxFit.contain,
                                                    // height: 60,
                                                  ))),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          "Upload Driver Licence",
                                          style: GoogleFonts.quicksand(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                            color: const Color(0xFF000000),
                                            // fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
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
                                                        height: size.height * .15,
                                                        child: CachedNetworkImage(
                                                          imageUrl: driverProfileModel!.data!.licenceFrontImage != null
                                                              ? (driverProfileModel!.data!.licenceFrontImage ?? "").toString()
                                                              : "",
                                                          errorWidget: (_, __, ___) => Image.asset("assets/images/adhar.png"),
                                                          placeholder: (_, __) => const SizedBox(),
                                                          fit: BoxFit.contain,
                                                          // height: 60,
                                                        ))),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 25,
                                            ),
                                            Expanded(
                                              child: DottedBorder(
                                                borderType: BorderType.RRect,
                                                radius: Radius.circular(12),
                                                padding: EdgeInsets.all(6),
                                                child: ClipRRect(
                                                    borderRadius: BorderRadius.all(Radius.circular(12)),
                                                    child: Container(
                                                        width: size.width,
                                                        height: size.height * .15,
                                                        child: CachedNetworkImage(
                                                          imageUrl: driverProfileModel!.data!.licenceBackImage != null
                                                              ? (driverProfileModel!.data!.licenceBackImage ?? "").toString()
                                                              : "",
                                                          errorWidget: (_, __, ___) => Image.asset("assets/images/adhar.png"),
                                                          placeholder: (_, __) => const SizedBox(),
                                                          fit: BoxFit.contain,
                                                          // height: 60,
                                                        ))),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "Upload Identity Card",
                                          style: GoogleFonts.quicksand(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                            color: const Color(0xFF000000),
                                            // fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
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
                                                        height: size.height * .15,
                                                        child: CachedNetworkImage(
                                                          imageUrl: driverProfileModel!.data!.idFrontImage != null
                                                              ? (driverProfileModel!.data!.idFrontImage ?? "").toString()
                                                              : "",
                                                          errorWidget: (_, __, ___) => Image.asset("assets/images/adhar.png"),
                                                          placeholder: (_, __) => const SizedBox(),
                                                          fit: BoxFit.contain,
                                                          // height: 60,
                                                        ))),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 25,
                                            ),
                                            Expanded(
                                              child: DottedBorder(
                                                borderType: BorderType.RRect,
                                                radius: Radius.circular(12),
                                                padding: EdgeInsets.all(6),
                                                child: ClipRRect(
                                                    borderRadius: BorderRadius.all(Radius.circular(12)),
                                                    child: Container(
                                                        width: size.width,
                                                        height: size.height * .15,
                                                        child: CachedNetworkImage(
                                                          imageUrl: driverProfileModel!.data!.idBackImage != null
                                                              ? (driverProfileModel!.data!.idBackImage ?? "").toString()
                                                              : "",
                                                          errorWidget: (_, __, ___) => Image.asset("assets/images/adhar.png"),
                                                          placeholder: (_, __) => const SizedBox(),
                                                          fit: BoxFit.contain,
                                                          // height: 60,
                                                        ))),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: CommonButton1(
              title: "Continue",
              onPressed: () {
                if (formKey1.currentState!.validate() ) {
                  Map<String, String> mapData = {
                    'first_name': nameController.text,
                    'middle_name': midleController.text,
                    'last_name': lastController.text,
                    'email': emailController.text,
                    'phone': phoneController.text,
                    'location': addressController.text,
                    'identity_card': idController.text,
                    'insurance_no': insuranceController.text,
                    'vehicle_no': vichileController.text,
                    'licence_no': licenceController.text,
                  };
                  editUserProfileRepo(
                    context: context,
                    mapData: mapData,
                    fieldName1: "profile_image",
                    file1: image.value,
                  ).then((value) {
                    if (value.status == true) {
                      showToast(value.message);
                      getDriverInfo();
                      Get.back();
                    } else {
                      showToast(value.message);
                    }
                  });
                }
              },
            ),
          ),
        ));
  }
}
