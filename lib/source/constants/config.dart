import 'package:flutter/foundation.dart';

class AppConst {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  AppConst._();
}

String get GOOGLE_CLIENT_ID {
  if (defaultTargetPlatform == TargetPlatform.macOS) {
    return '406099696497-65v1b9ffv6sgfqngfjab5ol5qdikh2rm.apps.googleusercontent.com';
  } else if (defaultTargetPlatform == TargetPlatform.iOS) {
    return '406099696497-65v1b9ffv6sgfqngfjab5ol5qdikh2rm.apps.googleusercontent.com';
  } else if (defaultTargetPlatform == TargetPlatform.windows) {
    return '406099696497-a12gakvts4epfk5pkio7dphc1anjiggc.apps.googleusercontent.com';
  } else {
    return '448618578101-sg12d2qin42cpr00f8b0gehs5s7inm0v.apps.googleusercontent.com';
  }
}

const GOOGLE_REDIRECT_URI = 'https://react-native-firebase-testing.firebaseapp.com/__/auth/handler';

const FACEBOOK_CLIENT_ID = '128693022464535';
