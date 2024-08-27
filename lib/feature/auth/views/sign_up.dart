import 'package:assignment/contants/colors.dart';
import 'package:assignment/feature/auth/controller/controller.dart';
import 'package:assignment/services/auth_services.dart';
import 'package:assignment/widgets/colored_btn.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  static const routePath = "/sign_up_page";

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isChecked = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBarBackground,
      appBar: AppBar(
        backgroundColor: AppColors.appBarBackground,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Sign Up",
          style: NormalTextStyle.appBarStyle,
        ),
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
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(20),
              Text(
                "Enter your phone number",
                style: NormalTextStyle.textStyle,
              ),
              const Gap(20),
              IntlPhoneField(
                controller: phoneControler,
                disableLengthCheck: true,
                initialCountryCode: "IN",
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:const BorderSide(width: 1, color: AppColors.redColor),
                )),
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    value: isChecked,
                    shape: const CircleBorder(),
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  Column(
                    children: [
                      Text(
                        "By verifying the phone number. you \nagree to the Terms of service and \nPrivacy policy.",
                        style: NormalTextStyle.textStyle,
                      ),
                    ],
                  ),
                ],
              ),
              const Gap(30),
              ColoredButton(heading: 'Verify Phone number', ontap: () {
                AuthServices.verifyingPhoneNumber(context);
              })
            ],
          ),
        ),
      ),
    );
  }
}
