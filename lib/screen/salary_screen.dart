import 'package:anandmart_driver/widgets/custome_textfiled.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Resources/common_text.dart';

class SalaryScreen extends StatefulWidget {
  const SalaryScreen({super.key});

  @override
  State<SalaryScreen> createState() => _SalaryScreenState();
}

class _SalaryScreenState extends State<SalaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: backAppBar(title: "My Salary", context: context),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 25),
                child: Container(
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF5F5F5F).withOpacity(0.2),
                        offset: const Offset(0.0, 0.2),
                        blurRadius: 2,
                      ),
                    ]),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Month",
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                              color: const Color(0xFF4DBA4D),
                              // fontStyle: FontStyle.italic,
                            ),
                          ),
                          Text(
                            "Salary",
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                              color: const Color(0xFF4DBA4D),
                              // fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      const Divider(
                        height: 5,
                        color: Color(0xffEFEFEF),
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "January",
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: const Color(0xFF8C9BB2),
                              // fontStyle: FontStyle.italic,
                            ),
                          ),
                          Text(
                            "₹7,969.00",
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: const Color(0xFF454B5C),
                              // fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      const Divider(
                        height: 5,
                        color: Color(0xffEFEFEF),
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "February",
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: const Color(0xFF8C9BB2),
                              // fontStyle: FontStyle.italic,
                            ),
                          ),
                          Text(
                            "₹7,969.00",
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: const Color(0xFF454B5C),
                              // fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      const Divider(
                        height: 5,
                        color: Color(0xffEFEFEF),
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "March",
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: const Color(0xFF8C9BB2),
                              // fontStyle: FontStyle.italic,
                            ),
                          ),
                          Text(
                            "₹7,969.00",
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: const Color(0xFF454B5C),
                              // fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      const Divider(
                        height: 5,
                        color: Color(0xffEFEFEF),
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "April",
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: const Color(0xFF8C9BB2),
                              // fontStyle: FontStyle.italic,
                            ),
                          ),
                          Text(
                            "₹7,969.00",
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: const Color(0xFF454B5C),
                              // fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ]))),
          ],
        )));
  }
}
