// import 'package:firebase_auth/firebase_auth.dart';

enum AppRoutes {
  signIn('sign-in', '/sign-in')
 ;

  final String name;
  final String path;

  const AppRoutes(this.name, this.path);

  static String get initialLocation =>  AppRoutes.signIn.path;

  // FirebaseAuth.instance.currentUser == null
  //     ? AppRoutes.signIn.path
  //     : AppRoutes.home.path;
  static List<AppRoutes> bottomNavPages = [

  ];
  static List<AppRoutes> webNavBarPages = [

  ];
  static List<AppRoutes> settingsNavPages = [
  
  ];

  static List<AppRoutes> get publicRoutes => [
    AppRoutes.signIn,

  ];
}
