// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:assignment/contants/colors.dart';
import 'package:assignment/feature/profile/controller.dart';
import 'package:assignment/feature/profile/profile_dashboard.dart';
import 'package:assignment/services/local_storage.dart';
import 'package:assignment/widgets/border_btn.dart';
import 'package:assignment/widgets/colored_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CompleteProfilePage extends StatelessWidget {
  CompleteProfilePage({super.key});

  static const routePath = "/complete_profile";

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBarBackground,
      appBar: AppBar(
        backgroundColor: AppColors.appBarBackground,
        title: Text("Profile", style: NormalTextStyle.appBarStyle),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
            size: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              ProiflePicAndEdit(),
              FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: [
                      FormBuilderTextField(
                        controller:nameController ,
                        name: "Full Name",
                        decoration: InputDecoration(
                          hintText: "Full Name",
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      Gap(20),
                      IntlPhoneField(
                        controller: phoneController,
                        initialCountryCode: "IN",
                        disableLengthCheck: true,
                        decoration: InputDecoration(
                            hintText: "Phone Number",
                            hintStyle: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            )),
                      ),
                      Gap(20),
                      FormBuilderTextField(
                        name: "Email",
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      Gap(20),
                    ],
                  )),
              Gap(20),
              Row(
                children: [
                  Expanded(
                      child: BorderButton(heading: "Cancel", ontap: () {
                        context.pop();
                      })),
                  Gap(15),
                  Expanded(child: ColoredButton(heading: "Save", ontap: () {
                    LocalStorage.saveUserData();
                    context.pushReplacement(ProfileDashBoard.routePath);
                  })),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProiflePicAndEdit extends StatelessWidget {
  const ProiflePicAndEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
      child: Stack(
        children: [
          CircleAvatar(
            radius: 65,
            backgroundColor: Color(0xffD0D0D0),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.redColor,
                ),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.camera_alt_outlined,
                    size: 15,
                    color: Colors.white,
                  ),
                )),
          )
        ],
      ),
    );
  }
}
