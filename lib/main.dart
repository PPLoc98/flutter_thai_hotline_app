import 'package:flutter/material.dart';
import 'package:flutter_thai_hotline_app/views/splash_screen_ui.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const FlutterThaiHotlineApp());
}

class FlutterThaiHotlineApp extends StatefulWidget {
  const FlutterThaiHotlineApp({super.key});

  @override
  State<FlutterThaiHotlineApp> createState() => _FlutterThaiHotlineAppState();
}

class _FlutterThaiHotlineAppState extends State<FlutterThaiHotlineApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //คำสั่งปิดแถบ debug banner
      debugShowCheckedModeBanner: false,
      //กำหนดเรียกใช้งานหน้าจอหลักของแอปพลิเคชัน
      home: SplashScreenUI(),
      //กำหนด theme ของแอปพลิเคชัน โดยเฉพาะ ฟอนต์หลักแอป
      theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
                fontFamily: GoogleFonts.kanit().fontFamily,
                fontFamilyFallback: GoogleFonts.kanit().fontFamilyFallback,
              )),
    );
  }
}
