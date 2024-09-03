import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Future.delayed(const Duration(seconds: 3));
  FlutterNativeSplash.remove();
  runApp(const BokllyApp());
}

class BokllyApp extends StatelessWidget {
  const BokllyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: false).copyWith(
        scaffoldBackgroundColor: kprimarycolor,
        textTheme: GoogleFonts.montserratTextTheme(
          ThemeData.dark(useMaterial3: false).textTheme,
        ),
      ),
      routerConfig: AppRouter.router,
    );
  }
}
