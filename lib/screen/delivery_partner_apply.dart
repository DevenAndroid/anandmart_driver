import 'dart:developer';
import 'dart:io';
import 'package:anandmart_driver/screen/thank_you.dart';
import 'package:anandmart_driver/widgets/app_text.dart';
import 'package:anandmart_driver/widgets/custome_textfiled.dart';
import 'package:anandmart_driver/widgets/dimenestion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:flutter_google_places_hoc081098/google_maps_webservice_places.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../Repository/driver_registration_repo.dart';
import '../Resources/common_text.dart';
import '../widgets/app_assets.dart';
import '../widgets/app_theme.dart';
import '../widgets/new_helper.dart';


class DeliveryPartnerApplyScreen extends StatefulWidget {
  const DeliveryPartnerApplyScreen({Key? key}) : super(key: key);
  static var deliveryPartnerApplyScreen = "/DeliveryPartnerApplyScreen";

  @override
  State<DeliveryPartnerApplyScreen> createState() =>
      _DeliveryPartnerApplyScreenState();
}

class _DeliveryPartnerApplyScreenState
    extends State<DeliveryPartnerApplyScreen> {
  final nameController= TextEditingController();
  final middleNameController= TextEditingController();
  final lastNameController= TextEditingController();
  final emailController= TextEditingController();
  final phoneController= TextEditingController();
  final passwordController= TextEditingController();
  final addressController= TextEditingController();
  final dobController= TextEditingController();
  final IdentityController= TextEditingController();
  final insuranceController= TextEditingController();
  final vichleController= TextEditingController();
  final licenceController= TextEditingController();
  final _formKey = GlobalKey<FormState>();
  RxBool showValidation = false.obs;
  String googleApikey = "AIzaSyDDl-_JOy_bj4MyQhYbKbGkZ0sfpbTZDNU";
  bool obscureText1= false;
  String selectedDate="";
  String? _address = "";
  Rx<File> image = File("").obs;
  Rx<File> image1 = File("").obs;
  Rx<File> image2 = File("").obs;
  Rx<File> image3 = File("").obs;
  Rx<File> image4 = File("").obs;
  Rx<File> image5 = File("").obs;
  final ImagePicker picker = ImagePicker();

  //pickDate
  DateTime? pickedDate;

  bool checkValidation(bool bool1, bool2) {
    if (bool1 == true && bool2 == true) {
      return true;
    } else {
      return false;
    }
  }


  final ScrollController _scrollController = ScrollController();

  scrollNavigation(double offset) {
    _scrollController.animateTo(offset,
        duration: const Duration(seconds: 1), curve: Curves.easeOutSine);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: backAppBar2(title: 'Delivery Partner Apply', context: context),
      body: Obx(() {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
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
                      controller: nameController,
                      onTap: () {},
                      hint: 'First Name',
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Please Enter your Name")
                      ]),
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
                      controller: middleNameController,
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
                      controller: lastNameController,
                      onTap: () {},
                      hint: 'Last Name',
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Please Enter your Last Name")
                      ]),
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
                      controller: emailController,
                      onTap: () {},
                      hint: 'Enter Email Address',
                      validator: MultiValidator([
                        RequiredValidator(
                            errorText:
                            'Please enter your email '),
                        EmailValidator(errorText: "please enter valid mail")

                      ]),
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
                      controller: phoneController,
                      onTap: () {},
                      hint: 'Enter Phone Number',
                      keyboardType: TextInputType.number,
                      length: 10,
                      validator: (value){
                        if(value!.isEmpty || value!.length < 10){
                          return "Please Enter Valid Number";
                        }else return null;
                      },
                    ),
                    addHeight(25),
                    Text("Password",
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color:const Color(0xFF000000),
                        // fontStyle: FontStyle.italic,
                      ),),
                    const SizedBox(height: 10,),
                    RegisterTextFieldWidget(
                      controller: passwordController,
                      onTap: () {},
                      hint: 'Enter your password',
                      length: 10,
                        obscureText: obscureText1,
                        suffix: GestureDetector(
                            onTap: () {
                              setState(() {
                                obscureText1 =
                                !obscureText1;
                              });
                            },
                            child: obscureText1
                                ? const Icon(
                              Icons.visibility_off,
                              color: Color(0xFF6A5454),
                            )
                                : const Icon(
                                Icons.visibility,
                                color: Color(
                                    0xFF6A5454))),
                      validator: MultiValidator([
                        RequiredValidator(
                            errorText: 'Please enter your password'),
                        MinLengthValidator(8,
                            errorText: 'Password must be at least 8 characters, with 1 special character & 1 numerical'),
                        PatternValidator(
                            r"(?=.*\W)(?=.*?[#?!@$%^&*-])(?=.*[0-9])",
                            // r'^(?=.*[A-Z])(?=.*\d).{8,}$',
                            errorText: "Password must be at least with 1 special character & 1 numerical"),
                      ]),
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
                    InkWell(
                        onTap: () async {
                          var place = await PlacesAutocomplete.show(
                              hint: "Location",
                              context: context,
                              apiKey: googleApikey,
                              mode: Mode.overlay,
                              types: [],
                              strictbounds: false,
                              onError: (err) {
                                log("error.....   ${err.errorMessage}");
                              });
                          if (place != null) {
                            setState(() {
                              _address = (place.description ?? "Location")
                                  .toString();
                            });
                            final plist = GoogleMapsPlaces(
                              apiKey: googleApikey,
                              apiHeaders: await const GoogleApiHeaders()
                                  .getHeaders(),
                            );
                            print(plist);
                            String placeid = place.placeId ?? "0";
                            final detail =
                            await plist.getDetailsByPlaceId(placeid);
                            final geometry = detail.result.geometry!;
                            final lat = geometry.location.lat;
                            final lang = geometry.location.lng;
                            setState(() {
                              _address = (place.description ?? "Location")
                                  .toString();
                            });
                            print(_address);
                            print(lat);
                            print(lang);

                          }
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: !checkValidation(
                                            showValidation.value,
                                            _address == "")
                                            ? Colors.grey.shade300
                                            : Colors.red),
                                    borderRadius:
                                    BorderRadius.circular(10.0),
                                    color: Colors.grey.shade50),
                                // width: MediaQuery.of(context).size.width - 40,
                                child: ListTile(
                                  leading: Image.asset(
                                    AppAssets.drawer_location,
                                    width: AddSize.size15,
                                  ),
                                  title: Text(
                                    _address ?? "Location".toString(),
                                    style: TextStyle(
                                        fontSize: AddSize.font14),
                                  ),
                                  trailing: const Icon(Icons.search),
                                  dense: true,
                                )),
                            checkValidation(
                                showValidation.value, _address == "")
                                ? Padding(
                              padding: EdgeInsets.only(
                                  top: AddSize.size5),
                              child: Text(
                                "      Location is required",
                                style: TextStyle(
                                    color: Colors.red.shade700,
                                    fontSize: AddSize.font12),
                              ),
                            )
                                : SizedBox()
                          ],
                        )),
                    // RegisterTextFieldWidget(
                    //   controller: addressController,
                    //   onTap: () {},
                    //   hint: 'Address',
                    //   validator: MultiValidator([
                    //     RequiredValidator(errorText: "Please Enter your Address")
                    //   ]),
                    // ),
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
                       controller: dobController,
                      hint: selectedDate,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          initialEntryMode: DatePickerEntryMode.calendarOnly,
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: const ColorScheme.light(
                                    primary: AppTheme.primaryColor,
                                    onPrimary: Colors.white,
                                    onSurface:
                                    AppTheme.buttonColor // body text color
                                ),
                                textButtonTheme: TextButtonThemeData(
                                  style: TextButton.styleFrom(
                                    foregroundColor: AppTheme
                                        .buttonColor, // button text color
                                  ),
                                ),
                              ),
                              child: child!,
                            );
                          },

                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime.now(),
                        );

                        if (pickedDate != null) {
                          print(
                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                          DateFormat('yyyy-dd-MM').format(pickedDate);
                          print(formattedDate); //formatted date output using intl package =>  2021-03-16
                          setState(() {
                            dobController.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {}
                      },
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Please Enter your DOB")
                      ]),
                    ),
                    addHeight(25),
                    Text("Identity Card Number",
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color:const Color(0xFF000000),
                        // fontStyle: FontStyle.italic,
                      ),),
                    const SizedBox(height: 10,),

                    RegisterTextFieldWidget(
                      keyboardType: TextInputType.number,
                      controller: IdentityController,
                      onTap: () {},
                      hint: 'Identity Card Number',
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Please Enter your Identity Number")
                      ]),
                    ),
                    addHeight(25),
                    Text("Insurance Number",
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color:const Color(0xFF000000),
                        // fontStyle: FontStyle.italic,
                      ),),
                    const SizedBox(height: 10,),

                    RegisterTextFieldWidget(
                      keyboardType: TextInputType.number,
                      controller: insuranceController,
                      onTap: () {},
                      hint: 'Insurance Number',
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Please Enter your Pan Card Number")
                      ]),
                    ),
                    addHeight(25),
                    Text("Vehicle Number",
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color:const Color(0xFF000000),
                        // fontStyle: FontStyle.italic,
                      ),),
                    const SizedBox(height: 10,),

                    RegisterTextFieldWidget(
                      controller: vichleController,
                      onTap: () {},
                      hint: 'Vehicle Number',
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Please Enter your Vehicle Number")
                      ]),
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
                      controller: licenceController,
                      onTap: () {},
                      hint: 'Licence Number',
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Please Enter your Licence Number")
                      ]),
                    ),

                    addHeight(25),
                     Text('Upload Insurance image',
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
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
                          NewHelper().addFilePicker().then((value) {
                            image1.value = value!;
                          });
                        },
                        child: image1.value.path == "" ?
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
                          image1.value,
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
                        fontSize: 16,
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
                                NewHelper().addFilePicker().then((value) {
                                  image2.value = value!;
                                });
                              },
                              child: image2.value.path == "" ?
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
                                image2.value,
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
                                NewHelper().addFilePicker().then((value) {
                                  image3.value = value!;
                                });
                              },
                              child: image3.value.path == "" ?
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
                                image3.value,
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
                    // Text('Upload Pan Card',
                    //   style: GoogleFonts.quicksand(
                    //     fontWeight: FontWeight.w600,
                    //     fontSize: 16,
                    //     color:const Color(0xFF000000),
                    //     // fontStyle: FontStyle.italic,
                    //   ),),
                    // const SizedBox(height: 10,),
                    // Container(
                    //   padding: const EdgeInsets.symmetric(vertical: 18),
                    //   width: AddSize.screenWidth,
                    //   decoration: BoxDecoration(
                    //       color: const Color(0xFFF4F4F4),
                    //       borderRadius: BorderRadius.circular(4),
                    //       border: Border.all(color: const Color(0xFFE2E2E2),
                    //           width: 1)
                    //   ),
                    //   child: InkWell(
                    //     onTap: () {
                    //       NewHelper().addFilePicker().then((value) {
                    //         image3.value = value!;
                    //       });
                    //     },
                    //     child: image3.value.path == "" ?
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.center,
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         Text('Upload',
                    //           style: GoogleFonts.quicksand(
                    //             fontWeight: FontWeight.w600,
                    //             fontSize: 15,
                    //             color:const Color(0xFF000000),
                    //             // fontStyle: FontStyle.italic,
                    //           ),),
                    //         addHeight(10),
                    //         Image.asset('assets/images/camera.png', height: 60,)
                    //       ],
                    //     ) : Image.file(
                    //       image3.value,
                    //       fit: BoxFit.contain,
                    //       height: 100,
                    //       width: 92,
                    //     ),
                    //   ),
                    // ),
                    // addHeight(25),
                    Text('Upload Identity Card',
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
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
                                NewHelper().addFilePicker().then((value) {
                                  image4.value = value!;
                                });
                              },
                              child: image4.value.path == "" ?
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
                                image4.value,
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
                                NewHelper().addFilePicker().then((value) {
                                  image5.value = value!;
                                });
                              },
                              child: image5.value.path == "" ?
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
                                image5.value,
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
                // Get.toNamed(MyRouters.thankYouVendorScreen);
                    CommonButton1(title: 'Apply',
                      onPressed: () {
                      print("Hello");
                      if (_formKey.currentState!.validate() &&
                          image1.value.path != "" &&
                          image2.value.path != "" &&
                          image3.value.path != "" &&
                          image4.value.path != "" &&
                          image5.value.path != "") {
                        Map<String, String> mapData = {
                          'identity_card':
                          IdentityController.text.trim(),
                          'insurance_no'
                              '':
                          insuranceController.text.trim(),
                          'dob': dobController.text,
                          'vehicle_no': vichleController.text,
                          'licence_no': licenceController.text,
                          'first_name': nameController.text,
                          'middle_name': middleNameController.text,
                          'last_name': lastNameController.text,
                          'email': emailController.text,
                          'phone': phoneController.text,
                          'password': passwordController.text,
                          'location': _address.toString(),
                        };
                        driverRegistrationRepo(
                          context: context,
                          mapData: mapData,
                          fieldName1: "insurance",
                          fieldName2: "id_front_image",
                          fieldName3: "id_back_image",
                          fieldName4: "licence_front_image",
                          fieldName5: "licence_back_image",
                          file1: image1.value,
                          file2: image2.value,
                          file3: image3.value,
                          file4: image4.value,
                          file5: image5.value,
                        ).then((value) {
                          if (value.status == true) {
                            showToast(
                                "${value.message} Wait For Admin Approval");
                            Get.to(()=>const ThankYouVendorScreen());
                          } else {
                            showToast(value.message);
                          }
                        });
                      }
                      //showValidation.value = true;
                      // if (dateOfBirth.text.isEmpty) {
                      //   scrollNavigation(0);
                      // } else if (adharNoController.text
                      //     .trim()
                      //     .isEmpty ||
                      //     adharNoController.text.length < 12) {
                      //   scrollNavigation(50);
                      // } else if (panNoController.text
                      //     .trim()
                      //     .isEmpty ||
                      //     panNoController.text.length < 10) {
                      //   scrollNavigation(50);
                      // } else if (vehicleNumber.text.trim().isEmpty ||
                      //     vehicleNumber.text.length < 14) {
                      //   scrollNavigation(50);
                      // } else if (licenceNumber.text.trim().isEmpty) {
                      //   scrollNavigation(50);
                      // }
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
