
import 'package:assignment/feature/auth/views/sign_up.dart';
import 'package:assignment/feature/auth/views/verify_otp.dart';
import 'package:assignment/feature/profile/complete_profile.dart';
import 'package:assignment/feature/profile/profile_dashboard.dart';
import 'package:go_router/go_router.dart';

final GoRouter router=GoRouter(
  initialLocation: SignUpPage.routePath,
  routes:[
    GoRoute(path: SignUpPage.routePath,builder:(context,state)=>const SignUpPage()),

    GoRoute(
      path: '/verify-otp/:verificationId',
      builder: (context, state) {
        final verificationId = state.pathParameters['verificationId']!;
        return VerifyOTP(verificationId: verificationId);
      },
    ),

    GoRoute(path:CompleteProfilePage.routePath,builder:(context,state)=> CompleteProfilePage()),

    GoRoute(path: ProfileDashBoard.routePath,builder: (context,state)=>const ProfileDashBoard()),
  ]
);