import 'package:buypass_seller/src/core/routes/routes.dart';
import 'package:buypass_seller/src/feature/on_boarding/authentication/presentation/pages/sign_in_page.dart';
import 'package:buypass_seller/src/core/local/repository/local_storage_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final shellKey = GlobalKey<NavigatorState>();
final shellKeySettings = GlobalKey<NavigatorState>();
final routerConfigProvider = Provider((ref) {
  return GoRouter(
    redirect: (BuildContext context, GoRouterState state) async {
      bool isLogin = ref.watch(localDataProvider).isLogin;
      if (!isLogin) {
        return AppRoutes.signIn.path;
      } else if (isLogin && state.path == null) {
        //call dashboard here
        return null;
      }
      return null;
    },
    debugLogDiagnostics: kDebugMode,
    navigatorKey: navigatorKey,
    initialLocation: AppRoutes.signIn.path,
    routes: [
      GoRoute(
        path: AppRoutes.signIn.path,
        name: AppRoutes.signIn.name,
        builder: (BuildContext context, GoRouterState state) {
          return SignInPage();
        },
      ),

      // ShellRoute(
      //   navigatorKey: shellKey,
      //   builder: (context, state, body) {
      //     return NavBar(body: body);
      //   },

      //   routes:[
      //       GoRoute(
      //       path: AppRoutes.courseDetailsPage.path,
      //       name: AppRoutes.courseDetailsPage.name,
      //       builder: (BuildContext context, GoRouterState state) {
      //         final title = state.uri.queryParameters["id"] ?? "";

      //         return CourseDetailsPage(courseId: title);
      //       },
      //     ),

      //   ]  ),
    ],
  );
});
