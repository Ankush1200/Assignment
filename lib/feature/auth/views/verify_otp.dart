import 'package:assignment/contants/colors.dart';
import 'package:assignment/feature/auth/controller/controller.dart';
import 'package:assignment/services/auth_services.dart';
import 'package:assignment/widgets/colored_btn.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

// ignore: must_be_immutable
class VerifyOTP extends StatelessWidget {
String verificationId;
VerifyOTP({super.key,required this.verificationId});

  static const routePath="/verify_otp";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBarBackground,
      appBar: AppBar(
        backgroundColor: AppColors.appBarBackground,
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("Phone verification", style: NormalTextStyle.heading1Style),
            const Gap(20),
            Text("Enter your OTP code", style: NormalTextStyle.heading2Style),
            const Gap(30),
            Pinput(
              controller: otpControler,
              defaultPinTheme: PinTheme(
                width: 56,
                height: 56,
                textStyle:NormalTextStyle.heading1Style,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 1,color: const Color(0xffD0D0D0)),
                ),
                ),
                submittedPinTheme:PinTheme(
                  width: 56,
                  height: 56,
                  textStyle:NormalTextStyle.heading1Style,
                    decoration: BoxDecoration(
                      color: AppColors.redColor.withOpacity(0.2),
                      border: Border.all(width: 1,color:AppColors.redColor),
                      borderRadius: BorderRadius.circular(8),
                    )
                  ), 
                  focusedPinTheme: PinTheme(
                      width: 56,
                      height: 56,
                      textStyle:NormalTextStyle.textStyle,
                      decoration: BoxDecoration(
                        color:  AppColors.redColor.withOpacity(0.2),
                        border: Border.all(width: 1,color: AppColors.redColor),
                        borderRadius: BorderRadius.circular(8),
                      )
                    ),
                    // validator: (s) {
                    //   // print(s);
                    // },
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: true,
                    length: 6,
                    keyboardType: TextInputType.number,
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Didn’t receive code? ", style: NormalTextStyle.textStyle),
                const Text('Resend again.',style: TextStyle(color: AppColors.redColor),)
              ],
            ),
            const Gap(50),
            ColoredButton(heading: "Verify", ontap: (){
              AuthServices.signInWithOTP(verificationId,context);
            }),
          ],
        ),
      ),
    );
  }
}