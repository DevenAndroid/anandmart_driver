import 'dart:io';

import 'package:anandmart_driver/routers/routers.dart';
import 'package:anandmart_driver/widgets/app_text.dart';
import 'package:anandmart_driver/widgets/custome_size.dart';
import 'package:anandmart_driver/widgets/custome_textfiled.dart';
import 'package:anandmart_driver/widgets/dimenestion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/app_theme.dart';
import '../widgets/new_helper.dart';


class DeliveryPartnerApplyScreen extends StatefulWidget {
  const DeliveryPartnerApplyScreen({Key? key}) : super(key: key);

  @override
  State<DeliveryPartnerApplyScreen> createState() =>
      _DeliveryPartnerApplyScreenState();
}

class _DeliveryPartnerApplyScreenState
    extends State<DeliveryPartnerApplyScreen> {
  final _formKey = GlobalKey<FormState>();
  Rx<File> image = File("").obs;
  Rx<File> image1 = File("").obs;
  Rx<File> image2 = File("").obs;
  final ImagePicker picker = ImagePicker();

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
                    Text("Choose From Which",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: AddSize.font16)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          child: Text("Gallery",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: AppTheme.primaryColor,
                                  fontSize: AddSize.font14)),
                          onPressed: () {
                            NewHelper().addFilePicker().then((value) {
                              image.value = value!;
                            });
                            Get.back();
                          },
                        ),
                        TextButton(
                          child: Text("Camera",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: AppTheme.primaryColor,
                                  fontSize: AddSize.font14)),
                          onPressed: () {
                            NewHelper()
                                .addImagePicker(imageSource: ImageSource.camera)
                                .then((value) {
                              image.value = value!;
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

  String dropdownvalue = 'Car';

  var items = [
    'Car',
    'Motorcycle',
    'Bicycle',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: backAppBar(title: 'Delivery Partner Apply', context: context),
      body: Obx(() {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF5F5F5F).withOpacity(0.2                            ),
                    offset: const Offset(0.0, 0.2),
                    blurRadius: 2,),
                ]
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 20),
              child: Form(
                key: _formKey,
                child: Column(
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
                    addHeight(25),
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
                    addHeight(25),
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
                    addHeight(25),


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
                      hint: 'Enter Email Address',
                    ),
                    addHeight(25),
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
                      hint: 'Enter Phone Number',
                    ),
                    addHeight(25),
                    Text("Address",
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color:const Color(0xFF000000),
                        // fontStyle: FontStyle.italic,
                      ),),
                    const SizedBox(height: 10,),

                    RegisterTextFieldWidget(
                      onTap: () {},
                      hint: 'Address',
                    ),
                    addHeight(25),
                    Text("Date OF Birth",
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color:const Color(0xFF000000),
                        // fontStyle: FontStyle.italic,
                      ),),
                    const SizedBox(height: 10,),

                    RegisterTextFieldWidget(
                      onTap: () {},
                      hint: 'Date OF Birth',
                    ),
                    addHeight(25),
                    Text("Aadhar Card Number",
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color:const Color(0xFF000000),
                        // fontStyle: FontStyle.italic,
                      ),),
                    const SizedBox(height: 10,),

                    RegisterTextFieldWidget(
                      onTap: () {},
                      hint: 'Aadhar Card Number',
                    ),
                    addHeight(25),
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
                    addHeight(25),
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
                    addHeight(25),
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





                    addHeight(25),
                     Text('Upload Bank account statement and cancel cheque',
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color:const Color(0xFF000000),
                        // fontStyle: FontStyle.italic,
                      ),),
                    addHeight(15),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      width: AddSize.screenWidth,
                      decoration: BoxDecoration(
                          color: const Color(0xFFF4F4F4),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: const Color(0xFFE2E2E2),
                              width: 1)
                      ),
                      child: InkWell(
                        onTap: () {
                          showUploadWindow();
                        },
                        child: image.value.path == "" ?
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Text('Upload',
                               style: GoogleFonts.quicksand(
                                 fontWeight: FontWeight.w600,
                                 fontSize: 15,
                                 color:const Color(0xFF000000),
                                 // fontStyle: FontStyle.italic,
                               ),),
                            addHeight(10),
                            Image.asset('assets/images/camera.png', height: 60,)
                          ],
                        ) : Image.file(
                          image.value,
                          fit: BoxFit.contain,
                          height: 100,
                          width: 92,
                        ),
                      ),
                    ),
                    addHeight(25),
                     Text('Upload Driver Licence',
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color:const Color(0xFF000000),
                        // fontStyle: FontStyle.italic,
                      ),),
                    addHeight(15),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            width: AddSize.screenWidth,
                            decoration: BoxDecoration(
                                color: const Color(0xFFF4F4F4),
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color: const Color(0xFFE2E2E2),
                                    width: 1)
                            ),
                            child: InkWell(
                              onTap: () {
                                showUploadWindow();
                              },
                              child: image1.value.path == "" ?
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                   Text('Front',
                                    style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      color:const Color(0xFF000000),
                                      // fontStyle: FontStyle.italic,
                                    ),),
                                  addHeight(10),
                                  Image.asset('assets/images/camera.png', height: 60,)
                                ],
                              ) : Image.file(
                                image1.value,
                                fit: BoxFit.contain,
                                height: 100,
                                width: 92,
                              ),
                            ),
                          ),
                        ),
                        addWidth(17),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            width: AddSize.screenWidth,
                            decoration: BoxDecoration(
                                color: const Color(0xFFF4F4F4),
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color: const Color(0xFFE2E2E2),
                                    width: 1)
                            ),
                            child: InkWell(
                              onTap: () {
                                showUploadWindow();
                              },
                              child: image2.value.path == "" ?
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                   Text('Back',
                                    style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      color:const Color(0xFF000000),
                                      // fontStyle: FontStyle.italic,
                                    ),),
                                  addHeight(10),
                                  Image.asset('assets/images/camera.png', height: 60,)
                                ],
                              ) : Image.file(
                                image2.value,
                                fit: BoxFit.contain,
                                height: 100,
                                width: 92,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    addHeight(25),
                    Text('Upload Pan Card',
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color:const Color(0xFF000000),
                        // fontStyle: FontStyle.italic,
                      ),),
                    const SizedBox(height: 10,),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      width: AddSize.screenWidth,
                      decoration: BoxDecoration(
                          color: const Color(0xFFF4F4F4),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: const Color(0xFFE2E2E2),
                              width: 1)
                      ),
                      child: InkWell(
                        onTap: () {
                          showUploadWindow();
                        },
                        child: image.value.path == "" ?
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Upload',
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color:const Color(0xFF000000),
                                // fontStyle: FontStyle.italic,
                              ),),
                            addHeight(10),
                            Image.asset('assets/images/camera.png', height: 60,)
                          ],
                        ) : Image.file(
                          image.value,
                          fit: BoxFit.contain,
                          height: 100,
                          width: 92,
                        ),
                      ),
                    ),
                    addHeight(25),
                    Text('Upload Adhar Card',
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color:const Color(0xFF000000),
                        // fontStyle: FontStyle.italic,
                      ),),
                    addHeight(15),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            width: AddSize.screenWidth,
                            decoration: BoxDecoration(
                                color: const Color(0xFFF4F4F4),
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color: const Color(0xFFE2E2E2),
                                    width: 1)
                            ),
                            child: InkWell(
                              onTap: () {
                                showUploadWindow();
                              },
                              child: image1.value.path == "" ?
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Front',
                                    style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      color:const Color(0xFF000000),
                                      // fontStyle: FontStyle.italic,
                                    ),),
                                  addHeight(10),
                                  Image.asset('assets/images/camera.png', height: 60,)
                                ],
                              ) : Image.file(
                                image1.value,
                                fit: BoxFit.contain,
                                height: 100,
                                width: 92,
                              ),
                            ),
                          ),
                        ),
                        addWidth(17),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            width: AddSize.screenWidth,
                            decoration: BoxDecoration(
                                color: const Color(0xFFF4F4F4),
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color: const Color(0xFFE2E2E2),
                                    width: 1)
                            ),
                            child: InkWell(
                              onTap: () {
                                showUploadWindow();
                              },
                              child: image2.value.path == "" ?
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Back',
                                    style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      color:const Color(0xFF000000),
                                      // fontStyle: FontStyle.italic,
                                    ),),
                                  addHeight(10),
                                  Image.asset('assets/images/camera.png', height: 60,)
                                ],
                              ) : Image.file(
                                image2.value,
                                fit: BoxFit.contain,
                                height: 100,
                                width: 92,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    addHeight(30),
                    CommonButton1(title: 'Apply',onPressed: (){
                      Get.toNamed(MyRouters.thankYouVendorScreen);
                    },)
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
