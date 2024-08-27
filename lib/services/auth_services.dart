import 'dart:developer';
import 'package:assignment/feature/auth/controller/controller.dart';
import 'package:assignment/feature/profile/profile_dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

class AuthServices{
  static void verifyingPhoneNumber(BuildContext context)async{
    FirebaseAuth auth=FirebaseAuth.instance;

    await auth.verifyPhoneNumber(
      phoneNumber:'+91${phoneControler.text.trim()}',
      verificationCompleted:(PhoneAuthCredential phoneAuthCredential)async{
        await auth.signInWithCredential(phoneAuthCredential);
      }, 
      verificationFailed:(FirebaseAuthException error){
        log("${error.message}");
      }, 
      codeSent:(String verificationId,int?tokenID){
        context.go('/verify-otp/$verificationId',);

        // context.go('${VerifyOTP.routePath}/$verificationId',);
      }, 
      codeAutoRetrievalTimeout:(String verificationCode){
        // Auto Retriveal time out
      } 
    );
  }

  static void signInWithOTP(String verificationid,BuildContext context)async{
    FirebaseAuth auth=FirebaseAuth.instance;
    
    PhoneAuthCredential authCredential=PhoneAuthProvider.credential(
      verificationId:verificationid,
      smsCode:otpControler.text.trim(), 
    );
    try{
      await auth.signInWithCredential(authCredential);
      // ignore: use_build_context_synchronously
      context.pushReplacement(ProfileDashBoard.routePath);
    }catch(e){
      log('$e');
    }
  }

  static Future<void> requestLocationPermission()async {
    var status=await Permission.location.request();
    if(status.isGranted){
      log('Permission Granted');
    }else if(status.isDenied){
      log('Permission Denied');
    }else if(status.isPermanentlyDenied){
      openAppSettings();
    }
  }

  static Future<Position> getUserLocation() async{
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high
    );
  }

}