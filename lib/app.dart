import 'package:buypass_seller/src/core/routes/router.dart';
import 'package:buypass_seller/src/shared/app_start/presentation/app_start_view.dart';
import 'package:buypass_seller/src/shared/custom_scroll_behavour.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(context, ref) {
    final goRouter = ref.watch(routerConfigProvider);
    final buttonStyle = ButtonStyle(
      iconColor: WidgetStateProperty.all<Color>(Colors.black),
      foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
      padding: WidgetStateProperty.all(const EdgeInsets.all(12)),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      ),
    );
    return GestureDetector(
      onTap: () {
        //Will close keyboard
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp.router(
        scrollBehavior: MyCustomScrollBehavior(),

        theme: ThemeData(
          // canvasColor: AppColors.pageColor,
          brightness: Brightness.light,
          visualDensity: VisualDensity.standard,
          useMaterial3: true,
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(style: buttonStyle),
          textButtonTheme: TextButtonThemeData(style: buttonStyle),
          outlinedButtonTheme: OutlinedButtonThemeData(style: buttonStyle),
        ),
        title: 'Buypass Seller',
        debugShowCheckedModeBanner: false,
        // home: HomeScreen(),
        routerConfig: goRouter,
        builder: (_, child) {
          return AppStartupWidget(onLoaded: (_) => MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
            child: child!,
          ),);
        },
      ),
    );
  }
}
